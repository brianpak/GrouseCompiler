package semanticAnalyzer;

import java.util.Arrays;
import java.util.List;

import lexicalAnalyzer.*;
import logging.GrouseLogger;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import parseTree.nodeTypes.ControlFlowTypes.*;
import parseTree.nodeTypes.GlobalDefTypes.*;
import parseTree.nodeTypes.LeafTypes.*;
import parseTree.nodeTypes.OperatorNodeTypes.*;
import parseTree.nodeTypes.PrintTypes.*;
import semanticAnalyzer.signatures.*;
import semanticAnalyzer.types.*;
import symbolTable.*;
import symbolTable.Binding.Binding;
import symbolTable.Binding.BindingHelper;
import symbolTable.Binding.FunctionBinding;
import symbolTable.Binding.TupleBinding;
import tokens.*;

class SemanticAnalysisVisitor4 extends ParseNodeVisitor.Default {
	@Override
	public void visitLeave(ParseNode node) {
		throw new RuntimeException("Node class unimplemented in SemanticAnalysisVisitor: " + node.getClass());
	}
	
	///////////////////////////////////////////////////////////////////////////
	// constructs larger than statements
	@Override
	public void visitEnter(ProgramNode node) 			{enterProgramScope(node);}
	public void visitLeave(ProgramNode node) 			{leaveScope(node);}
	
	public void visitEnter(TupleDefinitionNode node) 	{}
	public void visitLeave(TupleDefinitionNode node) 	{leaveScope(node);}
	
	public void visitEnter(FunctionDefinitionNode node)	{}
	public void visitLeave(FunctionDefinitionNode node)	{leaveScope(node);}
	
	public void visitEnter(FunctionBlockNode node)		{
		enterProcedureScope(node);
		
		node.createSubroutine();
		node.createTeardown();
	}
	public void visitLeave(FunctionBlockNode node)		{		
		ParseNode parent = node.getParent();
		ParseNode outputExprList = parent.child(2);

		if (outputExprList instanceof ParameterListNode ||
			outputExprList instanceof ExpressionListNode) {
			Scope scope = parent.getScope();
			SymbolTable symbolTable = scope.getSymbolTable();
			ParseNode firstOutputExpr = outputExprList.child(0).child(1);
			Binding binding = symbolTable.lookup(firstOutputExpr.getToken().getLexeme());
			int offset = binding.getMemoryLocation().getOffset();

			for (int i = 0; i < outputExprList.nChildren(); i++) {
				ParseNode idNode = outputExprList.child(i).child(1);
				binding = symbolTable.lookup(idNode.getToken().getLexeme());
				binding.getMemoryLocation().minusOffsetBy(offset);
				binding.getMemoryLocation().flipOffset();
			}
		}
		
		leaveScope(node);
	}
	
	public void visitEnter(MainBlockNode node)	{}
	public void visitLeave(MainBlockNode node) 	{}
	public void visitEnter(BlockNode node) 		{enterSubscope(node);}
	public void visitLeave(BlockNode node) 		{leaveScope(node);}
	
	
	///////////////////////////////////////////////////////////////////////////
	// helper methods for scoping.
	private void enterProgramScope(ParseNode node) {
		Scope scope = node.getScope();
		scope.enter();
	}	
	
	private void enterProcedureScope(ParseNode node) {
		Scope scope = Scope.createProcedureScope();
		scope.enter();
		
		// 8 bytes for Old FP and return ADDR
		scope.getAllocationStrategy().allocate(8);
		
		node.setScope(scope);
	}	

	private void enterSubscope(ParseNode node) {
		Scope baseScope = node.getLocalScope();
		Scope scope = baseScope.createSubscope();
		scope.enter();
		
		node.setScope(scope);
	}
	
	private void leaveScope(ParseNode node) {
		node.getScope().leave();
	}
	
	///////////////////////////////////////////////////////////////////////////
	// statements and declarations
	
