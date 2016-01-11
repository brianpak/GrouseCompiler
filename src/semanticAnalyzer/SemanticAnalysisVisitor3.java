package semanticAnalyzer;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.IdentifierNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionDefinitionNode;
import parseTree.nodeTypes.GlobalDefTypes.ParameterListNode;
import parseTree.nodeTypes.GlobalDefTypes.ParameterNode;
import parseTree.nodeTypes.GlobalDefTypes.TupleDefinitionNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.TupleType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding.*;


public class SemanticAnalysisVisitor3 extends ParseNodeVisitor.Default {
	
	public void visitEnter(TupleDefinitionNode node) 	{}
	public void visitLeave(TupleDefinitionNode node) 	{
		IdentifierNode identifierNode = (IdentifierNode) node.child(0);
		ParseNode arg = node.child(1);
		
		Type type;
		if (arg instanceof IdentifierNode) {
			type = getTupleType(node);
			
			identifierNode.setType(type);
			arg.setType(type);
		}
		else {
			type = arg.getType();
			
			identifierNode.setType(type);
		}
		BindingHelper.reAddTupleBindingToProgramScope(identifierNode, type);
	}
	
	private Type getTupleType(ParseNode node) {
		IdentifierNode idNode = (IdentifierNode) node;
		TupleBinding tupleBinding = idNode.findTupleBinding();
		TupleDefinitionNode tNode = tupleBinding.getTupleDefinitionNode();
		
		return getTupleType(tNode);
	}
	private Type getTupleType(TupleDefinitionNode node) {
		ParseNode arg = node.child(1);
		
		if (arg instanceof IdentifierNode) {
			return getTupleType(arg);
		}
		else {
			return arg.getType();
		}
	}
	
	public void visitEnter(FunctionDefinitionNode node) {}
	public void visitLeave(FunctionDefinitionNode node) {
		IdentifierNode identifierNode = (IdentifierNode) node.child(0);
		
		ParseNode output = node.child(2);
		Type outpuType = output.getType();
		if (output instanceof IdentifierNode) {
			outpuType = getTupleType(output);
			output.setType(outpuType);
		}

		BindingHelper.reAddFunctionBindingToProgramScope(identifierNode, outpuType);
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

	public void visitLeave(ParameterNode node) {
		ParameterListNode paramListNode = (ParameterListNode) node.getParent();
		if (paramListNode.getContainsTupleParameter() ||
			paramListNode.getIsReturnParameterList()) {
			
			// works like a declaration node
			ParseNode typeNode = node.child(0);
			IdentifierNode identifierNode = (IdentifierNode) node.child(1);
			
			Type type = typeNode.getType();
			identifierNode.setType(type);
			node.setType(type);
			
			BindingHelper.addBindingToLocalScope(Keyword.MUTABLE.getLexeme(), identifierNode, type, false);
		}
	}
	
	public void visit(IdentifierNode node) {
		if (isParameterType(node)) {
			// find the tuple type
			TupleBinding tupleBinding = node.findTupleBinding();
			TupleDefinitionNode tNode = tupleBinding.getTupleDefinitionNode();
			
			Type type = getTupleType(tNode);
			
			node.setType(type);
			node.setBinding(tupleBinding);
		}
	}
	
	private boolean isParameterType(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof ParameterNode) && (node == parent.child(0));
	}
}
