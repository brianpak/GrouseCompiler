package semanticAnalyzer;

import lexicalAnalyzer.Keyword;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.IdentifierNode;
import parseTree.nodeTypes.ControlFlowTypes.ProgramNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionDefinitionNode;
import parseTree.nodeTypes.GlobalDefTypes.TupleDefinitionNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Scope;
import symbolTable.Binding.BindingHelper;

class SemanticAnalysisVisitor1 extends ParseNodeVisitor.Default {
	
	@Override
	public void visitEnter(ProgramNode node) {
		createProgramScope(node);
	}
	
	public void visitEnter(TupleDefinitionNode node) {
		createTupleScope(node);
		
		IdentifierNode identifierNode = (IdentifierNode) node.child(0);
		Type type = PrimitiveType.NO_TYPE;
		identifierNode.setType(type);
		
		BindingHelper.addTupleBindingToProgramScope(Keyword.IMMUTABLE.getLexeme(), identifierNode, type, false, node);
	}

	public void visitEnter(FunctionDefinitionNode node) {
		createParameterScope(node);
		
		IdentifierNode identifierNode = (IdentifierNode) node.child(0);
		Type type = PrimitiveType.NO_TYPE;
		identifierNode.setType(type);
		
		BindingHelper.addFunctionBindingToProgramScope(Keyword.IMMUTABLE.getLexeme(), identifierNode, type, false, node);
	}
	
	private void createProgramScope(ParseNode node) {
		Scope scope = Scope.createProgramScope();
		node.setScope(scope);
	}
	
	private void createTupleScope(ParseNode node) {
		Scope scope = Scope.createTupleScope();
		node.setScope(scope);
	}
	
	private void createParameterScope(ParseNode node) {
		Scope scope = Scope.createParameterScope();
		node.setScope(scope);
	}
}