	@Override
	public void visitLeave(StaticDeclarationNode node) {
		Scope scope = node.getLocalScope();
		SymbolTable symbolTable = scope.getSymbolTable();
		ParseNode idNode = node.child(0).child(0);
		Binding binding = symbolTable.lookup(idNode.getToken().getLexeme());
		binding.setStaticDec(node);
	}
	
	@Override
	public void visitLeave(DeclarationNode node) {
		IdentifierNode identifierNode = (IdentifierNode) node.child(0);
		ParseNode initializerNode = node.child(1);
		
		if (identifierNode.declarationCheck()) {
			Type type = initializerNode.getType();
			
			identifierNode.setType(type);
			node.setType(type);
			
			BindingHelper.addBindingToLocalScope(node.getToken().getLexeme(), identifierNode, type, true);
		}
	}
	
	@Override
	public void visitLeave(LetStatementNode node) {
		assert node.nChildren() == 2;
		
		FunctionSignatures.resetTV();
		
		ParseNode target = node.child(0);
		ParseNode initializer = node.child(1);
		
		Type t1 = target.getType();
		Type t2 = initializer.getType();

		String operation = LetStatementNode.RE_ASSIGNMENT;
		List<Type> childTypes = Arrays.asList(t1, t2);
		
		checkAndSetType(node, operation, childTypes);
	}
	
	@Override
	public void visitLeave(IfStatementNode node) {
		assert node.nChildren() >= 2;
		
		boolConditionalCheck(node);
	}

	@Override
	public void visitLeave(WhileStatementNode node) {
		assert node.nChildren() == 2;
		
		boolConditionalCheck(node);
	}
	
	private void boolConditionalCheck(ParseNode node) {
		ParseNode conditionalNode = node.child(0);
		
		Type type = conditionalNode.getType();
		if (type != PrimitiveType.BOOLEAN) {
			controlFlowError(node);
		}
	}
	
	@Override
	public void visitEnter(ForStatementNode node) {
		enterSubscope(node);
	}
	@Override
	public void visitLeave(ForStatementNode node) {
		leaveScope(node);
	}
	
	@Override
	public void visitEnter(ForConditionNode node) {
		// create temporary identifier on the symbol table
		
		Token forOp = node.getToken();
		
		if (forOp.isLextant(Keyword.INDEX)) {
			IdentifierNode identifierNode = (IdentifierNode) node.child(0);
			createIdentifier(identifierNode, PrimitiveType.INTEGER);
		}
		else if (forOp.isLextant(Keyword.ELEMENT)) {
			IdentifierNode identifierNode = (IdentifierNode) node.child(0);
			createIdentifier(identifierNode, PrimitiveType.FLOAT);
		}
		else if (forOp.isLextant(Keyword.PAIR)) {
			IdentifierNode identifierNode1 = (IdentifierNode) node.child(0);
			createIdentifier(identifierNode1, PrimitiveType.INTEGER);
			
			IdentifierNode identifierNode2 = (IdentifierNode) node.child(1);
			createIdentifier(identifierNode2, PrimitiveType.FLOAT);
		}
		else if (forOp.isLextant(Keyword.COUNT)) {
			IdentifierNode identifierNode1;
			IdentifierNode identifierNode2;
			
			if (node.nChildren() == 1) {
				identifierNode1 = (IdentifierNode) node.child(0).child(0);
				createIdentifier(identifierNode1, PrimitiveType.INTEGER);
			}
			else if (node.nChildren() == 2) {
				identifierNode1 = (IdentifierNode) node.child(0).child(1);
				createIdentifier(identifierNode1, PrimitiveType.INTEGER);
				
				identifierNode2 = (IdentifierNode) node.child(1).child(0);
				identifierNode2.setType(PrimitiveType.INTEGER);
			}
		}
	}
	public void createIdentifier(IdentifierNode identifierNode, Type type) {
		if (identifierNode.declarationCheck()) {
			identifierNode.setType(type);
			
			BindingHelper.addBindingToLocalScope(Keyword.IMMUTABLE.getLexeme(), identifierNode, type, false);
		}
	}
	
