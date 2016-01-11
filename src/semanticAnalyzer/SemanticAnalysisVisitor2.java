package semanticAnalyzer;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Punctuator;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.IdentifierNode;
import parseTree.nodeTypes.NullNode;
import parseTree.nodeTypes.TypeNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionDefinitionNode;
import parseTree.nodeTypes.GlobalDefTypes.ParameterListNode;
import parseTree.nodeTypes.GlobalDefTypes.ParameterNode;
import parseTree.nodeTypes.GlobalDefTypes.TupleDefinitionNode;
import semanticAnalyzer.types.ArrayType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.TupleType;
import semanticAnalyzer.types.Type;
import symbolTable.Scope;
import symbolTable.Binding.*;
import tokens.PrimitiveTypeToken;
import tokens.Token;

public class SemanticAnalysisVisitor2 extends ParseNodeVisitor.Default {
	
	public void visitEnter(TupleDefinitionNode node) {
		enterTupleScope(node);
	}
	public void visitLeave(TupleDefinitionNode node) {
		IdentifierNode identifierNode = (IdentifierNode) node.child(0);
		ParseNode arg = node.child(1);

		Type type = arg.getType();
		identifierNode.setType(type);

		BindingHelper.reAddTupleBindingToProgramScope(identifierNode, type);
	}
	
	public void visitEnter(FunctionDefinitionNode node) {
		enterParameterScope(node);
	}
	public void visitLeave(FunctionDefinitionNode node) {
		IdentifierNode identifierNode = (IdentifierNode) node.child(0);
		ParseNode arg = node.child(2);

		Type type = arg.getType();
		identifierNode.setType(type);

		BindingHelper.reAddFunctionBindingToProgramScope(identifierNode, type);
	}
	
	private void enterTupleScope(ParseNode node) {
		Scope scope = node.getScope();
		scope.enter();
	}
	private void enterParameterScope(ParseNode node) {
		Scope scope = node.getScope();
		scope.enter();
	}
	
	public void visitEnter(ParameterListNode node) {
		node.setContainsTupleParameter();
		node.setIsReturnParameterList();
	}
	
	public void visitLeave(ParameterListNode node) {
		int nChildren = node.nChildren();
		if (nChildren == 0) {
			node.setType(PrimitiveType.VOID);
		}
		else if (nChildren == 1) {
			ParseNode child = node.child(0);
			node.setType(child.getType());
		}
		else {
			Type[] subTypes = new Type[nChildren];
			for (int i = 0; i < nChildren; i++) {
				subTypes[i] = node.child(i).getType();
			}
			
			TupleType t = new TupleType(subTypes);
			node.setType(t);
		}
	}

	// CREATE BINDINGS (ALLOCATION) ONLY IF
	// ALL OF THE PARAMETERTYPES ARE NON-TUPLE TYPES
	// AND
	// PARAMLIST IS NOT A RETURN PARAMLIST (FUNC)
	public void visitLeave(ParameterNode node) {
		ParameterListNode paramListNode = (ParameterListNode) node.getParent();
		if (!paramListNode.getContainsTupleParameter() &&
			!paramListNode.getIsReturnParameterList()) {
			
			// works like a declaration node
			ParseNode typeNode = node.child(0);
			IdentifierNode identifierNode = (IdentifierNode) node.child(1);
			
			Type type = typeNode.getType();
			identifierNode.setType(type);
			node.setType(type);
			
			BindingHelper.addBindingToLocalScope(Keyword.MUTABLE.getLexeme(), identifierNode, type, false);
		}
	}

	public void visitLeave(TypeNode node) {
		if (node.nChildren() == 0) { 								   // primitive typenode
			
			Token currToken = node.getToken();
			assert currToken instanceof PrimitiveTypeToken;
			
			String primitiveTypeString = currToken.getLexeme();
			PrimitiveType primitiveType = PrimitiveType.returnPrimitiveType(primitiveTypeString);
			node.setType(primitiveType);
		}
		else if (node.nChildren() == 1) {
			assert node.getToken().isLextant(Punctuator.OPEN_BRACKET); // array typenode
			
			ParseNode child = node.child(0);
			assert child instanceof TypeNode;
			
			// new arrayType and set its subType
			ArrayType currType = new ArrayType(child.getType());

			// set the arrayType as the node's type
			node.setType(currType);
		}
	}
	
	public void visitLeave(NullNode node) {
		node.setType(node.child(0).getType());
	}
}
