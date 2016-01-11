package asmCodeGenerator;

import java.util.HashMap;
import java.util.Map;

import asmCodeGenerator.codeStorage.*;
import asmCodeGenerator.runtime.*;
import lexicalAnalyzer.*;
import parseTree.*;
import parseTree.nodeTypes.*;
import parseTree.nodeTypes.ControlFlowTypes.*;
import parseTree.nodeTypes.GlobalDefTypes.*;
import parseTree.nodeTypes.LeafTypes.*;
import parseTree.nodeTypes.OperatorNodeTypes.*;
import parseTree.nodeTypes.PrintTypes.*;
import semanticAnalyzer.signatures.FunctionSignature;
import semanticAnalyzer.types.*;
import symbolTable.Scope;
import symbolTable.Binding.Binding;
import symbolTable.Binding.FunctionBinding;
import tokens.Token;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

// do not call the code generator if any errors have occurred during analysis.
public class ASMCodeGenerator {
	private static Labeller labeller = new Labeller();

	ParseNode root;

	public static ASMCodeFragment generate(ParseNode syntaxTree) {
		ASMCodeGenerator codeGenerator = new ASMCodeGenerator(syntaxTree);
		return codeGenerator.makeASM();
	}
	public ASMCodeGenerator(ParseNode root) {
		super();
		this.root = root;
	}
	public static Labeller getLabeller() {
		return labeller;
	}
	
	public ASMCodeFragment makeASM() {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		
		code.append( MemoryManager.codeForInitialization() );
		code.append( RunTime.getEnvironment() );
		code.append( globalVariableBlockASM() );
		code.append( programASM() );
		code.append( MemoryManager.codeForAfterApplication() );
		
		return code;
	}
	private ASMCodeFragment globalVariableBlockASM() {
		assert root.hasScope();
		Scope scope = root.getScope();
		int globalBlockSize = scope.getAllocatedSize();
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		code.add(DLabel, RunTime.GLOBAL_MEMORY_BLOCK);
		code.add(DataZ, globalBlockSize);
		return code;
	}
	private ASMCodeFragment programASM() {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		
		code.add(    Label, RunTime.MAIN_PROGRAM_LABEL);
		code.append( programCode());
		code.add(    Halt );
		
		return code;
	}
	private ASMCodeFragment programCode() {
		CodeVisitor visitor = new CodeVisitor();
		root.accept(visitor);
		return visitor.removeRootCode(root);
	}


	private class CodeVisitor extends ParseNodeVisitor.Default {
		private Map<ParseNode, ASMCodeFragment> codeMap;
		ASMCodeFragment code;
		
		public CodeVisitor() {
			codeMap = new HashMap<ParseNode, ASMCodeFragment>();
		}