	@Override
	public void visitLeave(ForConditionNode node) {
		Token forOp = node.getToken();
		
		if (forOp.isLextant(Keyword.INDEX, Keyword.ELEMENT)) {
			IdentifierNode identifier = (IdentifierNode) node.child(0);
			ParseNode expr = node.child(1);
			
			Type exprType = expr.getType();
			
			if (!(exprType instanceof ArrayType)) {
				List<Type> childTypes = Arrays.asList(exprType);
				typeCheckError(node, childTypes);
			}
			
			// re-add binding if element forOp is used
			// because the subType is not known at visitEnter(ForCond)
			Type exprSubType = ((ArrayType)exprType).getSubType();
			if (forOp.isLextant(Keyword.ELEMENT))
			{
				identifier.setType(exprSubType);
				BindingHelper.reAddBindingToLocalScope(identifier, exprSubType);
			}
		}
		else if (forOp.isLextant(Keyword.PAIR)) {
			IdentifierNode identifier2 = (IdentifierNode) node.child(1);
			ParseNode expr = node.child(2);
			
			Type exprType = expr.getType();
			
			if (!(exprType instanceof ArrayType)) {
				List<Type> childTypes = Arrays.asList(exprType);
				typeCheckError(node, childTypes);
			}

			Type exprSubType = ((ArrayType)exprType).getSubType();
			
			identifier2.setType(exprSubType);
			BindingHelper.reAddBindingToLocalScope(identifier2, exprSubType);
		}
	}
	
	@Override
	public void visit(BreakStatementNode node) {
		if (!node.insideLoop()) {
			notInsideError(node);
		}
	}
	
	@Override
	public void visit(ContinueStatementNode node) {
		if (!node.insideLoop()) {
			notInsideError(node);
		}
	}
	
	@Override
	public void visit(ReturnStatementNode node) {
		if (!node.insideFunctionDefinition()) {
			notInsideError(node);
		}
	}
	
	public void visitLeave(CallStatementNode node) {
		assert node.child(0) instanceof FunctionInvocationNode;
	}
	
	public void visitLeave(DiagStatementNode node) {
		assert node.child(0).getType() == PrimitiveType.INTEGER;
	}
	
	public void visitLeave(FunctionInvocationNode node) {
		
		FunctionSignatures.resetTV();

		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		
		FunctionDefinitionNode fd = getFunctionDefinition(left);
		Type inputType = fd.child(1).getType();
		Type returnType = fd.child(2).getType();
		
		Type leftT = inputType;
		Type rightT = right.getType();

		List<Type> childTypes = Arrays.asList(leftT, rightT);
		checkAndSetType(node, FunctionInvocationNode.FUNCTION_INVOCATION, childTypes);
		
		node.setType(returnType);
	}

	private FunctionDefinitionNode getFunctionDefinition(ParseNode node) {
		IdentifierNode idNode = (IdentifierNode) node;
		FunctionBinding functionBinding = idNode.findFunctionBinding();
		FunctionDefinitionNode tNode = functionBinding.getFunctionDefinitionNode();
		
		return tNode;
	}

	///////////////////////////////////////////////////////////////////////////
	// expressions
	@Override
	public void visitLeave(BinaryOperatorNode node) {
		assert node.nChildren() == 2;
		
		FunctionSignatures.resetTV();
		
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		
		Type leftT = left.getType();
		Type rightT = right.getType();

		Lextant operator = operatorFor(node);
		List<Type> childTypes = Arrays.asList(leftT, rightT);
		
		setTypeAndSig(node, operator, childTypes);
	}
	
	@Override
	public void visitLeave(UnaryOperatorNode node) {
		assert node.nChildren() == 1;
		
		FunctionSignatures.resetTV();
		
		ParseNode right  = node.child(0);
		Type rightT = right.getType();

		Lextant operator = operatorFor(node);
		
		if (operator == Punctuator.LENGTH || operator == Punctuator.RECORD) {
			assert rightT.isReferenceType();
		}
		
		if (operator == Punctuator.ADDRESS || operator == Punctuator.RECORD) {
			node.setType(PrimitiveType.INTEGER);
		}
		else {
			List<Type> childTypes = Arrays.asList(rightT);
			setTypeAndSig(node, operator, childTypes);
		}
	}
	
