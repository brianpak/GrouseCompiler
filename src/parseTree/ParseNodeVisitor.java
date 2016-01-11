package parseTree;

import parseTree.nodeTypes.*;
import parseTree.nodeTypes.ControlFlowTypes.*;
import parseTree.nodeTypes.GlobalDefTypes.CallStatementNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionBlockNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionDefinitionNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionInvocationNode;
import parseTree.nodeTypes.GlobalDefTypes.ParameterListNode;
import parseTree.nodeTypes.GlobalDefTypes.ParameterNode;
import parseTree.nodeTypes.GlobalDefTypes.ReturnStatementNode;
import parseTree.nodeTypes.GlobalDefTypes.SubelementAccessNode;
import parseTree.nodeTypes.GlobalDefTypes.TupleDefinitionNode;
import parseTree.nodeTypes.LeafTypes.*;
import parseTree.nodeTypes.OperatorNodeTypes.ArrayOperatorNode;
import parseTree.nodeTypes.OperatorNodeTypes.BinaryOperatorNode;
import parseTree.nodeTypes.OperatorNodeTypes.CopyOperatorNode;
import parseTree.nodeTypes.OperatorNodeTypes.FreshOperatorNode;
import parseTree.nodeTypes.OperatorNodeTypes.UnaryOperatorNode;
import parseTree.nodeTypes.PrintTypes.*;

// Visitor pattern with pre- and post-order visits
public interface ParseNodeVisitor {
	
	// non-leaf nodes: visitEnter and visitLeave
	void visitEnter(BinaryOperatorNode node);
	void visitLeave(BinaryOperatorNode node);
	void visitEnter(UnaryOperatorNode node);
	void visitLeave(UnaryOperatorNode node);
	void visitEnter(ArrayOperatorNode node);
	void visitLeave(ArrayOperatorNode node);
	void visitEnter(FreshOperatorNode node);
	void visitLeave(FreshOperatorNode node);
	void visitEnter(CopyOperatorNode node);
	void visitLeave(CopyOperatorNode node);
	
	void visitEnter(ProgramNode node);
	void visitLeave(ProgramNode node);	
	void visitEnter(MainBlockNode node);
	void visitLeave(MainBlockNode node);
	void visitEnter(FunctionBlockNode node);
	void visitLeave(FunctionBlockNode node);

	void visitEnter(StaticDeclarationNode node);
	void visitLeave(StaticDeclarationNode node);
	void visitEnter(DeclarationNode node);
	void visitLeave(DeclarationNode node);
	void visitEnter(LetStatementNode node);
	void visitLeave(LetStatementNode node);
	
	void visitEnter(IfStatementNode node);
	void visitLeave(IfStatementNode node);
	void visitEnter(WhileStatementNode node);
	void visitLeave(WhileStatementNode node);
	void visitEnter(ForStatementNode node);
	void visitLeave(ForStatementNode node);
	void visitEnter(ForConditionNode node);
	void visitLeave(ForConditionNode node);
	void visitEnter(BlockNode node);
	void visitLeave(BlockNode node);
	
	void visitEnter(PrintStatementNode node);
	void visitLeave(PrintStatementNode node);
	void visitEnter(ParseNode node);
	void visitLeave(ParseNode node);
	void visitEnter(CallStatementNode node);
	void visitLeave(CallStatementNode node);
	void visitEnter(DiagStatementNode node);
	void visitLeave(DiagStatementNode node);

	void visitEnter(TypeNode node);
	void visitLeave(TypeNode node);
	void visitEnter(NullNode node);
	void visitLeave(NullNode node);
	
	void visitEnter(TupleDefinitionNode node);
	void visitLeave(TupleDefinitionNode node);
	void visitEnter(FunctionDefinitionNode node);
	void visitLeave(FunctionDefinitionNode node);
	void visitEnter(ParameterListNode node);
	void visitLeave(ParameterListNode node);
	void visitEnter(ParameterNode node);
	void visitLeave(ParameterNode node);
	
	void visitEnter(ExpressionListNode node);
	void visitLeave(ExpressionListNode node);
	void visitEnter(SubelementAccessNode node);
	void visitLeave(SubelementAccessNode node);
	void visitEnter(FunctionInvocationNode node);
	void visitLeave(FunctionInvocationNode node);
	
	// leaf nodes: visitLeaf only
	void visit(IdentifierNode node);
	void visit(BreakStatementNode node);
	void visit(ContinueStatementNode node);
	void visit(ReturnStatementNode node);
	
	void visit(BooleanConstantNode node);
	void visit(IntegerConstantNode node);
	void visit(FloatConstantNode node);
	void visit(CharConstantNode node);
	void visit(StringConstantNode node);
	
	void visit(ErrorNode node);
	void visit(NewlineNode node);
	void visit(SeparatorNode node);

	
	public static class Default implements ParseNodeVisitor
	{
		public void defaultVisit(ParseNode node) 			{}
		public void defaultVisitEnter(ParseNode node)		{defaultVisit(node);}
		public void defaultVisitLeave(ParseNode node) 		{defaultVisit(node);}		
		public void defaultVisitForLeaf(ParseNode node) 	{defaultVisit(node);}
		