		////////////////////////////////////////////////////////////////////
        // Make the field "code" refer to a new fragment of different sorts.
		private void newAddressCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_ADDRESS);
			codeMap.put(node, code);
		}
		private void newValueCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_VALUE);
			codeMap.put(node, code);
		}
		private void newVoidCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_VOID);
			codeMap.put(node, code);
		}

	    ////////////////////////////////////////////////////////////////////
        // Get code from the map.
		private ASMCodeFragment getAndRemoveCode(ParseNode node) {
			ASMCodeFragment result = codeMap.get(node);
			codeMap.remove(result);
			return result;
		}
	    public ASMCodeFragment removeRootCode(ParseNode tree) {
			return getAndRemoveCode(tree);
		}
	    public ASMCodeFragment removeBlockCode(ParseNode tree) {
	    	return getAndRemoveCode(tree);
	    }
		private ASMCodeFragment removeValueCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			makeFragmentValueCode(frag, node);
			return frag;
		}		
		private ASMCodeFragment removeAddressCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			assert frag.isAddress();
			return frag;
		}		
		private ASMCodeFragment removeVoidCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			assert frag.isVoid();
			return frag;
		}
		
	    ////////////////////////////////////////////////////////////////////
        // convert code to value-generating code.
		private void makeFragmentValueCode(ASMCodeFragment code, ParseNode node) {
			assert !code.isVoid();
			
			if(code.isAddress()) {
				turnAddressIntoValue(code, node);
			}	
		}
		private void turnAddressIntoValue(ASMCodeFragment code, ParseNode node) {
			if(node.getType() == PrimitiveType.INTEGER) {
				code.add(LoadI);
			}
			else if(node.getType() == PrimitiveType.FLOAT) {
				code.add(LoadF);
			}
			else if(node.getType() == PrimitiveType.CHARACTER) {
				code.add(LoadC);
			}
			else if(node.getType() == PrimitiveType.STRING) {
				code.add(LoadI);
			}
			else if(node.getType() == PrimitiveType.BOOLEAN) {
				code.add(LoadC);
			}
			else if(node.getType().isReferenceType()) {
				code.add(LoadI);
			}
			else {
				assert false : "node " + node;
			}
			code.markAsValue();
		}
		
	    ////////////////////////////////////////////////////////////////////
        // ensures all types of ParseNode in given AST have at least a visitLeave	
		public void visitLeave(ParseNode node) {
			assert false : "node " + node + " not handled in ASMCodeGenerator";
		}
		
		///////////////////////////////////////////////////////////////////////////
		// constructs larger than statements
		public void visitLeave(ProgramNode node) {
			newVoidCode(node);
			programChildrenIteration(node);
		}
		public void visitLeave(MainBlockNode node) {
			newVoidCode(node);
			childrenIteration(node);
		}
		public void visitLeave(BlockNode node) {
			newVoidCode(node);
			childrenIteration(node);
		}
		private void childrenIteration(ParseNode node) {
			for(ParseNode child : node.getChildren()) {
				ASMCodeFragment childCode = removeVoidCode(child);
				code.append(childCode);
			}
		}
		private void programChildrenIteration(ParseNode node) {
			for(ParseNode child : node.getChildren()) {
				if (child instanceof FunctionDefinitionNode) {
					String functionEnd = labeller.newLabel("-func-def-end-", "");
					
					ASMCodeFragment childCode = removeVoidCode(child.child(3));
					
					code.add(Jump, functionEnd);
					code.append(childCode);
					code.add(Label, functionEnd);
				}
				else if (!(child instanceof TupleDefinitionNode)) {
					ASMCodeFragment childCode = removeVoidCode(child);
					code.append(childCode);
				}
			}
		}

		///////////////////////////////////////////////////////////////////////////
		// print statements
		public void visitLeave(PrintStatementNode node) {
			newVoidCode(node);
			for(ParseNode child : node.getChildren()) {
				if(child instanceof NewlineNode || child instanceof SeparatorNode) {
					ASMCodeFragment childCode = removeVoidCode(child);
					code.append(childCode);
				}
				else if (child.getType() instanceof TupleType) {
					ASMCodeFragment childCode = removeValueCode(child);
					code.append(childCode);
					appendTuplePrintCode(child.getType());
				}
				else if (child.getType() instanceof ArrayType) {
					ASMCodeFragment childCode = removeValueCode(child);
					code.append(childCode);
					appendArrayPrintCode(child.getType());
				}
				else {
					ASMCodeFragment childCode = removeValueCode(child);
					code.append(childCode);
					appendPrintCode(child.getType());
				}
			}
		}
		public void visit(NewlineNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.NEWLINE_PRINT_FORMAT);
			code.add(Printf);
		}
		public void visit(SeparatorNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.SEPARATOR_PRINT_FORMAT);
			code.add(Printf);
		}
		private void appendTuplePrintCode(Type type) {
			TupleType tupleType = (TupleType) type;
			Type[] subTypes = tupleType.getSubTypes();
			
			String start = labeller.newLabel("-tuple-print-loop-start-", "");
			String end = labeller.newLabelSameNumber("-tuple-print-loop-end-", "");
			String nullCheck = labeller.newLabelSameNumber("-tuple-print-null-check-", "");
			String nullCatch = labeller.newLabelSameNumber("-tuple-print-null-catch-", "");
			
			code.add(PushD, RunTime.OPEN_PARENTHESE_PRINT_FORMAT);
			code.add(Printf);
			
			code.add(PushI, TupleType.ELEMENT_START_BYTE);
			code.add(Add);
	
			code.add(Label, start);

			for (int i = 0; i < subTypes.length; i++) {
				Type subType = subTypes[i];
				int subTypeSize = subType.getSize();
				
				// pre-increment memory location by subTypeSize
				code.add(Duplicate);
				code.add(PushI, subTypeSize);
				code.add(Add);
				code.add(Exchange);
				
				// load element (could be another array record / primitive)
				if (subType == PrimitiveType.CHARACTER) 	{code.add(LoadC);} 
				else if (subType == PrimitiveType.BOOLEAN) 	{code.add(LoadC);} 
				else if (subType == PrimitiveType.FLOAT) 	{code.add(LoadF);}
				else 										{code.add(LoadI);}
				
				// recursive call
				if (subType instanceof TupleType) {
					code.add(Duplicate);
					code.add(JumpTrue, nullCheck);
					code.add(Pop);
					code.add(PushD, RunTime.NULL_PRINT_FORMAT);
					code.add(Printf);
					
					code.add(Jump, nullCatch);
					code.add(Label, nullCheck);
					appendTuplePrintCode(subType);
				}
				else if (subType instanceof ArrayType) {					
					appendArrayPrintCode(subType);
				}
				else {
					appendPrintCode(subType);
				}
				
				code.add(Label, nullCatch);
				
				// if condition for printing a separator (, + space)		
				if (i < subTypes.length - 1) {
					
					code.add(PushD, RunTime.COMMA_PRINT_FORMAT);
					code.add(Printf);
					code.add(PushD, RunTime.SEPARATOR_PRINT_FORMAT);
					code.add(Printf);
				}
			}
			code.add(Label, end);
			
			code.add(PushD, RunTime.CLOSE_PARENTHESES_PRINT_FORMAT);
			code.add(Printf);
			code.add(Pop);
		}
			
			
		private void appendArrayPrintCode(Type type) {
			ArrayType arrayType = (ArrayType) type;
			Type subType = arrayType.getSubType();
			int subTypeSize = subType.getSize();
			
			String start = labeller.newLabel("-array-print-loop-start-", "");
			String end = labeller.newLabelSameNumber("-array-print-loop-end-", "");
			String nullCheck = labeller.newLabelSameNumber("-array-print-null-check-", "");
			String nullCatch = labeller.newLabelSameNumber("-array-print-null-catch-", "");
			String sysVar = labeller.newLabelSameNumber("-array-print-sys-var1-", "");
			String ifStart = labeller.newLabelSameNumber("-array-print-separate-start-", "");
			String ifEnd = labeller.newLabelSameNumber("-array-print-separate-end-", "");
			
			code.add(PushD, RunTime.OPEN_BRACKET_PRINT_FORMAT);
			code.add(Printf);
			
			code.add(Duplicate);
			code.add(PushI, ArrayType.LENGTH_START_BYTE);	// length of current array
			code.add(Add);
			code.add(LoadI);
			
			createSystemVariable(sysVar); // counter
			
			code.add(PushI, ArrayType.HEADER_LENGTH);		// memory points at the first element
			code.add(Add);
			
			
			code.add(Label, start);
			
			code.add(PushD, sysVar);						// check if the counter is zero
			code.add(LoadI);
			code.add(JumpFalse, end);
			
				
			// pre-increment memory location by subTypeSize
			code.add(Duplicate);
			code.add(PushI, subTypeSize);
			code.add(Add);
			code.add(Exchange);
			
			// load element (could be another array record / primitive)
			if (subType == PrimitiveType.CHARACTER) 	{code.add(LoadC);} 
			else if (subType == PrimitiveType.BOOLEAN) 	{code.add(LoadC);} 
			else if (subType == PrimitiveType.FLOAT) 	{code.add(LoadF);}
			else 										{code.add(LoadI);}
			
			// recursive call
			if (subType instanceof TupleType) {
				appendTuplePrintCode(subType);
			}
			else if (subType instanceof ArrayType) {
				code.add(Duplicate);
				code.add(JumpTrue, nullCheck);
				code.add(Pop);
				code.add(PushD, RunTime.NULL_PRINT_FORMAT);
				code.add(Printf);
				
				code.add(Jump, nullCatch);
				code.add(Label, nullCheck);
				appendArrayPrintCode(subType);
			}
			else {
				appendPrintCode(subType);
			}
			
			code.add(Label, nullCatch);
				
			// if condition for printing a separator (, + space)
			code.add(Label, ifStart);
			
			code.add(PushD, sysVar);
			code.add(LoadI);

			code.add(PushI, 1);
			code.add(Subtract);
			code.add(JumpFalse, ifEnd);
				
			code.add(PushD, RunTime.COMMA_PRINT_FORMAT);
			code.add(Printf);
			code.add(PushD, RunTime.SEPARATOR_PRINT_FORMAT);
			code.add(Printf);

			code.add(Label,ifEnd);
				
			// decrement the counter (counter goes length to 0)
			code.add(PushD, sysVar);
			code.add(Duplicate);
			code.add(LoadI);
			code.add(PushI, 1);
			code.add(Subtract);
			code.add(StoreI);
			
			// loop
			code.add(Jump, start);
			code.add(Label, end);

			code.add(PushD, RunTime.CLOSE_BRACKET_PRINT_FORMAT);
			code.add(Printf);
			code.add(Pop);
		}
		private void appendPrintCode(Type type) {
			String format = printFormat(type);
			
			printStringDataIfString(type);
			convertToStringIfBoolean(type);
			code.add(PushD, format);
			code.add(Printf);
		}
		private void printStringDataIfString(Type type) {
			if(type != PrimitiveType.STRING) {
				return;
			}
			String label = labeller.newLabel("-string-printable-format", "");
			
			code.add(Label, label);
			code.add(PushI, StringConstantNode.STRING_START_BYTE);
			code.add(Add);
		}
		private void convertToStringIfBoolean(Type type) {
			if(type != PrimitiveType.BOOLEAN) {
				return;
			}
			
			String trueLabel = labeller.newLabel("-print-boolean-true", "");
			String endLabel = labeller.newLabelSameNumber("-print-boolean-join", "");

			code.add(JumpTrue, trueLabel);
			code.add(PushD, RunTime.BOOLEAN_FALSE_STRING);
			code.add(Jump, endLabel);
			code.add(Label, trueLabel);
			code.add(PushD, RunTime.BOOLEAN_TRUE_STRING);
			code.add(Label, endLabel);
		}

		private String printFormat(Type type) {
			assert type instanceof PrimitiveType;
			
			switch ((PrimitiveType) type) {
			case STRING: 	return RunTime.STRING_PRINT_FORMAT;
			case INTEGER:	return RunTime.INTEGER_PRINT_FORMAT;
			case FLOAT:		return RunTime.FLOAT_PRINT_FORMAT;
			case CHARACTER:	return RunTime.CHARACTER_PRINT_FORMAT;
			case BOOLEAN:	return RunTime.BOOLEAN_PRINT_FORMAT;
			default:
				assert false : "Type " + type
						+ " unimplemented in ASMCodeGenerator.printFormat()";
				return "";
			}
		}

		public void visitLeave(NullNode node) {
			newValueCode(node);
			code.add(PushI, 0);
		}
		
		///////////////////////////////////////////////////////////////////////////
		// declaration
		public void visitEnter(StaticDeclarationNode node) {
			String staticVarLabel = labeller.newLabel("-static-var-", ""); 
			node.setStaticVar(staticVarLabel);
		}
		public void visitLeave(StaticDeclarationNode node) {
			newVoidCode(node);
			
			ASMCodeFragment frag = removeVoidCode(node.child(0));
			
			DeclarationNode declarationNode = (DeclarationNode) node.child(0);
			Type type = declarationNode.getType();
			
			code.add(DLabel, node.getStaticVar());
			if (type == PrimitiveType.BOOLEAN)			code.add(DataC, 0);
			else if (type == PrimitiveType.CHARACTER) 	code.add(DataC, 0);
			else if (type == PrimitiveType.FLOAT) 		code.add(DataF, 0.0);
			else 										code.add(DataI, 0);
		
			code.append(frag);
		}
		public void visitLeave(DeclarationNode node) {
			opForDecAndLet(node);
		}
		public void visitLeave(LetStatementNode node) {
			opForDecAndLet(node);
		}
		private void opForDecAndLet(ParseNode node) {
			newVoidCode(node);
			ASMCodeFragment lvalue = removeAddressCode(node.child(0));	
			ASMCodeFragment rvalue = removeValueCode(node.child(1));
			
			code.append(lvalue);
			code.append(rvalue);
			
			Type type = node.getType();
			code.add(opcodeForStore(type));
		}
		private ASMOpcode opcodeForStore(Type type) {
			if(type == PrimitiveType.INTEGER) {
				return StoreI;
			}
			if(type == PrimitiveType.FLOAT) {
				return StoreF;
			}
			if(type == PrimitiveType.CHARACTER) {
				return StoreC;
			}
			if(type == PrimitiveType.BOOLEAN) {
				return StoreC;
			}
			if(type.isReferenceType()) {
				return StoreI;
			}
			assert false: "Type " + type + " unimplemented in opcodeForStore()";
			return null;
		}
		
		///////////////////////////////////////////////////////////////////////////
		// statements
		public void visitLeave(IfStatementNode node) {
			
			newVoidCode(node);
			ASMCodeFragment lvalue = removeValueCode(node.child(0));	
			ASMCodeFragment block1 = removeBlockCode(node.child(1));
			
			String startLabel = labeller.newLabel("-if-cond-", "");
			String afterLabel = labeller.newLabelSameNumber("-if-false-", "");
			String EndLabel   = labeller.newLabelSameNumber("-if-else-", "");
			
			code.append(lvalue);
			
			code.add(Label, startLabel);
			code.add(JumpFalse, afterLabel);
			code.append(block1);
			
			if (node.nChildren() == 2)
				code.add(Label, afterLabel);
			else {
				code.add(Jump, EndLabel);
				code.add(Label, afterLabel);
				
				ASMCodeFragment block2 = removeBlockCode(node.child(2));
				code.append(block2);
				code.add(Label, EndLabel);
			}
		}
		
		public void visitEnter(WhileStatementNode node) {
			String loopStartLabel = labeller.newLabel("-while-loop-start-", "");
			String loopEndLabel = labeller.newLabelSameNumber("-while-loop-end-", "");
			
			node.setLoopStart(loopStartLabel);
			node.setLoopEnd(loopEndLabel);
		}
		
		public void visitLeave(WhileStatementNode node) {
			newVoidCode(node);
			ASMCodeFragment lvalue = removeValueCode(node.child(0));	
			ASMCodeFragment block1 = removeBlockCode(node.child(1));
			
			String startLabel = node.getLoopStart();
			String EndLabel = node.getLoopEnd();
			
			code.add(Label, startLabel);
			code.append(lvalue);
			code.add(JumpFalse, EndLabel);
			code.append(block1);
			code.add(Jump, startLabel);
			code.add(Label, EndLabel);
		}
		
		public void visitEnter(ForStatementNode node) {
			String loopStartLabel = labeller.newLabel("-for-loop-continue-", "");
			String loopEndLabel = labeller.newLabelSameNumber("-for-loop-end-", "");
			
			node.setLoopStart(loopStartLabel);
			node.setLoopEnd(loopEndLabel);
		}
		
		public void visitLeave(ForStatementNode node) {
			newVoidCode(node);
			ParseNode condNode = node.child(0);
			Token forOp = condNode.getToken();
			
			String start = labeller.newLabel("-for-statement-start-", "");
			String loopStart = labeller.newLabelSameNumber("-for-loop-start-", "");
			String loopContinue = node.getLoopStart();
			String loopEnd = node.getLoopEnd();

			String sysVar1 = labeller.newLabelSameNumber("-for-loop-sys-var1-", "");
			String sysVar2 = labeller.newLabelSameNumber("-for-loop-sys-var2-", "");
			String sysVar3 = labeller.newLabelSameNumber("-for-loop-sys-var3-", "");
			String sysVar4 = labeller.newLabelSameNumber("-for-loop-sys-var4-", "");
			String sysVar5 = labeller.newLabelSameNumber("-for-loop-sys-var5-", "");
			
			String trueLabel = labeller.newLabelSameNumber("-for-loop-true-", "");
			String falseLabel = labeller.newLabelSameNumber("-for-loop-false-", "");
			String joinLabel = labeller.newLabelSameNumber("-for-loop-join-", "");

			
			if (forOp.isLextant(Keyword.INDEX))
			{
				ASMCodeFragment frag1 = removeAddressCode(condNode.child(0));
				ASMCodeFragment frag2 = removeValueCode(condNode.child(1));
				ASMCodeFragment block = removeBlockCode(node.child(1));

				code.append(frag1);
				code.append(frag2);

				// get array length and save it as a system variable
				code.add(Label, start);
				code.add(PushI, ArrayType.LENGTH_START_BYTE);
				code.add(Add);
				code.add(LoadI);

				createSystemVariable(sysVar1);

				// init 0 to the index identifier
				code.add(Duplicate);
				code.add(PushI, 0);
				code.add(StoreI);

				code.add(Label, loopStart);

				// condition check, exit if counter i == length
				code.add(Duplicate);
				code.add(LoadI);
				code.add(PushD, sysVar1);
				code.add(LoadI);

				code.add(Exchange);
				code.add(Subtract);
				code.add(JumpFalse, loopEnd);
				code.append(block);

				code.add(Label, loopContinue);
				// increment the counter
				code.add(Duplicate);
				code.add(Duplicate);
				code.add(LoadI);
				code.add(PushI, 1);

				code.add(Add);
				code.add(StoreI);

				code.add(Jump, loopStart);
				code.add(Label, loopEnd);

				code.add(Pop);
			}
			
			else if (forOp.isLextant(Keyword.ELEMENT)) {
				Type subType = ((ArrayType)condNode.child(1).getType()).getSubType();
				int subTypeSize = subType.getSize();
				
				ASMCodeFragment frag1 = removeAddressCode(condNode.child(0));
				ASMCodeFragment frag2 = removeValueCode(condNode.child(1));
				ASMCodeFragment block = removeBlockCode(node.child(1));

				code.append(frag1);
				code.append(frag2);

				// get array length and save it as a system variable
				code.add(Label, start);
				
				code.add(Duplicate);
				code.add(PushI, ArrayType.LENGTH_START_BYTE);
				code.add(Add);
				code.add(LoadI);
				createSystemVariable(sysVar1);
				
				code.add(PushI, ArrayType.ELEMENT_START_BYTE);
				code.add(Add);
				createSystemVariable(sysVar2);

				// init 0 to the counter
				code.add(PushI, 0);
				createSystemVariable(sysVar3);

				code.add(Label, loopStart);

				// condition check, exit if counter i == length
				code.add(PushD, sysVar3);
				code.add(LoadI);
				code.add(PushD, sysVar1);
				code.add(LoadI);

				code.add(Exchange);
				code.add(Subtract);
				code.add(JumpFalse, loopEnd);
				
				// duplicate the identifier location
				code.add(Duplicate);
				
				// element at index i
				code.add(PushD, sysVar2);
				code.add(LoadI);
				
				if (subType == PrimitiveType.CHARACTER) 	{code.add(LoadC); code.add(StoreC);}
				else if (subType == PrimitiveType.BOOLEAN)	{code.add(LoadC); code.add(StoreC);}
				else if (subType == PrimitiveType.FLOAT) 	{code.add(LoadF); code.add(StoreF);}
				else										{code.add(LoadI); code.add(StoreI);}
				
				code.append(block);

				code.add(Label, loopContinue);
				// increment the element memory location by subtype size
				code.add(PushD, sysVar2);
				code.add(Duplicate);
				code.add(LoadI);
				code.add(PushI, subTypeSize);
				code.add(Add);
				code.add(StoreI);

				// increment the counter
				code.add(PushD, sysVar3);
				code.add(Duplicate);
				code.add(LoadI);
				code.add(PushI, 1);

				code.add(Add);
				code.add(StoreI);

				code.add(Jump, loopStart);
				code.add(Label, loopEnd);

				code.add(Pop);
			}
			
			else if (forOp.isLextant(Keyword.PAIR)) {
				Type subType = ((ArrayType)condNode.child(2).getType()).getSubType();
				int subTypeSize = subType.getSize();
				
				ASMCodeFragment frag1 = removeAddressCode(condNode.child(0));
				ASMCodeFragment frag2 = removeAddressCode(condNode.child(1));
				ASMCodeFragment frag3 = removeValueCode(condNode.child(2));
				ASMCodeFragment block = removeBlockCode(node.child(1));
	
				code.append(frag2);
				code.append(frag1);
				code.append(frag3);
				
				// get array length and save it as a system variable
				code.add(Label, start);
				
				code.add(Duplicate);
				code.add(PushI, ArrayType.LENGTH_START_BYTE);
				code.add(Add);
				code.add(LoadI);
				createSystemVariable(sysVar1);
				
				// get element start byte and save it as a system variable
				code.add(PushI, ArrayType.ELEMENT_START_BYTE);
				code.add(Add);
				createSystemVariable(sysVar2);
				
				// save the location of id1 as a system variable
				createSystemVariable(sysVar4);
				code.add(PushD, sysVar4);
				code.add(LoadI);
				code.add(PushI, 0);
				code.add(StoreI);
				
				// save the counter as a system variable
				code.add(PushI, 0);
				createSystemVariable(sysVar5);
							
				code.add(Label, loopStart);
				
				// condition check, exit if counter i == length
				code.add(PushD, sysVar5);
				code.add(LoadI);
				code.add(PushD, sysVar1);
				code.add(LoadI);

				code.add(Exchange);
				code.add(Subtract);
				code.add(JumpFalse, loopEnd);
				
				// duplicate the identifier location
				code.add(Duplicate);
				
				// element at index i
				code.add(PushD, sysVar2);
				code.add(LoadI);

				if (subType == PrimitiveType.CHARACTER) 	{code.add(LoadC); code.add(StoreC);}
				else if (subType == PrimitiveType.BOOLEAN)	{code.add(LoadC); code.add(StoreC);}
				else if (subType == PrimitiveType.FLOAT) 	{code.add(LoadF); code.add(StoreF);}
				else										{code.add(LoadI); code.add(StoreI);}
				
				code.append(block);
				
				code.add(Label, loopContinue);
				// increment the element memory location by subtype size
				code.add(PushD, sysVar2);
				code.add(Duplicate);
				code.add(LoadI);
				code.add(PushI, subTypeSize);
				code.add(Add);
				code.add(StoreI);
				
				// increment the counter
				code.add(PushD, sysVar5);
				code.add(Duplicate);
				code.add(LoadI);
				code.add(PushI, 1);

				code.add(Add);
				code.add(StoreI);
				
				code.add(PushD, sysVar4);
				code.add(LoadI);
				code.add(PushD, sysVar5);
				code.add(LoadI);
				code.add(StoreI);
				
				code.add(Jump, loopStart);
				code.add(Label, loopEnd);

				code.add(Pop);
			}
			
			else if (forOp.isLextant(Keyword.EVER)) {
				ASMCodeFragment block = removeBlockCode(node.child(1));
				
				code.add(Label, loopStart);

				code.append(block);

				code.add(Label, loopContinue);
				code.add(Jump, loopStart);
				code.add(Label, loopEnd);
			}
			
			else if (forOp.isLextant(Keyword.COUNT)) {
				ASMCodeFragment block = removeBlockCode(node.child(1));
				
				if (condNode.nChildren() == 1) {
					BinaryOperatorNode bNode = (BinaryOperatorNode)condNode.child(0);
					ASMCodeFragment frag = removeVoidCode(bNode);

					code.append(frag);
					createSystemVariable(sysVar1);

					// init 0 to the index identifier
					code.add(Duplicate);
					code.add(PushI, 0);
					code.add(StoreI);

					code.add(Label, loopStart);

					// condition check, exit if counter i lessOp arg1
					code.add(Duplicate);
					code.add(LoadI);
					code.add(PushD, sysVar1);
					code.add(LoadI);

					comparisonOperatorCodeGenerator(bNode, trueLabel, falseLabel, joinLabel);
					
					code.add(JumpFalse, loopEnd);
					code.append(block);
					
					code.add(Label, loopContinue);
					// increment the counter
					code.add(Duplicate);
					code.add(Duplicate);
					code.add(LoadI);
					code.add(PushI, 1);

					code.add(Add);
					code.add(StoreI);

					code.add(Jump, loopStart);
					code.add(Label, loopEnd);

					code.add(Pop);
				}
				else if (condNode.nChildren() == 2) {
					BinaryOperatorNode bNode1 = (BinaryOperatorNode)condNode.child(0);
					BinaryOperatorNode bNode2 = (BinaryOperatorNode)condNode.child(1);
					
					ASMCodeFragment frag1 = removeVoidCode(bNode1);
					ASMCodeFragment frag2 = removeVoidCode(bNode2);
					
					Token operator = bNode1.getToken();

					code.append(frag1);
					code.append(frag2);
					createSystemVariable(sysVar2);
					code.add(Pop);
					
					code.add(Exchange);
					createSystemVariable(sysVar1);
						
					// init the counter = first argument + 1 if op = less
					// counter = first argument if op = lessOrEqual
					code.add(Duplicate);
					code.add(PushD, sysVar1);
					code.add(LoadI);
					
					if (operator.isLextant(Punctuator.LESS)) {
						code.add(PushI, 1);
						code.add(Add);
					}
					
					code.add(StoreI);

					code.add(Label, loopStart);
					
					// second condition check, exit if counter i lessOp arg2
					code.add(Duplicate);
					code.add(LoadI);
					code.add(PushD, sysVar2);
					code.add(LoadI);

					comparisonOperatorCodeGenerator(bNode2, trueLabel, falseLabel, joinLabel);
					code.add(JumpFalse, loopEnd);				
					
					code.append(block);
					
					code.add(Label, loopContinue);
					// increment the counter
					code.add(Duplicate);
					code.add(Duplicate);
					code.add(LoadI);
					code.add(PushI, 1);

					code.add(Add);
					code.add(StoreI);

					code.add(Jump, loopStart);
					code.add(Label, loopEnd);

					code.add(Pop);
				}
			}
		}
		
		public void visit(BreakStatementNode node) {
			newVoidCode(node);
			
			LoopStatementNode loopNode = node.getLoopNode();
			String loopEndLabel = loopNode.getLoopEnd();
			
			code.add(Jump, loopEndLabel);
		}
		
		public void visit(ContinueStatementNode node) {
			newVoidCode(node);
			
			LoopStatementNode loopNode = node.getLoopNode();
			String loopStartLabel = loopNode.getLoopStart();
			
			code.add(Jump, loopStartLabel);
		}
		
		public void visit(ReturnStatementNode node) {
			newVoidCode(node);
			
			FunctionDefinitionNode fdNode = node.getFunctionDefinitionNode();
			FunctionBlockNode fbNode = (FunctionBlockNode) fdNode.child(3);
			String teardownLabel = fbNode.getTeardown();
			
			code.add(Jump, teardownLabel);
		}
		
		public void visitLeave(CallStatementNode node) {
			newVoidCode(node);
			
			ASMCodeFragment frag = removeValueCode(node.child(0));
			code.append(frag);
		}
		
		public void visitLeave(DiagStatementNode node) {
			newVoidCode(node);
			
			for (int i = node.nChildren() - 1; i >= 0; i--) {
				ASMCodeFragment frag = removeValueCode(node.child(i));
				code.append(frag);
			}
			code.add(Call, MemoryManager.MEM_MANAGER_DIAGNOSTICS);
		}
		
		public void visitLeave(FunctionBlockNode node) {
			newVoidCode(node);
			
			String label1 = labeller.newLabel("-set-dynamic-link", "");
			String label2 = labeller.newLabelSameNumber("-set-return-address", "");
			String label3 = labeller.newLabelSameNumber("-FP-equals-SP-", "");
			
			String sysVar = labeller.newLabelSameNumber("-return-tuple-", "");
			
			code.add(Label, node.getSubroutine());
			
			ParseNode parent = node.getParent();			
			ParseNode outputExprList = parent.child(2);		
			Type outputExprType = outputExprList.getType();
			
			if (outputExprType instanceof TupleType) {
				Type[] subTypes = ((TupleType) outputExprType).getSubTypes();
				
				// put 0s on the ASM to stack for tuple init
				for (int i = subTypes.length - 1; i >= 0; i--) {
					Type subType = subTypes[i];
					if (subType == PrimitiveType.FLOAT) 	code.add(PushF, 0.0);
					else									code.add(PushI, 0);
				}
				
				tupleCreation(outputExprList, sysVar);
				manipulateStack(outputExprType);
			}
			else {
				if (outputExprType == PrimitiveType.FLOAT) 	code.add(PushF, 0.0);
				else										code.add(PushI, 0);
				
				manipulateStack(outputExprType);
			}
			
			// fix the pre-decremented stack pointer
			//incrementStack(4);
			
			code.add(Label, label1);
			code.add(PushD, RunTime.FRAME_POINTER);
			code.add(LoadI);
			
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, 4);
			code.add(Subtract);
			code.add(Exchange);
			code.add(StoreI);
			
			code.add(Label, label2);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, 8);
			code.add(Subtract);
			code.add(Exchange);
			code.add(StoreI);
			
			code.add(Label, label3);
			code.add(PushD, RunTime.FRAME_POINTER);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(StoreI);
			
			decrementStack(8);
			
			// subroutine
			subroutineIteration(node);
		}
		
		private void subroutineIteration(FunctionBlockNode node) {
			String label1 = labeller.newLabel("-put-return-address-", "");
			String label2 = labeller.newLabelSameNumber("-put-dynamic-link-", "");
			String label3 = labeller.newLabelSameNumber("-inc-by-frame-size-", "");
			String label4 = labeller.newLabelSameNumber("-copy-return-value-", "");
			

			Type type = null;
			for(ParseNode child : node.getChildren()) {
				
				ASMCodeFragment childCode = removeVoidCode(child);
				code.append(childCode);
				
				if (child instanceof DeclarationNode) {
					type = child.getType();
					decrementStack(type);
				}
			}
			
			String teardownLabel = node.getTeardown();
			code.add(Label, teardownLabel);
			
			code.add(Label, label1);
			code.add(PushD, RunTime.FRAME_POINTER);
			code.add(LoadI);
			code.add(PushI, 8);
			code.add(Subtract);
			code.add(LoadI);
			
			code.add(Label, label2);
			code.add(PushD, RunTime.FRAME_POINTER);
			code.add(Duplicate);
			code.add(LoadI);
			code.add(PushI, 4);
			code.add(Subtract);
			code.add(LoadI);
			code.add(StoreI);
			
			Scope scope1 = node.getScope();
			int allocSize = scope1.getAllocatedSize();
			
			code.add(Label, label3);
			incrementStack(allocSize);
			
			ParseNode parent = node.getParent();
			ParseNode inputExprList = parent.child(1);

			int inputOffset = 0;
			for (int i = 0; i < inputExprList.nChildren(); i++) {
				Type inputType = inputExprList.child(i).getType();
				inputOffset = inputOffset + inputType.getSize();
			}
			
			code.add(Label, label4);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, inputOffset);
			code.add(Add);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(LoadI);
			code.add(StoreI);
			
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(Duplicate);
			code.add(LoadI);
			code.add(PushI, inputOffset);
			code.add(Add);
			code.add(StoreI);
			
			code.add(Return);
		}
		
		public void visitLeave(FunctionInvocationNode node) {
			newValueCode(node);
			
			String label1 = labeller.newLabel("-input-parameters-", "");
			
			ParseNode function = node.child(0);
			ParseNode exprList = node.child(1);
			
			// 8 bytes for accessing stack above dynamic link & return address ??
			//decrementStack(8);
			
			code.add(Label, label1);
			
			for (int i = 0; i < exprList.nChildren(); i++){
				ParseNode currNode = exprList.child(i);
				Type type = currNode.getType();
				
				ASMCodeFragment fragI = removeValueCode(currNode);
				code.append(fragI);
				
				manipulateStack(type);
			}
			
			FunctionDefinitionNode functionDefinitionNode = getFunctionDefinition(function);
			FunctionBlockNode functionBlockNode = (FunctionBlockNode) functionDefinitionNode.child(3);
			
			code.add(Call, functionBlockNode.getSubroutine());
			
			ParseNode returnParams = functionDefinitionNode.child(2);
			Type type = returnParams.getType();
			
			if (!(node.getParent() instanceof CallStatementNode)) {
				// put the return value on the ASM stack

				code.add(PushD, RunTime.STACK_POINTER);
				code.add(LoadI);
				if (type == PrimitiveType.CHARACTER) 		code.add(LoadC);
				else if (type == PrimitiveType.BOOLEAN)		code.add(LoadC);
				else if (type == PrimitiveType.FLOAT) 		code.add(LoadF);
				else										code.add(LoadI);
			}
			
			incrementStack(type);
		}
		
		private FunctionDefinitionNode getFunctionDefinition(ParseNode node) {
			IdentifierNode idNode = (IdentifierNode) node;
			FunctionBinding functionBinding = idNode.findFunctionBinding();
			FunctionDefinitionNode tNode = functionBinding.getFunctionDefinitionNode();
			
			return tNode;
		}
		
		public void manipulateStack(Type type) {
			int typeSize = type.getSize();
			
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, typeSize);
			code.add(Subtract);
			code.add(Duplicate);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(Exchange);
			code.add(StoreI);
			code.add(Exchange);
			
			if (type == PrimitiveType.CHARACTER) 		code.add(StoreC);
			else if (type == PrimitiveType.BOOLEAN)		code.add(StoreC);
			else if (type == PrimitiveType.FLOAT) 		code.add(StoreF);
			else										code.add(StoreI);
		}
		
		public void decrementStack(Type type) {
			int typeSize = type.getSize();
			
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, typeSize);
			code.add(Subtract);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(Exchange);
			code.add(StoreI);
		}
		
		public void decrementStack(int size) {
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, size);
			code.add(Subtract);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(Exchange);
			code.add(StoreI);
		}
		
		public void incrementStack(Type type) {
			int typeSize = type.getSize();
			
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, typeSize);
			code.add(Add);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(Exchange);
			code.add(StoreI);
		}
		
		public void incrementStack(int size) {
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, size);
			code.add(Add);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(Exchange);
			code.add(StoreI);
		}
		
		public void visitLeave(SubelementAccessNode node) {
			newAddressCode(node);
			
			String runtimeErr = labeller.newLabel("-run-time-err-", "");
			
			ParseNode left = node.child(0);
			ParseNode right = node.child(1);
			
			ASMCodeFragment lvalue = removeValueCode(left);	
			ASMCodeFragment rvalue = removeAddressCode(right);
			
			IdentifierNode id = (IdentifierNode) left;
			Binding binding = id.getBinding();
			
			code.append(lvalue);
			
			code.add(Duplicate);
			code.add(JumpTrue, runtimeErr);
			code.add(Jump, RunTime.GENERAL_RUNTIME_ERROR);
			
			code.add(Label, runtimeErr);
			
			if (binding instanceof FunctionBinding) {
				code.add(PushI, TupleType.HEADER_LENGTH);
				code.add(Add);
			}
			else {
				code.append(rvalue);
			}
		}
		
		public void visitLeave(FreshOperatorNode node) {
			String operation = node.getOperation();
			switch (operation) {
			case FreshOperatorNode.ARRAY_FRESH_CREATION: {
				ASMCodeFragment frag = removeValueCode(node.child(1));
				
				newValueCode(node);
				
				String sysVar1 = labeller.newLabel("-array-ec-sys-var1-", "");
				String sysVar2 = labeller.newLabelSameNumber("-array-ec-sys-var2-", "");
				
				code.append(frag);
				code.add(Duplicate);
				
				// save length in two memory locations and use 1 as a counter
				createSystemVariable(sysVar1);
				createSystemVariable(sysVar2);
				
				Type subType = ((ArrayType)node.getType()).getSubType();
				int subTypeSize = subType.getSize();
				
				arrayTotalNumBytes(subTypeSize, sysVar1);
				
				code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
				
				String ecStart = labeller.newLabelSameNumber("-array-empty-creation-", "");
				code.add(Label, ecStart);
				
				ecHeaderSetup(subType, subTypeSize, sysVar1);
				
				String argStart = labeller.newLabelSameNumber("-array-ec-arg-start-", "");
				String argEnd = labeller.newLabelSameNumber("-array-ec-arg-end-", "");
				
				// negative length check
				code.add(PushD, sysVar1);
				code.add(LoadI);
				code.add(JumpNeg, RunTime.NEGATIVE_ARRAY_LENGTH_RUNTIME_ERROR);
				
				code.add(Label, argStart);
				
				// exit if counter == 0
				code.add(PushD, sysVar1);
				code.add(LoadI);
				code.add(JumpFalse, argEnd);
				
				// memory increment			
				code.add(Duplicate);
				code.add(PushI, subTypeSize);
				code.add(Add);
				code.add(Exchange);
				
				if (subType == PrimitiveType.CHARACTER) {
					code.add(PushI, 0); 
					code.add(StoreC);
				}
				else if (subType == PrimitiveType.BOOLEAN) {
					code.add(PushI, 0); 
					code.add(StoreC);
				}
				else if (subType == PrimitiveType.FLOAT) {
					code.add(PushF, 0.0); 
					code.add(StoreF);
				}
				else {
					code.add(PushI, 0); 
					code.add(StoreI);
				}
				
				// counter decrement
				code.add(PushD, sysVar1);
				code.add(Duplicate);
				
				code.add(LoadI);
				code.add(PushI, 1);
				code.add(Subtract);
				code.add(StoreI);
				
				code.add(Jump, argStart);
				code.add(Label, argEnd);
				
				// calculate the total array bytes
				code.add(PushD, sysVar2);
				code.add(LoadI);
				code.add(PushI, subTypeSize);
				code.add(Multiply);
				
				code.add(PushI, ArrayType.HEADER_LENGTH);
				code.add(Add);
				
				code.add(Subtract);
				// leave the memory location on the ASM stack
				
				break;
			}
			
			case FreshOperatorNode.TUPLE_FRESH_CREATION: {
				ParseNode exprList = node.child(1);
				
				newValueCode(node);
				
				String sysVar = labeller.newLabel("-tuple-fresh-sys-var-", "");
				
				// append codes of every children
				for (int i = exprList.nChildren() - 1; i >= 0; i--) {
					ParseNode childI = exprList.child(i);
					ASMCodeFragment fragI = removeValueCode(childI);
					code.append(fragI);
				}
				tupleCreation(exprList, sysVar);
				
				break;
			}
				
			default:
				break;
			}
		}
		private void tupleCreation(ParseNode exprList, String sysVar) {
			Type[] subTypes = ((TupleType) exprList.getType()).getSubTypes();
			
			tupleTotalNumBytes(subTypes);
			
			code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
			
			String tcStart = labeller.newLabelSameNumber("-tuple-creation-", "");
			code.add(Label, tcStart);
			
			tupleHeaderSetup(subTypes);
			
			// address pointing at ELEMENT_START_BYTE
			createSystemVariable(sysVar);
			
			String argStart = labeller.newLabelSameNumber("-tuple-creation-start-", "");
			code.add(Label, argStart);
			
			for (int i = 0; i < subTypes.length; i++) {
				code.add(PushD, sysVar);
				code.add(LoadI);
				code.add(Exchange);
				
				if (subTypes[i] == PrimitiveType.CHARACTER) 	code.add(StoreC);
				else if (subTypes[i] == PrimitiveType.BOOLEAN)	code.add(StoreC);
				else if (subTypes[i] == PrimitiveType.FLOAT) 	code.add(StoreF);
				else											code.add(StoreI);
				
				code.add(PushD, sysVar);
				code.add(Duplicate);
				code.add(LoadI);
				
				// memory increment
				code.add(PushI, subTypes[i].getSize());
				code.add(Add);
				code.add(StoreI);
			}
			
			code.add(PushD, sysVar);
			code.add(LoadI);
			
			code.add(PushI, TupleType.HEADER_LENGTH);
			code.add(Subtract);
			
			for (int i = 0; i < subTypes.length; i++) {
				code.add(PushI, subTypes[i].getSize());	   
				code.add(Subtract);
			}	
			// leave the memory location on the ASM stack
		}
		private void tupleTotalNumBytes(Type[] subTypes) {
			String numBytesStart = labeller.newLabel("-total-number-of-bytes-", "");
			code.add(Label, numBytesStart);
			
			// header length
			code.add(PushI, TupleType.HEADER_LENGTH);
			
			// elements
			for (int i = 0; i < subTypes.length; i++) {
				code.add(PushI, subTypes[i].getSize());	   
				code.add(Add);
			}	
		}
		private void tupleHeaderSetup(Type[] subTypes) {
			manipulateMemoryLocation(TupleType.TYPE_ID_LENGTH);
			//TODO implement individual tuple type id
			code.add(PushI, 100);
			code.add(StoreI);
			
			manipulateMemoryLocation(TupleType.STATUS_LENGTH);
			
			boolean refType = false;
			for (int i = 0; i < subTypes.length; i++) {
				if (subTypes[i].isReferenceType()) {
					refType = true;
				}
			}
			if (refType)
				code.add(PushI, 2); // status 010, subtype == reftype
			else
				code.add(PushI, 0); // status 000, subtype != reftype
			
			code.add(StoreI);
			
			manipulateMemoryLocation(TupleType.REF_COUNT_LENGTH);
			code.add(PushI, 0);
			code.add(StoreC);
		}
		
		public void visitLeave(CopyOperatorNode node) {
			String operation = node.getOperation();
			switch (operation) {
			case CopyOperatorNode.ARRAY_COPY_OPERATION: {

				newValueCode(node);
				
				String sysVar1 = labeller.newLabel("-array-co-sys-var1-", "");
				String sysVar2 = labeller.newLabelSameNumber("-array-co-sys-var2-", "");
				String sysVar3 = labeller.newLabelSameNumber("-array-co-sys-var3-", "");
				
				String startop = labeller.newLabelSameNumber("-array-copy-operation-", "");
				code.add(Label, startop);
				
				// system variables allocation
				ASMCodeFragment memLoc = removeValueCode(node.child(0));
				code.append(memLoc);
				
				code.add(Duplicate);;
				createSystemVariable(sysVar1);				// original memory location
				
				code.add(PushI, ArrayType.LENGTH_START_BYTE);
				code.add(Add);
				code.add(LoadI);
				code.add(Duplicate);
				
				createSystemVariable(sysVar2);				// location pointing at length start
				createSystemVariable(sysVar3);				// location pointing at length start
				
				Type subType = ((ArrayType)node.getType()).getSubType();
				int subTypeSize = subType.getSize();
				// CURRENTLY USING subTypeSize FROM NODE TYPE.
				// STRICTLY SAYING, IT SHOULD BE RETRIEVED FROM THE COPY OPERANT
				
				// total numBytes on the ASM stack
				arrayTotalNumBytes(subTypeSize, sysVar2);
				
				// memory alloc on the heap, dynamic string
				code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
				
				// setup the header
				coArrayHeaderSetup(sysVar1);
				
				// Element copy
				String startloop = labeller.newLabelSameNumber("-array-co-elem-copy-s-", "");
				String endloop = labeller.newLabelSameNumber("-array-co-elem-copy-e-", "");
				
				code.add(Label, startloop);
				
				code.add(PushD, sysVar2);
				code.add(LoadI);
				code.add(JumpFalse, endloop);
				
				incrementMemoryLocationAndCopy(sysVar1, subTypeSize);
				
				// decrement counter
				code.add(PushD, sysVar2);
				code.add(Duplicate);
				
				code.add(LoadI);
				code.add(PushI, 1);
				code.add(Subtract);
				code.add(StoreI);
				
				code.add(Jump, startloop);
				code.add(Label, endloop);
								
				//reset the memory location
				code.add(PushI, ArrayType.HEADER_LENGTH);
				code.add(PushI, subTypeSize);
				code.add(PushD, sysVar3);
				code.add(LoadI);
				code.add(Multiply);
				code.add(Add);
				
				code.add(Subtract);	
				// leave the memory location on the ASM stack
				
				break;
				}
			
			case CopyOperatorNode.TUPLE_COPY_OPERATION: {

				newValueCode(node);
				
				String sysVar1 = labeller.newLabel("-tuple-co-sys-var1-", "");
				
				String startop = labeller.newLabelSameNumber("-tuple-copy-operation-", "");
				code.add(Label, startop);
				
				// system variables allocation
				ASMCodeFragment memLoc = removeValueCode(node.child(0));
				code.append(memLoc);
				
				createSystemVariable(sysVar1);				// original memory location
				
				TupleType tupleType = (TupleType) node.getType();
				Type[] subTypes = tupleType.getSubTypes();
				
				// total numBytes on the ASM stack
				tupleTotalNumBytes(subTypes);
				
				// memory alloc on the heap, dynamic string
				code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
				
				// setup the header
				coTupleHeaderSetup(sysVar1);
				
				// Element copy
				String startloop = labeller.newLabelSameNumber("-tuple-co-elem-copy-s-", "");
				String endloop = labeller.newLabelSameNumber("-tuple-co-elem-copy-e-", "");
				
				code.add(Label, startloop);
				
				for (int i = 0; i < subTypes.length; i++) {
					int subTypeSize = subTypes[i].getSize();
					
					incrementMemoryLocationAndCopy(sysVar1, subTypeSize);
				}
				
				code.add(Label, endloop);
								
				//reset the memory location
				code.add(PushI, TupleType.HEADER_LENGTH);
				
				for (int i = 0; i < subTypes.length; i++) {
					int subTypeSize = subTypes[i].getSize();
					
					code.add(PushI, subTypeSize);
					code.add(Add);
				}
				
				code.add(Subtract);	
				// leave the memory location on the ASM stack
				
				break;
				}
			
			default:
				break;
			}
		}
		
		public void visitLeave(ArrayOperatorNode node) {
			String operation = node.getOperation();
			switch (operation) {
			case ArrayOperatorNode.POPULATED_CREATION: {
				newValueCode(node);
				
				String sysVar = labeller.newLabel("-array-pc-sys-var-", "");
				
				// append codes of every children
				for (int i = node.nChildren() - 1; i >= 0; i--) {
					ParseNode childI = node.child(i);
					ASMCodeFragment fragI = removeValueCode(childI);
					code.append(fragI);
				}
				
				Type subType = ((ArrayType)node.getType()).getSubType();
				int subTypeSize = subType.getSize();
				int nchildren = node.nChildren();
				
				arrayTotalNumBytes(subTypeSize, nchildren);
				
				code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
				
				String pcStart = labeller.newLabelSameNumber("-array-populated-creation-", "");
				code.add(Label, pcStart);
				
				pcHeaderSetup(subType, subTypeSize, nchildren);
				
				// address pointing at ELEMENT_START_BYTE
				createSystemVariable(sysVar);
				
				String argStart = labeller.newLabelSameNumber("-array-pc-arg-start-", "");
				code.add(Label, argStart);
				
				for (int i = node.nChildren() - 1; i >= 0; i--) {
					code.add(PushD, sysVar);
					code.add(LoadI);
					code.add(Exchange);
					
					if (subType == PrimitiveType.CHARACTER) 	code.add(StoreC);
					else if (subType == PrimitiveType.BOOLEAN)	code.add(StoreC);
					else if (subType == PrimitiveType.FLOAT) 	code.add(StoreF);
					else										code.add(StoreI);
					
					code.add(PushD, sysVar);
					code.add(Duplicate);
					code.add(LoadI);
					
					// memory increment
					code.add(PushI, subTypeSize);
					code.add(Add);
					code.add(StoreI);
				}
				
				code.add(PushD, sysVar);
				code.add(LoadI);
				
				code.add(PushI, ArrayType.HEADER_LENGTH + subTypeSize * nchildren);
				code.add(Subtract);
				// leave the memory location on the ASM stack
				
				break;
			}
			
			case ArrayOperatorNode.INDEX_OPERATION: {
				ASMCodeFragment frag1 = removeValueCode(node.child(0));
				ASMCodeFragment frag2 = removeValueCode(node.child(1));
				
				String ioStart = labeller.newLabel("-array-index-operation-", "");	
				String sysVar = labeller.newLabelSameNumber("-array-io-sys-var-", "");
				String runtimeErr = labeller.newLabelSameNumber("-run-time-err-io-", "");
				
				// this operation generates address code
				newAddressCode(node);
				
				code.append(frag1);
				code.append(frag2);
				
				code.add(Exchange);
				code.add(Duplicate);
				code.add(JumpTrue, runtimeErr);
				code.add(Jump, RunTime.GENERAL_RUNTIME_ERROR);
				code.add(Label,runtimeErr);
				code.add(Exchange);
				
				// length of the array
				createSystemVariable(sysVar);
				
				// use currType because the result type is already defined as subType
				Type currType = node.getType();
				int currTypeSize = currType.getSize();
				
				
				// negative index check
				code.add(PushD, sysVar);
				code.add(LoadI);
				code.add(JumpNeg, RunTime.ARRAY_INDEX_OUT_OF_BOUNDS);
				
				// valid index check
				code.add(Duplicate);
				code.add(PushI, ArrayType.LENGTH_START_BYTE);
				code.add(Add);
				code.add(LoadI);
				code.add(PushD, sysVar);
				code.add(LoadI);
				
				code.add(Subtract);
				code.add(JumpPos, ioStart);
				code.add(Jump, RunTime.ARRAY_INDEX_OUT_OF_BOUNDS);
				code.add(Label, ioStart);
				
				// increment memory by length * subTypeSize
				code.add(PushD, sysVar);
				code.add(LoadI);
				
				code.add(PushI, currTypeSize);
				code.add(Multiply);
				code.add(Add);
				
				// increment memory by the array header length
				code.add(PushI, ArrayType.HEADER_LENGTH);
				code.add(Add);
				
				// WE WANT TO RETURN THE LOCATION OF THE ELEMENT
				// DO NOT NEED TO LOAD (IT WILL HAPPEN IF WE ACCESS VALUECODE)
				break;
			}
			
			case ArrayOperatorNode.CONCATENATION_OPERATION: {
				newValueCode(node);
				
				String arrayConcStart = labeller.newLabel("-array-concatenation-", "");
				String sysVar1 = labeller.newLabelSameNumber("-sysvar1-for-array-conc-", "");
				String sysVar2 = labeller.newLabelSameNumber("-sysvar2-for-array-conc-", "");
				String sysVar3 = labeller.newLabelSameNumber("-sysvar3-for-array-conc-", "");
				
				String arrArgStart1 = labeller.newLabelSameNumber("-arrayConc-arg-start1-", "");
				String arrArgDone1 = labeller.newLabelSameNumber("-arrayConc-arg-done1-", "");
				String arrArgStart2 = labeller.newLabelSameNumber("-arrayConc-arg-start2-", "");
				String arrArgDone2 = labeller.newLabelSameNumber("-arrayConc-arg-done2-", "");
				
				String runtimeErr1 = labeller.newLabelSameNumber("-runtime-err-aco-1", "");
				String runtimeErr2 = labeller.newLabelSameNumber("-runtime-err-aco-2-", "");
				String runtimeErr3 = labeller.newLabelSameNumber("-runtime-err-aco-3-", "");
				
				ParseNode firstChild = node.child(0);
				Type subType = ((ArrayType) firstChild.getType()).getSubType();
				int subTypeSize = subType.getSize();
				
				code.add(Label, arrayConcStart);
				
				ASMCodeFragment memLoc1 = removeValueCode(node.child(0));
				code.append(memLoc1);
				
				code.add(Duplicate);
				code.add(JumpTrue, runtimeErr1);
				code.add(Jump, RunTime.GENERAL_RUNTIME_ERROR);
				code.add(Label,runtimeErr1);
				
				createSystemVariable(sysVar1);
				
				ASMCodeFragment memLoc2 = removeValueCode(node.child(1));
				code.append(memLoc2);
				
				code.add(Duplicate);
				code.add(JumpTrue, runtimeErr2);
				code.add(Jump, RunTime.GENERAL_RUNTIME_ERROR);
				code.add(Label,runtimeErr2);
				
				createSystemVariable(sysVar2);
				
				code.add(PushI, 0);
				createSystemVariable(sysVar3);
				
				arrayConcatenationHelper(sysVar1, sysVar2, sysVar3, subType, subTypeSize, arrArgStart1, arrArgDone1, arrArgStart2, arrArgDone2);
				
				if (node.nChildren() > 2) {
					for (int i = 2; i < node.nChildren(); i++) {
						String arrArgStart3 = labeller.newLabelSameNumber("-arrayConc-arg-start3-", "" + (i - 1));
						String arrArgDone3 = labeller.newLabelSameNumber("-arrayConc-arg-done3-", "" + (i - 1));
						String arrArgStart4 = labeller.newLabelSameNumber("-arrayConc-arg-start4-", "" + i);
						String arrArgDone4 = labeller.newLabelSameNumber("-arrayConc-arg-done4-", "" + i);
						
						code.add(PushD, sysVar1);
						code.add(Exchange);
						code.add(StoreI);
						
						ASMCodeFragment memLoc = removeValueCode(node.child(i));
						code.append(memLoc);
						
						code.add(Duplicate);
						code.add(JumpTrue, runtimeErr3);
						code.add(Jump, RunTime.GENERAL_RUNTIME_ERROR);
						code.add(Label,runtimeErr3);
						
						code.add(PushD, sysVar2);
						code.add(Exchange);
						code.add(StoreI);
						
						code.add(PushD, sysVar3);
						code.add(PushI, 0);
						code.add(StoreI);
						
						arrayConcatenationHelper(sysVar1, sysVar2, sysVar3, subType, subTypeSize, arrArgStart3, arrArgDone3, arrArgStart4, arrArgDone4);
					}
				}
			}
			
			default:
				break;
			}
		}
		
		private void arrayConcatenationHelper(String sysVar1, String sysVar2, String sysVar3, Type subType, int subTypeSize, 
											  String arrArgStart1, String arrArgDone1, String arrArgStart2, String arrArgDone2) {
			// total numBytes on the ASM stack
			arrayConcatenationTotalNumBytes(sysVar1, sysVar2, subTypeSize);

			code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
			
			// setup the header
			arrayConcatenationHeaderSetup(sysVar1, sysVar2, subType, subTypeSize);
			
			// arg1 concatenation
			arrayConcatenation(arrArgStart1, arrArgDone1, sysVar1, sysVar3, subType, subTypeSize);
			
			// reset count
			code.add(PushD, sysVar3);
			code.add(PushI, 0);
			code.add(StoreI);
			
			// arg2 concatenation
			arrayConcatenation(arrArgStart2, arrArgDone2, sysVar2, sysVar3, subType, subTypeSize);
			
			//reset the memory location
			code.add(PushI, ArrayType.HEADER_LENGTH);
			arrayLength(sysVar1);
			code.add(PushI, subTypeSize);
			code.add(Multiply);
			
			arrayLength(sysVar2);
			code.add(PushI, subTypeSize);
			code.add(Multiply);
			
			code.add(Add);
			code.add(Add);
			
			code.add(Subtract);
		}
		
		// length known at run time
		private void arrayTotalNumBytes(int subTypeSize, String memLoc) {
			
			String numBytesStart = labeller.newLabel("-total-number-of-bytes-", "");
			code.add(Label, numBytesStart);
			
			// header length
			code.add(PushI, ArrayType.HEADER_LENGTH);
			
			// elements
			code.add(PushI, subTypeSize);
			code.add(PushD, memLoc);
			code.add(LoadI);
			code.add(Multiply);
			
			code.add(Add);
		}
		
		// length known at compile time
		private void arrayTotalNumBytes(int subTypeSize, int length) {
			
			String numBytesStart = labeller.newLabel("-total-number-of-bytes-", "");
			code.add(Label, numBytesStart);
			
			// header length
			code.add(PushI, ArrayType.HEADER_LENGTH);
			
			// elements
			code.add(PushI, subTypeSize * length);	   
			code.add(Add);
		}
		private void pcHeaderSetup(Type subType, int subTypeSize, int length) {
			String stSize = labeller.newLabel("-array-pc-sub-size-", "");
			String nElements = labeller.newLabel("-array-pc-elem-len-", "");
			
			arrayHeaderBeforeLength(subType, subTypeSize, stSize);
			
			code.add(Label, nElements);
			manipulateMemoryLocation(StringConstantNode.LENGTH_LENGTH);
			code.add(PushI, length);
			code.add(StoreI);
		}
		private void ecHeaderSetup(Type subType, int subTypeSize, String memLoc) {
			String stSize = labeller.newLabel("-array-ec-sub-size-", "");
			String nElements = labeller.newLabel("-array-ec-elem-len-", "");
			
			arrayHeaderBeforeLength(subType, subTypeSize, stSize);
			
			// handle length
			code.add(Label, nElements);
			manipulateMemoryLocation(StringConstantNode.LENGTH_LENGTH);
			code.add(PushD, memLoc);
			code.add(LoadI);
			code.add(StoreI);
		}
		private void arrayHeaderBeforeLength(Type subType, int subTypeSize, String stLabel) {
			manipulateMemoryLocation(ArrayType.TYPE_ID_LENGTH);
			code.add(PushI, 9);
			code.add(StoreI);
			
			manipulateMemoryLocation(ArrayType.STATUS_LENGTH);
			if (subType.isReferenceType())
				code.add(PushI, 2); // status 010, subtype == reftype
			else
				code.add(PushI, 0); // status 000, subtype != reftype
			code.add(StoreI);
			
			manipulateMemoryLocation(ArrayType.REF_COUNT_LENGTH);
			code.add(PushI, 0);
			code.add(StoreC);
			
			code.add(Label, stLabel);
			manipulateMemoryLocation(ArrayType.SUB_TYPE_SIZE);
			code.add(PushI, subTypeSize);
			code.add(StoreI);
		}
		private void coArrayHeaderSetup(String memLoc) {
			String start = labeller.newLabel("-array-co-header-", "");
			code.add(Label, start);
			
			incrementMemoryLocationAndCopy(memLoc, ArrayType.TYPE_ID_LENGTH);
			incrementMemoryLocationAndCopy(memLoc, ArrayType.STATUS_LENGTH);
			incrementMemoryLocationAndCopy(memLoc, ArrayType.REF_COUNT_LENGTH);
			incrementMemoryLocationAndCopy(memLoc, ArrayType.SUB_TYPE_SIZE);
			incrementMemoryLocationAndCopy(memLoc, ArrayType.LENGTH_LENGTH);

		}
		private void coTupleHeaderSetup(String memLoc) {
			String start = labeller.newLabel("-tuple-co-header-", "");
			code.add(Label, start);
			
			incrementMemoryLocationAndCopy(memLoc, TupleType.TYPE_ID_LENGTH);
			incrementMemoryLocationAndCopy(memLoc, TupleType.STATUS_LENGTH);
			incrementMemoryLocationAndCopy(memLoc, TupleType.REF_COUNT_LENGTH);
		}
		private void incrementMemoryLocationAndCopy(String memLoc, int bytes) {
			manipulateMemoryLocation(bytes);
			code.add(PushD, memLoc);
			code.add(LoadI);
			
			if (bytes == 8) {
				code.add(LoadF);
				code.add(StoreF);
			}
			else if (bytes == 4) {
				code.add(LoadI);
				code.add(StoreI);
			}
			else if (bytes == 1) {
				code.add(LoadC);
				code.add(StoreC);
			}
	
			code.add(PushD, memLoc);
			code.add(Duplicate);
			code.add(LoadI);
			code.add(PushI, bytes);
			code.add(Add);
			code.add(StoreI);
		}
		
		public void visitLeave(UnaryOperatorNode node) {
			Token token = node.getToken();
			
			if(token.isLextant(Punctuator.NOT)) {
				newValueCode(node);
				
				ASMCodeFragment arg1 = removeValueCode(node.child(0));
				code.append(arg1);
				
				FunctionSignature fs = node.getSignature();
				assert fs.getVariant() instanceof ASMOpcode;
				
				ASMOpcode opcode = (ASMOpcode)fs.getVariant();
				code.add(opcode);
			}
			else if (token.isLextant(Punctuator.LENGTH)) {
				newValueCode(node);
				
				String nullCheck = labeller.newLabelSameNumber("-length-op-null-check-", "");
				String nullCatch = labeller.newLabelSameNumber("-length-op-null-catch-", "");
				
				ASMCodeFragment frag = removeValueCode(node.child(0));
				code.append(frag);

				FunctionSignature fs = node.getSignature();
				assert fs.getVariant() instanceof Integer;
				
				int op = (int)fs.getVariant();
				if (op == 0) {
					code.add(Duplicate);
					code.add(JumpTrue, nullCheck);
					code.add(Pop);
					code.add(PushI, -1);
					
					code.add(Jump, nullCatch);
					code.add(Label, nullCheck);
					
					code.add(PushI, StringConstantNode.LENGTH_START_BYTE);
					code.add(Add);
					code.add(LoadI);
					
					code.add(Label, nullCatch);
				}
				else if (op == 1) {
					code.add(Duplicate);
					code.add(JumpTrue, nullCheck);
					code.add(Pop);
					code.add(PushI, -1);
					
					code.add(Jump, nullCatch);
					code.add(Label, nullCheck);
					
					code.add(PushI, ArrayType.LENGTH_START_BYTE);
					code.add(Add);
					code.add(LoadI);
					
					code.add(Label, nullCatch);
				}
				else if (op == 2) {
					ParseNode child = node.child(0);
					Type[] subTypes = ((TupleType) child.getType()).getSubTypes();
					
					code.add(Pop);
					if (subTypes == null) {
						code.add(PushI, -1);
					}
					else {
						code.add(PushI, subTypes.length);
					}
				}
			}
			else if (token.isLextant(Punctuator.ADDRESS)) {
				newValueCode(node);
				
				ASMCodeFragment frag = removeAddressCode(node.child(0));
				code.append(frag);
			}
			
			else if (token.isLextant(Punctuator.RECORD)) {
				newValueCode(node);
				
				String nullCheck = labeller.newLabelSameNumber("-record-op-null-check-", "");
				String nullCatch = labeller.newLabelSameNumber("-record-op-null-catch-", "");
				
				ASMCodeFragment frag = removeValueCode(node.child(0));
				code.append(frag);
				
				code.add(Duplicate);
				code.add(JumpTrue, nullCheck);
				code.add(Pop);
				code.add(PushI, -1);
				
				code.add(Jump, nullCatch);
				code.add(Label, nullCheck);
				
				code.add(PushI, 4);
				code.add(Add);		
				code.add(Call, MemoryManager.MEM_MANAGER_GET_ID);
				
				code.add(Label, nullCatch);
			}
			
			else if (token.isLextant(Punctuator.REFCOUNT)) {
				newValueCode(node);
				
				ASMCodeFragment frag = removeValueCode(node.child(0));
				code.append(frag);
				
				code.add(Pop);
				code.add(PushI, -1);
			}				
		}
		
		public void visitLeave(BinaryOperatorNode node) {
			Token token = node.getToken();
			
			if (token.isLextant(Punctuator.GREATER, Punctuator.GREATER_OR_EQUAL,
							   Punctuator.LESS, Punctuator.LESS_OR_EQUAL,
							   Punctuator.EQUAL, Punctuator.NOT_EQUAL)) {
				visitComparisonOperator(node);
			}
			else if (token.isLextant(Punctuator.AND, Punctuator.OR)) {
				visitBooleanOperator(node);
			}
			else if (token.isLextant(Punctuator.ADD)) {
				// string concatenation
				if (node.getSignature().resultType() == PrimitiveType.STRING){
					visitConcatenateOperator(node);
				}
				else 
					visitArithmeticOperator(node);
			}
			else if (token.isLextant(Punctuator.SUBTRACT, Punctuator.MULTIPLY, Punctuator.DIVIDE)) {
				visitArithmeticOperator(node);
			}
			else if (token.isLextant(Punctuator.CAST)) {
				visitCastOperator(node);
			}
		}
		
		private void visitComparisonOperator(BinaryOperatorNode node) {
			ParseNode parent = node.getParent();
			if (parent instanceof ForConditionNode && parent.nChildren() == 1) {
				ASMCodeFragment arg1 = removeAddressCode(node.child(0));
				ASMCodeFragment arg2 = removeValueCode(node.child(1));
				
				newVoidCode(node);
				code.append(arg1);
				code.append(arg2);
			}
			else if (parent instanceof ForConditionNode && parent.nChildren() == 2) {
				if (node == parent.child(0)) {
					ASMCodeFragment arg1 = removeValueCode(node.child(0));
					ASMCodeFragment arg2 = removeAddressCode(node.child(1));
					
					newVoidCode(node);
					code.append(arg1);
					code.append(arg2);
				}
				else if (node == parent.child(1)) {
					ASMCodeFragment arg1 = removeAddressCode(node.child(0));
					ASMCodeFragment arg2 = removeValueCode(node.child(1));
					
					newVoidCode(node);
					code.append(arg1);
					code.append(arg2);
				}
			}
			else {
				ParseNode c1 = node.child(0);
				ParseNode c2 = node.child(1);
				
				ASMCodeFragment arg1 = removeValueCode(c1);
				ASMCodeFragment arg2 = removeValueCode(c2);

				String startLabel = labeller.newLabel("-compare-arg1-", "");
				String arg2Label  = labeller.newLabelSameNumber("-compare-arg2-", "");
				String trueLabel  = labeller.newLabelSameNumber("-compare-true-", "");
				String falseLabel = labeller.newLabelSameNumber("-compare-false-", "");
				String joinLabel  = labeller.newLabelSameNumber("-compare-join-", "");
			
				newValueCode(node);
				code.add(Label, startLabel);
				code.append(arg1);
				
				code.add(Label, arg2Label);
				code.append(arg2);
			
				comparisonOperatorCodeGenerator(node, trueLabel, falseLabel, joinLabel);
			}
		}
		private void comparisonOperatorCodeGenerator(BinaryOperatorNode node, String trueLabel, String falseLabel, String joinLabel) {
			FunctionSignature fs = node.getSignature();
			assert fs.getVariant() instanceof ASMOpcode;
			
			ASMOpcode opcode = (ASMOpcode)fs.getVariant();
			if (opcode == JumpFPos || opcode == JumpFNeg || opcode == JumpFZero) 	// float operation
				code.add(FSubtract);
			else if (opcode == JumpPos || opcode == JumpNeg || opcode == JumpFalse) // int operation
				code.add(Subtract);
			
			comparisonCodeGenerator(node, opcode, trueLabel, falseLabel);
			
			code.add(Label, trueLabel);
			code.add(PushI, 1);
			code.add(Jump, joinLabel);
			code.add(Label, falseLabel);
			code.add(PushI, 0);
			code.add(Jump, joinLabel);
			code.add(Label, joinLabel);
		}
		
		private void comparisonCodeGenerator(BinaryOperatorNode node, ASMOpcode opcode, 
											 String trueLabel, String falseLabel) {
			Token token = node.getToken();

			if (token.isLextant(Punctuator.GREATER, Punctuator.LESS, Punctuator.EQUAL)) {
				code.add(opcode, trueLabel);
				code.add(Jump, falseLabel);
			} 
			else if (token.isLextant(Punctuator.GREATER_OR_EQUAL, Punctuator.LESS_OR_EQUAL, Punctuator.NOT_EQUAL)) {
				code.add(opcode, falseLabel);
				code.add(Jump, trueLabel);
			}
		}
		
		private void visitBooleanOperator(BinaryOperatorNode node) {
			Token token = node.getToken();
			
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));

			String startLabel = labeller.newLabel("-boolean-op-arg1-", "");
			String arg2Label  = labeller.newLabelSameNumber("-boolean-op-arg2-", "");
			String trueLabel  = labeller.newLabelSameNumber("-boolean-op-true-", "");
			String falseLabel = labeller.newLabelSameNumber("-boolean-op-false-", "");
			String joinLabel  = labeller.newLabelSameNumber("-boolean-op-join-", "");
			
			FunctionSignature fs = node.getSignature();
			assert fs.getVariant() instanceof ASMOpcode;
			
			ASMOpcode opcode = (ASMOpcode)fs.getVariant();
			
			newValueCode(node);

			if (token.isLextant(Punctuator.AND)) {
				code.add(Label, startLabel);
				code.append(arg1);
				code.add(opcode, falseLabel);
				code.add(Label, arg2Label);
				code.append(arg2);
				code.add(opcode, falseLabel);
				
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Jump, joinLabel);
				code.add(Label, falseLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, joinLabel);
			}
			else if (token.isLextant(Punctuator.OR)) {
				code.add(Label, startLabel);
				code.append(arg1);
				code.add(opcode, trueLabel);
				code.add(Label, arg2Label);
				code.append(arg2);
				code.add(opcode, trueLabel);
				
				code.add(Label, falseLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Jump, joinLabel);
				code.add(Label, joinLabel);
			}
		}
		private void visitConcatenateOperator(BinaryOperatorNode node) {
			newValueCode(node);
			
			String stringConcStart = labeller.newLabel("-string-concatenation-", "");
			String sysVar1 = labeller.newLabelSameNumber("-sysvar1-for-string-conc-", "");
			String sysVar2 = labeller.newLabelSameNumber("-sysvar2-for-string-conc-", "");
			String sysVar3 = labeller.newLabelSameNumber("-sysvar3-for-string-conc-", "");
			
			String strArg1Start = labeller.newLabelSameNumber("-stringConc-arg1-start-", "");
			String strArg2Start = labeller.newLabelSameNumber("-stringConc-arg2-start-", "");
			String strArg1Done = labeller.newLabelSameNumber("-stringConc-arg1-done-", "");
			String strArg2Done = labeller.newLabelSameNumber("-stringConc-arg2-done-", "");
			
			String runtimeErr1 = labeller.newLabelSameNumber("-runtime-err-sc1-", "");
			String runtimeErr2 = labeller.newLabelSameNumber("-runtime-err-sc2-", "");
			
			code.add(Label, stringConcStart);
			
			// system variables allocation
			ASMCodeFragment memLoc1 = removeValueCode(node.child(0));
			code.append(memLoc1);

			code.add(Duplicate);
			code.add(JumpTrue, runtimeErr1);
			code.add(Jump, RunTime.GENERAL_RUNTIME_ERROR);
			code.add(Label,runtimeErr1);
			
			createSystemVariable(sysVar1);
			
			ASMCodeFragment memLoc2 = removeValueCode(node.child(1));
			code.append(memLoc2);
			
			code.add(Duplicate);
			code.add(JumpTrue, runtimeErr2);
			code.add(Jump, RunTime.GENERAL_RUNTIME_ERROR);
			code.add(Label,runtimeErr2);
			
			createSystemVariable(sysVar2);
			
			code.add(PushI, 0);
			createSystemVariable(sysVar3);
			
			// total numBytes on the ASM stack
			stringConcatenationTotalNumBytes(sysVar1, sysVar2);
			
			// memory alloc on the heap, dynamic string
			code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
			
			// setup the header
			stringConcatenationHeaderSetup(sysVar1, sysVar2);
			
			// arg1 concatenation
			stringConcatenation(strArg1Start, strArg1Done, sysVar1, sysVar3);
			
			// reset count
			code.add(PushD, sysVar3);
			code.add(PushI, 0);
			code.add(StoreI);
			
			// arg1 concatenation
			stringConcatenation(strArg2Start, strArg2Done, sysVar2, sysVar3);
			
			// the empty byte
			code.add(Duplicate);
			code.add(PushI, 1);
			code.add(Add);
			code.add(Exchange);
			
			code.add(PushI, 0);
			code.add(StoreC);
			
			//reset the memory location
			code.add(PushI, StringConstantNode.HEADER_LENGTH);
			stringLength(sysVar1);
			stringLength(sysVar2);
			code.add(PushI, StringConstantNode.EMPTY_BYTE);
			
			code.add(Add);
			code.add(Add);
			code.add(Add);
			
			code.add(Subtract);
			
		}
		private void stringConcatenationTotalNumBytes(String loc1, String loc2) {
			
			String numBytesStart = labeller.newLabel("-total-number-of-bytes-", "");
			code.add(Label, numBytesStart);
			
			// length of child0
			stringLength(loc1);
			
			// header length
			code.add(PushI, StringConstantNode.HEADER_LENGTH);
			code.add(Add);
			
			// length of child1
			stringLength(loc2);
			
			// empty byte at the end
			code.add(PushI, StringConstantNode.EMPTY_BYTE);	   
			code.add(Add);
			
			// total number of bytes
			code.add(Add);
		}
		private void arrayConcatenationTotalNumBytes(String loc1, String loc2, int subTypeSize) {
			
			String numBytesStart = labeller.newLabel("-total-number-of-bytes-", "");
			code.add(Label, numBytesStart);
			
			// length of child0
			arrayLength(loc1);
			code.add(PushI, subTypeSize);
			code.add(Multiply);
			
			// header length
			code.add(PushI, ArrayType.HEADER_LENGTH);
			code.add(Add);
			
			// length of child1
			arrayLength(loc2);
			code.add(PushI, subTypeSize);
			code.add(Multiply);
			
			// total number of bytes
			code.add(Add);
		}
		private void stringConcatenationHeaderSetup(String loc1, String loc2) {
			manipulateMemoryLocation(StringConstantNode.TYPE_ID_LENGTH);
			code.add(PushI, 10);
			code.add(StoreI);
			
			manipulateMemoryLocation(StringConstantNode.STATUS_LENGTH);
			code.add(PushI, 1);
			code.add(StoreI);
			
			manipulateMemoryLocation(StringConstantNode.REF_COUNT_LENGTH);
			code.add(PushI, 0);
			code.add(StoreC);
			
			manipulateMemoryLocation(StringConstantNode.LENGTH_LENGTH);
			stringLength(loc1);
			stringLength(loc2);
			code.add(Add);
			code.add(StoreI);
		}
		private void arrayConcatenationHeaderSetup(String loc1, String loc2, Type subType, int subTypeSize) {
			manipulateMemoryLocation(ArrayType.TYPE_ID_LENGTH);
			code.add(PushI, 9);
			code.add(StoreI);
			
			manipulateMemoryLocation(ArrayType.STATUS_LENGTH);
			if (subType.isReferenceType()) 	code.add(PushI, 2);
			else 							code.add(PushI, 0);
			code.add(StoreI);
			
			manipulateMemoryLocation(ArrayType.REF_COUNT_LENGTH);
			code.add(PushI, 0);
			code.add(StoreC);
			
			manipulateMemoryLocation(ArrayType.SUB_TYPE_SIZE);
			code.add(PushI, subTypeSize);
			code.add(StoreI);
			
			manipulateMemoryLocation(StringConstantNode.LENGTH_LENGTH);
			arrayLength(loc1);
			arrayLength(loc2);
			code.add(Add);
			code.add(StoreI);
		}
		private void createSystemVariable(String label) {
			code.add(DLabel, label);
			code.add(DataI, 0);			// init the data as 0
			code.add(PushD, label);
			code.add(Exchange);
			code.add(StoreI);
		}
		private void arrayLength(String label) {
			// load array address
			code.add(PushD, label);
			code.add(LoadI);
			
			// load string
			code.add(PushI, ArrayType.LENGTH_START_BYTE);
			code.add(Add);
			code.add(LoadI);
		}
		private void stringLength(String label) {
			// load string address
			code.add(PushD, label);
			code.add(LoadI);
			
			// load string
			code.add(PushI, StringConstantNode.LENGTH_START_BYTE);
			code.add(Add);
			code.add(LoadI);
		}
		private void arrayByte(String label) {
			code.add(PushD, label);
			code.add(LoadI);
			
			code.add(PushI, ArrayType.ELEMENT_START_BYTE);
			code.add(Add);
		}
		private void stringByte(String label) {
			code.add(PushD, label);
			code.add(LoadI);
			
			code.add(PushI, StringConstantNode.STRING_START_BYTE);
			code.add(Add);
		}
		private void manipulateMemoryLocation(int specificStringHeader) {
			code.add(Duplicate);
			code.add(PushI, specificStringHeader);
			code.add(Add);
			code.add(Exchange);
		}
		private void arrayConcatenation(String start, String end, String memLoc, String count, Type subType, int subTypeSize) {
			code.add(Label, start);
			
			arrayLength(memLoc);
			code.add(PushD, count);
			code.add(LoadI);
			code.add(Subtract);
			code.add(JumpFalse, end);
			
			// memory increment			
			code.add(Duplicate);
			code.add(PushI, subTypeSize);
			code.add(Add);
			code.add(Exchange);
			
			arrayByte(memLoc);
			code.add(PushD, count);
			code.add(LoadI);
			code.add(PushI, subTypeSize);
			code.add(Multiply);
			code.add(Add);
			
			if (subType == PrimitiveType.CHARACTER) 	{code.add(LoadC); code.add(StoreC);}
			else if (subType == PrimitiveType.BOOLEAN)	{code.add(LoadC); code.add(StoreC);}
			else if (subType == PrimitiveType.FLOAT) 	{code.add(LoadF); code.add(StoreF);}
			else										{code.add(LoadI); code.add(StoreI);}
			
			code.add(PushD, count);
			code.add(Duplicate);
			
			code.add(LoadI);
			code.add(PushI, 1);
			code.add(Add);
			code.add(StoreI);
			
			code.add(Jump, start);
			code.add(Label, end);
		}
		private void stringConcatenation(String start, String end, String memLoc, String count) {
			code.add(Label, start);
			
			stringByte(memLoc);
			code.add(PushD, count);
			code.add(LoadI);
			code.add(Add);
			code.add(LoadC);
			code.add(JumpFalse, end);
			
			// memory increment			
			code.add(Duplicate);
			code.add(PushI, 1);
			code.add(Add);
			code.add(Exchange);
			
			stringByte(memLoc);
			code.add(PushD, count);
			code.add(LoadI);
			code.add(Add);
			code.add(LoadC);
			
			code.add(StoreC);
			
			code.add(PushD, count);
			code.add(Duplicate);
			
			code.add(LoadI);
			code.add(PushI, 1);
			code.add(Add);
			code.add(StoreI);
			
			code.add(Jump, start);
			code.add(Label, end);
		}
		
		private void visitArithmeticOperator(BinaryOperatorNode node) {
			newValueCode(node);
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));
			
			code.append(arg1);
			code.append(arg2);

			FunctionSignature fs = node.getSignature();
			assert fs.getVariant() instanceof ASMOpcode;
			
			ASMOpcode opcode = (ASMOpcode)fs.getVariant();
			checkDivideByZero(opcode);
			
			code.add(opcode);	 		// type-dependent!
		}
		private void checkDivideByZero(ASMOpcode opcode) {
			if (opcode == Divide) 
			{
				code.add(Duplicate);
				code.add(JumpFalse, RunTime.INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
			}
			else if (opcode == FDivide)
			{
				code.add(Duplicate);
				code.add(JumpFZero, RunTime.FLOAT_DIVIDE_BY_ZERO_RUNTIME_ERROR);
			}
		}
		
		private void visitCastOperator(BinaryOperatorNode node) {
			newValueCode(node);
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			code.append(arg1);
			
			FunctionSignature fs = node.getSignature();
			assert fs.getVariant() instanceof Integer;
			
			int castCode = (int)fs.getVariant();
			switch (castCode) {
			case 1: {
				String startLabel = labeller.newLabel("-cast-int-to-char-", "");
				code.add(Label, startLabel);
				code.add(PushI, 128);
				code.add(Remainder);
				break;
			}
			case 2:
				code.add(ConvertF);
				break;
			case 3:
				code.add(ConvertI);
				break;
			case 4: {
				String startLabel = labeller.newLabel("-cast-int-or-char-to-bool-", "");
				String trueLabel  = labeller.newLabelSameNumber("-cast-true-", "");
				String falseLabel = labeller.newLabelSameNumber("-cast-false-", "");
				String joinLabel  = labeller.newLabelSameNumber("-cast-join-", "");
				
				code.add(Label, startLabel);
				code.add(JumpTrue, trueLabel);
				code.add(Jump, falseLabel);
				
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Jump, joinLabel);
				code.add(Label, falseLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, joinLabel);
				break;
			}
			default:
				break;
			}
		}

		///////////////////////////////////////////////////////////////////////////
		// leaf nodes (ErrorNode not necessary)
		public void visit(BooleanConstantNode node) {
			newValueCode(node);
			code.add(PushI, node.getValue() ? 1 : 0);
		}
		public void visit(CharConstantNode node) {
			newValueCode(node);
			code.add(PushI, (int)node.getValue());
		}
		public void visit(StringConstantNode node) {
			newValueCode(node);
			
			String string = node.getValue();
			String stringLabel = labeller.newLabel("-string-", "");
			
			// static string
			code.add(DLabel, stringLabel);
			
			code.add(DataI, 10);				// type id
			code.add(DataI, 5);  				// status 101
			code.add(DataC, 0); 				// ref count
			code.add(DataI, string.length());	// length
			
			code.add(DataS, string);
			code.add(PushD, stringLabel);
		}	
		public void visit(IntegerConstantNode node) {
			newValueCode(node);
			code.add(PushI, node.getValue());
		}
		public void visit(FloatConstantNode node) {
			newValueCode(node);
			code.add(PushF, node.getValue());
		}
		public void visit(IdentifierNode node) {
			newAddressCode(node);
			
			boolean isInputParam = false;
			boolean isReturnParam = false;
			boolean isReturnTuple = false;
			
			Binding binding = node.getBinding();
			int offset = binding.getMemoryLocation().getOffset();
			
			ParseNode fnBlock = node.getFunctionBlock();
			if (fnBlock != null) {
				ParseNode fnDef = fnBlock.getParent();
				ParseNode inputParams = fnDef.child(1);
				ParseNode returnParams = fnDef.child(2);
				
				for (int i = 0; i < inputParams.nChildren(); i++) {
					ParseNode inputParam = inputParams.child(i);
					ParseNode inputID = inputParam.child(1);
					
					if (node.getToken().getLexeme().equals(inputID.getToken().getLexeme())) {
						isInputParam = true;
					}
				}
				
				for (int i = 0; i < returnParams.nChildren(); i++) {
					ParseNode returnParam = returnParams.child(i);
					ParseNode returnID = returnParam.child(1);
					
					if (node.getToken().getLexeme().equals(returnID.getToken().getLexeme())) {
						isReturnParam = true;
					}
				}
				
				if (returnParams instanceof IdentifierNode) {
					if (node.getToken().getLexeme().equals(returnParams.getToken().getLexeme())) {
						isReturnTuple = true;
					}
				}
			}
			if (isInputParam) {
				code.add(PushD, RunTime.FRAME_POINTER);
				code.add(LoadI);
				
				code.add(PushI, 4);
				code.add(Subtract);
				code.add(LoadI);
				
				code.add(PushI, 8);
				code.add(Subtract);
				
				code.add(PushI, offset);
				code.add(Add);
			}
			else if (isReturnParam) {
				ParseNode fnDef = fnBlock.getParent();
				ParseNode returnParams = fnDef.child(2);
				
				code.add(PushD, RunTime.FRAME_POINTER);
				code.add(LoadI);
			
				if (returnParams.getType() instanceof TupleType){
					code.add(LoadI);
				}
				code.add(PushI, offset);
				code.add(Add);
				
				if (returnParams.getType() instanceof TupleType){
					code.add(PushI, TupleType.HEADER_LENGTH);
					code.add(Add);
				}
			}
			else if (isReturnTuple) {
				code.add(PushD, RunTime.FRAME_POINTER);
				code.add(LoadI);
			}
			else {
				StaticDeclarationNode staticDec = binding.getStaticDec();
				if (staticDec != null) {
					code.add(PushD, staticDec.getStaticVar());
				}
				else
					binding.generateAddress(code);
			}
		}
	}
}