	private Lextant operatorFor(OperatorNode node) {
		assert node.getToken() instanceof LextantToken;
		
		LextantToken token = (LextantToken) node.getToken();
		return token.getLextant();
	}
	
	private void setTypeAndSig(OperatorNode node, Object op, List<Type> childTypes) {
		
		FunctionSignatures signatures = FunctionSignatures.signaturesOf(op);
		if(signatures.accepts(childTypes)) {			
			FunctionSignature signature = FunctionSignatures.signature(op, childTypes);
			
			node.setType(signature.resultType());
			node.setSignature(signature);
		}
		else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}
	private void checkAndSetType(ParseNode node, Object op, List<Type> childTypes) {

		FunctionSignatures signatures = FunctionSignatures.signaturesOf(op);
		if (signatures.accepts(childTypes)) {
			FunctionSignature signature = FunctionSignatures.signature(op, childTypes);
			
			node.setType(signature.resultType());
		} 
		else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}
	
	@Override
	public void visitLeave(ExpressionListNode node) {
		int nChildren = node.nChildren();
		
		if (nChildren == 0) {
			node.setType(PrimitiveType.VOID);
		}
		else if (nChildren == 1){
			ParseNode child = node.child(0);
			node.setType(child.getType());
		}
		else {
			Type[] types = new Type[nChildren];
			for (int i = 0; i < nChildren; i++) {
				ParseNode child = node.child(i);
				types[i] = child.getType();
			}
			TupleType tType = new TupleType(types);
			
			node.setType(tType);
		}
	}
	
	@Override
	public void visitLeave(FreshOperatorNode node) {
		FunctionSignatures.resetTV();
		
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		
		Type leftT = left.getType();
		Type rightT = right.getType();
		
		List<Type> childTypes = Arrays.asList(leftT, rightT);
		
		String operation = node.getOperation();
		
		switch (operation) {
		case FreshOperatorNode.ARRAY_FRESH_CREATION: 
		{
			setTypeAndSig(node, FreshOperatorNode.ARRAY_FRESH_CREATION, childTypes);
		
			break;
		}
		case FreshOperatorNode.TUPLE_FRESH_CREATION:
		{
			if (leftT instanceof TupleType && rightT instanceof TupleType) {
				
				setTypeAndSig(node, FreshOperatorNode.TUPLE_FRESH_CREATION, childTypes);
				node.setType(leftT);
			}
			else {
				typeCheckError(node, childTypes);
			}
			break;
		}
			
		default:
			break;
		}
	}
	
	@Override
	public void visitLeave(CopyOperatorNode node) {
		assert node.nChildren() == 1;
		
		FunctionSignatures.resetTV();
		
		ParseNode child  = node.child(0);
		Type childType = child.getType();
		
		if (childType instanceof ArrayType) {
			node.setOperation(CopyOperatorNode.ARRAY_COPY_OPERATION);
			node.setType(childType);
		}
		else if (childType instanceof TupleType) {
			node.setOperation(CopyOperatorNode.TUPLE_COPY_OPERATION);
			node.setType(childType);
		}
		else {
			List<Type> childTypes = Arrays.asList(childType);
			typeCheckError(node, childTypes);
		}
	}
	