		public void visitEnter(BinaryOperatorNode node) 	{defaultVisitEnter(node);}
		public void visitLeave(BinaryOperatorNode node) 	{defaultVisitLeave(node);}
		public void visitEnter(UnaryOperatorNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(UnaryOperatorNode node) 		{defaultVisitLeave(node);}
		public void visitEnter(ArrayOperatorNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(ArrayOperatorNode node) 		{defaultVisitLeave(node);}
		public void visitEnter(FreshOperatorNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(FreshOperatorNode node) 		{defaultVisitLeave(node);}
		public void visitEnter(CopyOperatorNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(CopyOperatorNode node) 		{defaultVisitLeave(node);}

		public void visitEnter(ProgramNode node) 			{defaultVisitEnter(node);}
		public void visitLeave(ProgramNode node) 			{defaultVisitLeave(node);}
		public void visitEnter(MainBlockNode node) 			{defaultVisitEnter(node);}
		public void visitLeave(MainBlockNode node) 			{defaultVisitLeave(node);}
		public void visitEnter(FunctionBlockNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(FunctionBlockNode node) 		{defaultVisitLeave(node);}
		
		public void visitEnter(StaticDeclarationNode node) 	{defaultVisitEnter(node);}
		public void visitLeave(StaticDeclarationNode node) 	{defaultVisitLeave(node);}
		public void visitEnter(DeclarationNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(DeclarationNode node) 		{defaultVisitLeave(node);}
		public void visitEnter(LetStatementNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(LetStatementNode node) 		{defaultVisitLeave(node);}
		
		public void visitEnter(IfStatementNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(IfStatementNode node) 		{defaultVisitLeave(node);}
		public void visitEnter(WhileStatementNode node) 	{defaultVisitEnter(node);}
		public void visitLeave(WhileStatementNode node) 	{defaultVisitLeave(node);}
		public void visitEnter(ForStatementNode node)		{defaultVisitEnter(node);}
		public void visitLeave(ForStatementNode node)		{defaultVisitLeave(node);}
		public void visitEnter(ForConditionNode node)		{defaultVisitEnter(node);}
		public void visitLeave(ForConditionNode node)		{defaultVisitLeave(node);}
		public void visitEnter(BlockNode node) 				{defaultVisitEnter(node);}
		public void visitLeave(BlockNode node) 				{defaultVisitLeave(node);}
		
		public void visitEnter(PrintStatementNode node) 	{defaultVisitEnter(node);}
		public void visitLeave(PrintStatementNode node) 	{defaultVisitLeave(node);}
		public void visitEnter(ParseNode node) 				{defaultVisitEnter(node);}
		public void visitLeave(ParseNode node) 				{defaultVisitLeave(node);}
		public void visitEnter(CallStatementNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(CallStatementNode node) 		{defaultVisitLeave(node);}
		public void visitEnter(DiagStatementNode node) 		{defaultVisitEnter(node);}
		public void visitLeave(DiagStatementNode node) 		{defaultVisitLeave(node);}

		public void visitEnter(TypeNode node)				{defaultVisitEnter(node);}
		public void visitLeave(TypeNode node)				{defaultVisitLeave(node);}
		public void visitEnter(NullNode node)				{defaultVisitEnter(node);}
		public void visitLeave(NullNode node)				{defaultVisitLeave(node);}
		
		public void visitEnter(TupleDefinitionNode node)	{defaultVisitEnter(node);}
		public void visitLeave(TupleDefinitionNode node) 	{defaultVisitLeave(node);}
		public void visitEnter(FunctionDefinitionNode node)	{defaultVisitEnter(node);}
		public void visitLeave(FunctionDefinitionNode node) {defaultVisitLeave(node);}
		public void visitEnter(ParameterListNode node)		{defaultVisitEnter(node);}
		public void visitLeave(ParameterListNode node)		{defaultVisitLeave(node);}
		public void visitEnter(ParameterNode node)			{defaultVisitEnter(node);}
		public void visitLeave(ParameterNode node)			{defaultVisitLeave(node);}
		
		public void visitEnter(ExpressionListNode node)		{defaultVisitEnter(node);}
		public void visitLeave(ExpressionListNode node)		{defaultVisitLeave(node);}
		public void visitEnter(SubelementAccessNode node)	{defaultVisitEnter(node);}
		public void visitLeave(SubelementAccessNode node)	{defaultVisitLeave(node);}
		public void visitEnter(FunctionInvocationNode node)	{defaultVisitEnter(node);}
		public void visitLeave(FunctionInvocationNode node)	{defaultVisitLeave(node);}
		
		
		public void visit(IdentifierNode node) 				{defaultVisitForLeaf(node);}
		public void visit(BreakStatementNode node) 			{defaultVisitForLeaf(node);}
		public void visit(ContinueStatementNode node) 		{defaultVisitForLeaf(node);}
		public void visit(ReturnStatementNode node) 		{defaultVisitForLeaf(node);}
		
		public void visit(BooleanConstantNode node)			{defaultVisitForLeaf(node);}
		public void visit(IntegerConstantNode node) 		{defaultVisitForLeaf(node);}
		public void visit(FloatConstantNode node) 			{defaultVisitForLeaf(node);}
		public void visit(CharConstantNode node) 			{defaultVisitForLeaf(node);}
		public void visit(StringConstantNode node) 			{defaultVisitForLeaf(node);}
		
		public void visit(ErrorNode node)					{defaultVisitForLeaf(node);}
		public void visit(NewlineNode node) 				{defaultVisitForLeaf(node);}	
		public void visit(SeparatorNode node) 				{defaultVisitForLeaf(node);}

	}
}