	@Override
	public void visitLeave(SubelementAccessNode node) {
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		
		Type leftT = left.getType();
		Type rightT = right.getType();
		
		List<Type> childTypes = Arrays.asList(leftT, rightT);
		
		if (leftT instanceof TupleType) {
			TupleBinding tupleBinding = null;
			FunctionBinding functionBinding = null;
			IdentifierNode idNode;
			
			if (left instanceof FreshOperatorNode) {
				idNode = ((FreshOperatorNode) left).getIdentifierNode();
				tupleBinding = (TupleBinding) idNode.findVariableBinding();
			}
			else if (left instanceof CopyOperatorNode) {
				idNode = ((CopyOperatorNode) left).getIdentifierNode();
				tupleBinding = (TupleBinding) idNode.findVariableBinding();
			}
			else if (left instanceof IdentifierNode){
				idNode = (IdentifierNode) left;
				Binding binding = idNode.findVariableBinding();
				
				if (binding instanceof TupleBinding) {
					tupleBinding = (TupleBinding) binding;
				}
				else if (binding instanceof FunctionBinding) {
					functionBinding = (FunctionBinding) binding;
				}
			}

			if (tupleBinding == null && functionBinding == null ) {
				typeCheckError(node, childTypes);
			}
			else if (functionBinding != null) {
				FunctionDefinitionNode fd = getFunctionDefinition(left);
				ParseNode outputParams = fd.child(2);
				Binding binding;
				
				if (outputParams instanceof IdentifierNode) {
					TupleDefinitionNode td = getTupleDefinition(outputParams);
					binding = td.bindingOf(right.getToken().getLexeme());
				}
				else {
					binding = fd.bindingOf(right.getToken().getLexeme());
				}
				
				IdentifierNode id = (IdentifierNode) right;
				Type subElemType = binding.getType();
				
				node.setType(subElemType);
				id.setType(subElemType);
				id.setBinding(binding);
			}
			else if (tupleBinding != null) {
				TupleDefinitionNode td = getTupleDefinition(left);
				Binding binding = td.bindingOf(right.getToken().getLexeme());
				
				IdentifierNode id = (IdentifierNode) right;
				Type subElemType = binding.getType();
				
				node.setType(subElemType);
				id.setType(subElemType);
				id.setBinding(binding);
			}
		}
		else {
			typeCheckError(node, childTypes);
		}
	}
	
	private TupleDefinitionNode getTupleDefinition(ParseNode node) {
		IdentifierNode idNode = (IdentifierNode) node;
		TupleBinding tupleBinding = idNode.findTupleBinding();
		TupleDefinitionNode tNode = tupleBinding.getTupleDefinitionNode();
		
		return getTupleDefinition(tNode);
	}
	private TupleDefinitionNode getTupleDefinition(TupleDefinitionNode node) {
		ParseNode arg = node.child(1);
		
		if (arg instanceof IdentifierNode) {
			return getTupleDefinition(arg);
		}
		else {
			return node;
		}
	}

	@Override
	public void visitLeave(ArrayOperatorNode node) {
		String operation = node.getOperation();
		switch (operation) {
		case ArrayOperatorNode.POPULATED_CREATION:
		{
			assert node.nChildren() >= 1;
			
			FunctionSignatures.resetTV();
			
			// type check for every child
			for (int i = 0; i < node.nChildren(); i++) {
				ParseNode currChild = node.child(i);
				Type currChildType = currChild.getType();
				
				List<Type> childTypes = Arrays.asList(currChildType);
				setTypeAndSig(node, operation, childTypes);
			}
			
			break;
		}
		case ArrayOperatorNode.INDEX_OPERATION:
		{
			assert node.nChildren() == 2;
			
			FunctionSignatures.resetTV();
			
			ParseNode left  = node.child(0);
			ParseNode right = node.child(1);
			
			Type leftT = left.getType();
			Type rightT = right.getType();
			
			List<Type> childTypes = Arrays.asList(leftT, rightT);
			setTypeAndSig(node, operation, childTypes);

			break;
		}
		case ArrayOperatorNode.CONCATENATION_OPERATION:
		{
			assert node.nChildren() >= 2;
			
			FunctionSignatures.resetTV();
			
			for (int i = 0; i < node.nChildren(); i++) {
				ParseNode currChild = node.child(i);
				Type currChildType = currChild.getType();

				List<Type> childTypes = Arrays.asList(currChildType);
				setTypeAndSig(node, operation, childTypes);
			}

			break;
		}
		default:
			break;
		}
	}
	
	public void visitLeave(NullNode node) {
		assert node.child(0).getType().isReferenceType();
		node.setType(node.child(0).getType());
	}
	
	///////////////////////////////////////////////////////////////////////////
	// simple leaf nodes
	@Override
	public void visit(StringConstantNode node) 	{node.setType(PrimitiveType.STRING);}
	public void visit(CharConstantNode node)	{node.setType(PrimitiveType.CHARACTER);}
	public void visit(FloatConstantNode node) 	{node.setType(PrimitiveType.FLOAT);}
	public void visit(ErrorNode node) 			{node.setType(PrimitiveType.ERROR);}
	public void visit(IntegerConstantNode node) {node.setType(PrimitiveType.INTEGER);}
	public void visit(BooleanConstantNode node) {node.setType(PrimitiveType.BOOLEAN);}
	public void visit(NewlineNode node) 		{}
	public void visit(SeparatorNode node) 		{}
	
	///////////////////////////////////////////////////////////////////////////
	// IdentifierNodes, with helper methods

	@Override
	public void visit(IdentifierNode node) {
		if (!isBeingDeclared(node) && !isBeingReAssigned(node) && 
			!isParameterType(node) && !isParameter(node) && !isBeingDefined(node) &&
			!isSubElement(node) && !isFunctionReturn(node)) {		
			
			// a binding has to exist
			Binding binding = node.findVariableBinding();
			
			Type type = binding.getType();
			
			node.setType(type);
			node.setBinding(binding);
		}
		else if (isBeingReAssigned(node)) {
			
			// a binding has to exist
			Binding binding = node.findVariableBinding();
			Type type = binding.getType();

			String declarationKind = binding.getDeclarationKind();
			
			// declaration has to be mutable
			if (declarationKind.equals(Keyword.MUTABLE.getLexeme())) {
				node.setType(type);
				node.setBinding(binding);
			}
			else {
				reAssignmentError(node);
				node.setType(PrimitiveType.ERROR);
			}
		}
		else if (isFunctionReturn(node)) {
			// a binding has to exist
			Binding binding = node.findVariableBinding();
			binding.setDeclarationType(Keyword.MUTABLE.getLexeme());
			Type type = binding.getType();

			node.setType(type);
			node.setBinding(binding);
		}
	}
	private boolean isBeingDeclared(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof DeclarationNode) && (node == parent.child(0));
	}
	private boolean isBeingDefined(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof TupleDefinitionNode) && (node == parent.child(0));
	}
	private boolean isBeingReAssigned(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof LetStatementNode) && (node == parent.child(0));
	}
	private boolean isParameterType(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof ParameterNode) && (node == parent.child(0));
	}
	private boolean isParameter(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof ParameterNode) && (node == parent.child(1));
	}
	private boolean isSubElement(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof SubelementAccessNode) && (node == parent.child(1));
	}
	private boolean isFunctionReturn(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof FunctionDefinitionNode) && (node == parent.child(2));
	}
	
	///////////////////////////////////////////////////////////////////////////
	// error logging/printing
	
	public void notInsideError(ParseNode node) {
		Token token = node.getToken();
		
		logError(token.getLexeme() + " not inside " + token.getLocation());	
	}
	private void controlFlowError(ParseNode node) {
		Token token = node.getToken();
		
		logError(token.getLexeme() + " statement error at " + token.getLocation());	
	}
	private void reAssignmentError(ParseNode node) {
		Token token = node.getToken();
		
		logError("identifier " + token.getLexeme() + " at " + token.getLocation()
				+ " is immutable");	
	}
	private void typeCheckError(ParseNode node, List<Type> operandTypes) {
		Token token = node.getToken();
		
		logError("operator " + token.getLexeme() + " not defined for types " 
				 + operandTypes  + " at " + token.getLocation());	
	}
	private void logError(String message) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.semanticAnalyzer");
		log.severe(message);
	}
}