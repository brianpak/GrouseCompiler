package parser;

import java.util.Arrays;

import logging.GrouseLogger;
import parseTree.*;
import parseTree.nodeTypes.*;
import parseTree.nodeTypes.ControlFlowTypes.*;
import parseTree.nodeTypes.GlobalDefTypes.*;
import parseTree.nodeTypes.LeafTypes.*;
import parseTree.nodeTypes.OperatorNodeTypes.*;
import parseTree.nodeTypes.PrintTypes.*;
import tokens.*;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import lexicalAnalyzer.Scanner;


public class Parser {
	private Scanner scanner;
	private Token nowReading;
	private Token previouslyRead;
	
	public static ParseNode parse(Scanner scanner) {
		Parser parser = new Parser(scanner);
		return parser.parse();
	}
	public Parser(Scanner scanner) {
		super();
		this.scanner = scanner;
	}
	
	public ParseNode parse() {
		readToken();
		return parseProgram();
	}

	////////////////////////////////////////////////////////////
	// "program" is the start symbol S
	// S -> MAIN mainBlock
	
	private ParseNode parseProgram() {
		if(!startsProgram(nowReading)) {
			return syntaxErrorNode("program");
		}
		// nowReading can be tuple, func, dec or main
		ParseNode program = new ProgramNode(nowReading);
		
		while (startsGlobalDefinition(nowReading) ||
			   startsDeclaration(nowReading)) {
			if (startsTupleDefinition(nowReading)) {
				ParseNode tupleDefinition = parseTupleDefinition();
				program.appendChild(tupleDefinition);
			}
			else if (startsFunctionDefinition(nowReading)) {
				ParseNode functionDefinition = parseFunctionDefinition();
				program.appendChild(functionDefinition);
			}
			else if (startsStaticDeclaration(nowReading)) {
				ParseNode staticDeclaration = parseStaticDeclaration();
				program.appendChild(staticDeclaration);
			}
			else if (startsDeclaration(nowReading)) {
				ParseNode declaration = parseDeclaration();
				program.appendChild(declaration);
			}
		}
		
		expect(Keyword.MAIN);
		ParseNode mainBlock = parseMainBlock();
		program.appendChild(mainBlock);
		
		if(!(nowReading instanceof NullToken)) {
			return syntaxErrorNode("end of program");
		}
		
		return program;
	}
	private boolean startsProgram(Token token) {
		return startsProgramBlock(token) ||
			   startsGlobalDefinition(token);
	}
	private boolean startsProgramBlock(Token token) {
		return token.isLextant(Keyword.MAIN);
	}
	private boolean startsGlobalDefinition(Token token) {
		return token.isLextant(Keyword.TUPLE, Keyword.FUNC, Keyword.IMMUTABLE, Keyword.MUTABLE, Keyword.STATIC);
	}
	private boolean startsTupleDefinition(Token token) {
		return token.isLextant(Keyword.TUPLE);
	}
	private boolean startsFunctionDefinition(Token token) {
		return token.isLextant(Keyword.FUNC);
	}
	
	///////////////////////////////////////////////////////////
	// tupleStatement
	
	private ParseNode parseTupleDefinition() {
		ParseNode tupleDefinitionNode = new TupleDefinitionNode(nowReading);
		expect(Keyword.TUPLE);
		
		ParseNode identifier1 = parseIdentifier();
		tupleDefinitionNode.appendChild(identifier1);
		
		tupleDefinitionNode = parseParameterTuple(tupleDefinitionNode);
		
		expect(Punctuator.TERMINATOR);

		return tupleDefinitionNode;
	}
	
	private ParseNode parseParameterTuple(ParseNode node) {
		if (startsIdentifier(nowReading)) {
			ParseNode identifier2 = parseIdentifier();
			node.appendChild(identifier2);
		}
		else {
			node = parseParameterList(node);
		}
		
		return node;
	}
	
	private ParseNode parseParameterList(ParseNode node) {
		if (nowReading.isLextant(Punctuator.OPEN_PARENTHESES)) {
			Token parameter = nowReading;
			readToken();
			
			ParseNode paramListNode = new ParameterListNode(parameter);
			
			// has at least one parameter
			if (!nowReading.isLextant(Punctuator.CLOSE_PARENTHESES)) {
				ParseNode left = parseParameterType();
				ParseNode right = parseIdentifier();
				ParseNode paramNode = ParameterNode.withChildren(parameter, left, right);
				
				paramListNode.appendChild(paramNode);
				
				while(nowReading.isLextant(Punctuator.SEPARATOR)) {
					readToken();
					
					left = parseParameterType();
					right = parseIdentifier();
					paramNode = ParameterNode.withChildren(parameter, left, right);
					
					paramListNode.appendChild(paramNode);
				}
			}
			
			node.appendChild(paramListNode);
			
			expect(Punctuator.CLOSE_PARENTHESES);
		}
		else {
			return syntaxErrorNode("parameter tuple");
		}
		
		return node;
	}
	
	private ParseNode parseFunctionDefinition() {
		ParseNode functionDefinitionNode = new FunctionDefinitionNode(nowReading);
		expect(Keyword.FUNC);
		
		ParseNode identifier = parseIdentifier();
		functionDefinitionNode.appendChild(identifier);
		
		functionDefinitionNode = parseParameterList(functionDefinitionNode);
		expect(Punctuator.ARROW);
		
		functionDefinitionNode = parseParameterTuple(functionDefinitionNode);
		
		ParseNode functionBlockNode = parseFunctionBlock();
		functionDefinitionNode.appendChild(functionBlockNode);

		return functionDefinitionNode;
	}

	///////////////////////////////////////////////////////////
	// mainBlock
	
	// mainBlock -> { statement* }
	private ParseNode parseMainBlock() {
		if(!startsMainBlock(nowReading)) {
			return syntaxErrorNode("mainBlock");
		}
		ParseNode mainBlock = new MainBlockNode(nowReading);
		expect(Punctuator.OPEN_BRACE);
		
		mainBlock = parseStatements(mainBlock);
		
		expect(Punctuator.CLOSE_BRACE);
		return mainBlock;
	}
	private boolean startsMainBlock(Token token) {
		return token.isLextant(Punctuator.OPEN_BRACE);
	}
	
	private ParseNode parseStatements(ParseNode node) {
		while(startsStatement(nowReading)) {
			ParseNode statement = parseStatement();
			node.appendChild(statement);
		}
		return node;
	}
	
	
	///////////////////////////////////////////////////////////
	// statements
	
	private ParseNode parseStatement() {
		if (!startsStatement(nowReading)) 				{return syntaxErrorNode("statement");}
		
		if (startsStaticDeclaration(nowReading)) 		{return parseStaticDeclaration();}
		else if (startsDeclaration(nowReading)) 		{return parseDeclaration();}
		else if (startsLetStatement(nowReading)) 		{return parseLetStatement();}
		else if (startsPrintStatement(nowReading))		{return parsePrintStatement();}
		else if (startsIfStatement(nowReading)) 		{return parseIfStatement();}
		else if (startsWhileStatement(nowReading)) 		{return parseWhileStatement();}
		else if (startsForStatement(nowReading)) 		{return parseForStatement();}
		else if (startsBreakStatement(nowReading)) 		{return parseBreakStatement();}
		else if (startsContinueStatement(nowReading)) 	{return parseContinueStatement();}
		else if (startsReturnStatement(nowReading))		{return parseReturnStatement();}
		else if (startsCallStatement(nowReading))		{return parseCallStatement();}
		else if (startsDiagnosticStatement(nowReading))	{return parseDiagnosticStatement();}
		else if (startsBlock(nowReading)) 				{return parseBlock("block");}
		
		assert false : "bad token " + nowReading + " in parseStatement()";
		return null;
	}
	private boolean startsStatement(Token token) {
		return startsStaticDeclaration(token) 	||
			   startsDeclaration(token) 		||
			   startsLetStatement(token) 		||
			   startsPrintStatement(token)		||
			   startsIfStatement(token) 		||
			   startsWhileStatement(token) 		||
			   startsForStatement(token) 		||
			   startsBreakStatement(token) 		||
			   startsContinueStatement(token) 	||
			   startsReturnStatement(token)		||
			   startsCallStatement(token)		||
			   startsDiagnosticStatement(token) ||
			   startsBlock(token);
	}
	
	private ParseNode parseStaticDeclaration() {
		if(!startsStaticDeclaration(nowReading)) {
			return syntaxErrorNode("static declaration");
		}
		Token staticToken = nowReading;
		readToken();
		
		ParseNode declarationNode = parseDeclaration();
		ParseNode staticDeclaration = new StaticDeclarationNode(staticToken);
		
		staticDeclaration.appendChild(declarationNode);
		return staticDeclaration;
	}
	
	private boolean startsStaticDeclaration(Token token) {
		return token.isLextant(Keyword.STATIC);
	}
	
	// declaration -> imm | var, identifier := expression ;
	private ParseNode parseDeclaration() {
		if(!startsDeclaration(nowReading)) {
			return syntaxErrorNode("declaration");
		}
		Token declarationToken = nowReading;
		readToken();
		
		ParseNode identifier = parseIdentifier();
		expect(Punctuator.ASSIGN);
		ParseNode initializer = parseExpression();
		expect(Punctuator.TERMINATOR);
		
		return DeclarationNode.withChildren(declarationToken, identifier, initializer);
	}
	private boolean startsDeclaration(Token token) {
		return token.isLextant(Keyword.IMMUTABLE, Keyword.MUTABLE);
	}
	
	// re-assignment -> let, identifier := expression ;
	private ParseNode parseLetStatement() {
		if(!startsLetStatement(nowReading)) {
			return syntaxErrorNode("let statement");
		}
		Token reAssignmentToken = nowReading;
		readToken();
		
		ParseNode target = parseTarget();

		expect(Punctuator.ASSIGN);
		ParseNode initializer = parseExpression();
		expect(Punctuator.TERMINATOR);
		
		return LetStatementNode.withChildren(reAssignmentToken, target, initializer);
	}
	private boolean startsLetStatement(Token token) {
		return token.isLextant(Keyword.RE_ASSIGN);
	}
	private ParseNode parseTarget() {
		ParseNode target;
		if(startsIdentifier(nowReading)) {
			target = parseIdentifier();
		}
		
		// broken method, allows all arrays, not necessarily array index expression
		// a semantic error is thrown instead of a syntax error
		else if (nowReading.isLextant(Punctuator.OPEN_PARENTHESES)) {
			readToken();
			target = parseTarget();
			
			expect(Punctuator.CLOSE_PARENTHESES);
		}
		else if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
			target = populatedArray(nowReading);
		}
		else if (nowReading.isLextant(Keyword.FRESH)) {
			Token freshToken = nowReading;
			
			if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
				return freshArray(freshToken);
			}
			else if (startsIdentifier(nowReading)) {
				return freshTuple(freshToken);
			}
			target = freshArray(nowReading);
		}
		else if (nowReading.isLextant(Keyword.COPY)) {
			target = copyArrayOrTuple();
		}
		else {
			target = syntaxErrorNode("target");
			return target;
		}
		
		// returns array operator node
		// if array indexing expression is the target
		if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
			return parseIndexPart(target);
		}
		else if (nowReading.isLextant(Punctuator.DOT)) {
			return parseSubelementAccess(target);
		}
		return target;
	}
	
	// printStmt -> PRINT printExpressionList ;
	private ParseNode parsePrintStatement() {
		if(!startsPrintStatement(nowReading)) {
			return syntaxErrorNode("print statement");
		}
		PrintStatementNode result = new PrintStatementNode(nowReading);
		
		readToken();
		result = parsePrintExpressionList(result);
		
		expect(Punctuator.TERMINATOR);
		return result;
	}
	private boolean startsPrintStatement(Token token) {
		return token.isLextant(Keyword.PRINT);
	}

	// This adds the printExpressions it parses to the children of the given parent
	// printExpressionList -> printExpression*   (note that this is nullable)

	private PrintStatementNode parsePrintExpressionList(PrintStatementNode parent) {
		while(startsPrintExpression(nowReading)) {
			parsePrintExpression(parent);
		}
		return parent;
	}
	
	// This adds the printExpression it parses to the children of the given parent
	// printExpression -> expr? ,? nl? 
	
	private void parsePrintExpression(PrintStatementNode parent) {
		if(startsExpression(nowReading)) {
			ParseNode child = parseExpression();
			parent.appendChild(child);
		}
		else if(nowReading.isLextant(Punctuator.SEPARATOR)) {
			readToken();
			ParseNode child = new SeparatorNode(previouslyRead);
			parent.appendChild(child);
		}
		else if(nowReading.isLextant(Keyword.NEWLINE)) {
			readToken();
			ParseNode child = new NewlineNode(previouslyRead);
			parent.appendChild(child);
		}
	}
	private boolean startsPrintExpression(Token token) {
		return startsExpression(token) || token.isLextant(Punctuator.SEPARATOR, Keyword.NEWLINE) ;
	}
	
	// ifStmt -> IF (Expression) block (ELSE block)? ;
	private ParseNode parseIfStatement() {
		if(!startsIfStatement(nowReading)) {
			return syntaxErrorNode("if statement");
		}
		IfStatementNode result = new IfStatementNode(nowReading);
		readToken();
		
		expect(Punctuator.OPEN_PARENTHESES);
		ParseNode child = parseExpression();
		result.appendChild(child);
		expect(Punctuator.CLOSE_PARENTHESES);
		
		ParseNode ifBlockNode = parseBlock("if block");
		result.appendChild(ifBlockNode);
		
		if (nowReading.isLextant(Keyword.ELSE)) {
			readToken();
			
			ParseNode elseBlockNode = parseBlock("else block");
			result.appendChild(elseBlockNode);
		}
		return result;
	}
	private boolean startsIfStatement(Token token) {
		return token.isLextant(Keyword.IF);
	}
	
	// whileStmt -> WHILE (Expression) block ;
	private ParseNode parseWhileStatement() {
		if(!startsWhileStatement(nowReading)) {
			return syntaxErrorNode("while statement");
		}
		WhileStatementNode result = new WhileStatementNode(nowReading);
		readToken();

		expect(Punctuator.OPEN_PARENTHESES);
		ParseNode child = parseExpression();
		result.appendChild(child);
		expect(Punctuator.CLOSE_PARENTHESES);
		
		ParseNode ifBlockNode = parseBlock("while block");
		result.appendChild(ifBlockNode);
		
		return result;
	}
	private boolean startsWhileStatement(Token token) {
		return token.isLextant(Keyword.WHILE);
	}
	
	// forStmt -> FOR (forControlPhrase) block ;
	private ParseNode parseForStatement() {
		if(!startsForStatement(nowReading)) {
			return syntaxErrorNode("for statement");
		}
		
		ForStatementNode result = new ForStatementNode(nowReading);
		readToken();
		
		expect(Punctuator.OPEN_PARENTHESES);
		
		if (nowReading.isLextant(Keyword.INDEX)) {
			result = idOfArrayType(result);
		}
		else if (nowReading.isLextant(Keyword.ELEMENT)) {
			result = idOfArrayType(result);
		}
		else if (nowReading.isLextant(Keyword.PAIR)) {
			readToken();
			ParseNode conditionalNode = new ForConditionNode(previouslyRead);
			
			ParseNode id1 = parseIdentifier();
			expect(Punctuator.SEPARATOR);
			ParseNode id2 = parseIdentifier();
			expect(Keyword.OF);
			
			ParseNode exNode = parseExpression();
			
			conditionalNode.appendChild(id1);
			conditionalNode.appendChild(id2);
			conditionalNode.appendChild(exNode);
			result.appendChild(conditionalNode);
		}
		else if (nowReading.isLextant(Keyword.EVER)) {
			readToken();
			
			ParseNode conditionalNode = new ForConditionNode(previouslyRead);
			result.appendChild(conditionalNode);
		}
		else if (nowReading.isLextant(Keyword.COUNT)) {
			readToken();
			
			ParseNode conditionalNode = new ForConditionNode(previouslyRead);
			
			ParseNode expr1 = parseExpression4();
			expect(Punctuator.LESS, Punctuator.LESS_OR_EQUAL);
			ParseNode lessOp1 = new BinaryOperatorNode(previouslyRead);
			ParseNode expr2 = parseExpression4();
			
			lessOp1.appendChild(expr1);
			lessOp1.appendChild(expr2);
			
			conditionalNode.appendChild(lessOp1);
			
			if (nowReading.isLextant(Punctuator.LESS, Punctuator.LESS_OR_EQUAL)) {
				readToken();
				ParseNode lessOp2 = new BinaryOperatorNode(previouslyRead);
				ParseNode expr3 = parseExpression4();
				
				lessOp2.appendChild(expr2);
				lessOp2.appendChild(expr3);
				
				conditionalNode.appendChild(lessOp2);
				
				if (!(expr2 instanceof IdentifierNode)) {
					return syntaxErrorNode("identifier in count op");
				}
			}
			else {
				if (!(expr1 instanceof IdentifierNode)) {
					return syntaxErrorNode("identifier in count op");
				}
			}
			
			result.appendChild(conditionalNode);
		}
		else {
			syntaxErrorNode("for operator");
		}
		
		expect(Punctuator.CLOSE_PARENTHESES);
		
		ParseNode forBlockNode = parseBlock("for block");
		result.appendChild(forBlockNode);
		
		return result;
	}
	private boolean startsForStatement(Token token) {
		return token.isLextant(Keyword.FOR);
	}
	
	private ForStatementNode idOfArrayType(ForStatementNode parent) {
		readToken();
		ParseNode conditionalNode = new ForConditionNode(previouslyRead);
		
		ParseNode idNode = parseIdentifier();
		
		expect(Keyword.OF);
		
		ParseNode exNode = parseExpression();
		
		conditionalNode.appendChild(idNode);
		conditionalNode.appendChild(exNode);
		parent.appendChild(conditionalNode);
		
		return parent;
	}
	
	private ParseNode parseBreakStatement() {
		readToken();
		ParseNode breakNode = new BreakStatementNode(previouslyRead);
		
		expect(Punctuator.TERMINATOR);
		return breakNode;
	}
	private boolean startsBreakStatement(Token token) {
		return token.isLextant(Keyword.BREAK);
	}
	
	private ParseNode parseContinueStatement() {
		readToken();
		ParseNode continueNode = new ContinueStatementNode(previouslyRead);
		
		expect(Punctuator.TERMINATOR);
		return continueNode;
	}
	private boolean startsContinueStatement(Token token) {
		return token.isLextant(Keyword.CONTINUE);
	}
	
	private ParseNode parseReturnStatement() {
		readToken();
		ParseNode returnNode = new ReturnStatementNode(previouslyRead);
		
		expect(Punctuator.TERMINATOR);
		return returnNode;
	}
	private boolean startsReturnStatement(Token token) {
		return token.isLextant(Keyword.RETURN);
	}
	
	private ParseNode parseCallStatement() {
		Token callToken = nowReading;
		readToken();
		
		ParseNode fnInvocation = parseExpression9();
		ParseNode callNode = CallStatementNode.withChild(callToken, fnInvocation);
		
		expect(Punctuator.TERMINATOR);
		return callNode;
	}
	private boolean startsCallStatement(Token token) {
		return token.isLextant(Keyword.CALL);
	}
	
	private ParseNode parseDiagnosticStatement() {
		Token diagToken = nowReading;
		readToken();
		
		ParseNode diag = new DiagStatementNode(diagToken);
		
		ParseNode expr1 = parseExpression();
		diag.appendChild(expr1);
		
		if (nowReading.isLextant(Punctuator.DIAG_ARG)) {
			readToken();
			
			ParseNode expr2 = parseExpression();
			diag.appendChild(expr2);
			
			diag = parseExpressionList(diag);
		}
		
		expect(Punctuator.TERMINATOR);
		return diag;
	}
	private boolean startsDiagnosticStatement(Token token) {
		return token.isLextant(Keyword.DIAGNOSTIC);
	}

	// Block -> { statement* }
	private ParseNode parseBlock(String blockName) {
		if (!startsBlock(nowReading)) {
			return syntaxErrorNode(blockName);
		}
		ParseNode block = new BlockNode(nowReading);
		expect(Punctuator.OPEN_BRACE);

		block = parseStatements(block);
		
		expect(Punctuator.CLOSE_BRACE);
		
		return block;
	}

	private boolean startsBlock(Token token) {
		return token.isLextant(Punctuator.OPEN_BRACE);
	}
	
	private ParseNode parseFunctionBlock() {
		if (!startsFunctionBlock(nowReading)) {
			return syntaxErrorNode("function block");
		}
		ParseNode fBlock = new FunctionBlockNode(nowReading);
		expect(Punctuator.OPEN_BRACE);

		fBlock = parseStatements(fBlock);
		
		expect(Punctuator.CLOSE_BRACE);
		
		return fBlock;
	}

	private boolean startsFunctionBlock(Token token) {
		return token.isLextant(Punctuator.OPEN_BRACE);
	}
	///////////////////////////////////////////////////////////
	// expressions
	
	// expr  -> expr1
	private ParseNode parseExpression() {		
		if(!startsExpression(nowReading)) {
			return syntaxErrorNode("expression");
		}
		return parseExpression1();
	}
	private boolean startsExpression(Token token) {
		return startsExpression1(token);
	}
	
	// expr1 -> expr2 [OR expr2]* (left-assoc)
	private ParseNode parseExpression1() {
		if(!startsExpression1(nowReading)) {
			return syntaxErrorNode("expression<1>");
		}
		
		ParseNode left = parseExpression2();
		while(nowReading.isLextant(Punctuator.OR)) {
			Token boolOPToken = nowReading;
			readToken();
			ParseNode right = parseExpression2();
			
			left = BinaryOperatorNode.withChildren(boolOPToken, left, right);
		}
		return left;
	}
	private boolean startsExpression1(Token token) {
		return startsExpression2(token);
	}
	
	// expr2 -> expr3 [AND expr3]* (left-assoc)
	private ParseNode parseExpression2() {
		if(!startsExpression2(nowReading)) {
			return syntaxErrorNode("expression<2>");
		}
		
		ParseNode left = parseExpression3();
		while(nowReading.isLextant(Punctuator.AND)) {
			Token boolOPToken = nowReading;
			readToken();
			ParseNode right = parseExpression3();
			
			left = BinaryOperatorNode.withChildren(boolOPToken, left, right);
		}
		return left;
	}
	private boolean startsExpression2(Token token) {
		return startsExpression3(token);
	}

	// expr3 -> expr4 [compare expr4]* (left-assoc)
	private ParseNode parseExpression3() {
		if(!startsExpression3(nowReading)) {
			return syntaxErrorNode("expression<3>");
		}
		
		ParseNode left = parseExpression4();
		while(nowReading.isLextant(Punctuator.GREATER, Punctuator.GREATER_OR_EQUAL,
								Punctuator.LESS, Punctuator.LESS_OR_EQUAL,
								Punctuator.EQUAL, Punctuator.NOT_EQUAL)) {
			Token compareToken = nowReading;
			readToken();
			ParseNode right = parseExpression4();
			
			left = BinaryOperatorNode.withChildren(compareToken, left, right);
		}
		return left;
	}
	private boolean startsExpression3(Token token) {
		return startsExpression4(token);
	}

	// expr4 -> expr5 [plus or minus expr5]*  (left-assoc)
	private ParseNode parseExpression4() {
		if(!startsExpression4(nowReading)) {
			return syntaxErrorNode("expression<4>");
		}
		
		ParseNode left = parseExpression5();
		while (nowReading.isLextant(Punctuator.ADD, Punctuator.SUBTRACT)) {
			Token addOrSubtractToken = nowReading;
			readToken();
			ParseNode right = parseExpression5();
			
			left = BinaryOperatorNode.withChildren(addOrSubtractToken, left, right);
		}
		return left;
	}
	private boolean startsExpression4(Token token) {
		return startsExpression5(token);
	}

	// expr5 -> expr6 [multiply or divide expr6]*  (left-assoc)
	private ParseNode parseExpression5() {
		if(!startsExpression5(nowReading)) {
			return syntaxErrorNode("expression<5>");
		}
		
		ParseNode left = parseExpression6();
		while(nowReading.isLextant(Punctuator.MULTIPLY, Punctuator.DIVIDE)) {
			Token multiplyOrDivideToken = nowReading;
			readToken();
			ParseNode right = parseExpression6();
			
			left = BinaryOperatorNode.withChildren(multiplyOrDivideToken, left, right);
		}
		return left;
	}
	private boolean startsExpression5(Token token) {
		return startsExpression6(token);
	}
	
	// expr6 -> expr7 [cast expr7]*  (left-assoc)
	private ParseNode parseExpression6() {
		if(!startsExpression6(nowReading)) {
			return syntaxErrorNode("expression<6>");
		}
		
		ParseNode left = parseExpression7();
		while (nowReading.isLextant(Punctuator.CAST)) {
			Token castToken = nowReading;
			readToken();
			ParseNode right = parsePrimitiveType();
			
			left = BinaryOperatorNode.withChildren(castToken, left, right);
		}
		return left;
	}
	private boolean startsExpression6(Token token) {
		return startsExpression7(token);
	}
	
	// expr7 -> expr8 [NOT of COPY expr8]*  (right-assoc)
	private ParseNode parseExpression7() {
		if(!startsExpression7(nowReading)) {
			return syntaxErrorNode("expression<7>");
		}
		
		// cannot have left recursion because ! can be the first token
		if (nowReading.isLextant(Punctuator.NOT)) {
			Token notToken = nowReading;
			readToken();
			
			// important to go to 7.
			// Only either another ! or parenthesize can follow
			ParseNode right = parseExpression7();
			
			return UnaryOperatorNode.withChild(notToken, right);
		}
		
		// cannot have left recursion because COPY can be the first token
		else if (nowReading.isLextant(Keyword.COPY)) {
			return copyArrayOrTuple();
		}
		
		else if (nowReading.isLextant(Keyword.NULL)) {
			return parseNull();
		}
		
		else if (nowReading.isLextant(Punctuator.ADDRESS)) {
			Token token = nowReading;
			readToken();
			
			ParseNode right = parseTarget();
			
			return UnaryOperatorNode.withChild(token, right);
		}
		
		else if (nowReading.isLextant(Punctuator.REFCOUNT)) {
			Token token = nowReading;
			readToken();
			
			ParseNode right = parseExpression();
			
			return UnaryOperatorNode.withChild(token, right);
		}
		
		else if (nowReading.isLextant(Punctuator.RECORD)) {
			Token token = nowReading;
			readToken();
			
			ParseNode right = parseExpression();
			
			return UnaryOperatorNode.withChild(token, right);
		}
		
		return parseExpression8();
	}
	
	private ParseNode parseNull() {
		if (!startsNull(nowReading)) {
			return syntaxErrorNode("null");
		}
		Token token = nowReading;
		readToken();
		
		ParseNode typeNode = parseAnyType();
		
		return NullNode.withChild(token, typeNode);
	}
	private boolean startsNull(Token token) {
		return token.isLextant(Keyword.NULL);
	}
	
	private ParseNode copyArrayOrTuple() {
		Token copyToken = nowReading;
		readToken();
		
		// important to go to 7.
		// Only either another ! or parenthesize can follow
		ParseNode right = parseExpression7();
		
		return CopyOperatorNode.withChild(copyToken, right);
	}
	
	private boolean startsExpression7(Token token) {
		if (token.isLextant(Punctuator.NOT, Keyword.COPY, Keyword.NULL, 
							Punctuator.ADDRESS, Punctuator.REFCOUNT, Punctuator.RECORD))
			return true;
		return startsExpression8(token);
	}
	
	// expr8 -> expr9 [array index or . of expr9]*  (left-assoc)
	private ParseNode parseExpression8() {
		if(!startsExpression8(nowReading)) {
			return syntaxErrorNode("expression<8>");
		}
		
		ParseNode left = parseExpression9();
		if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
			return parseIndexPart(left);
		}
		else if (nowReading.isLextant(Punctuator.DOT)) {
			return parseSubelementAccess(left);
		}
		return left;
	}
	private ParseNode parseIndexPart(ParseNode node) {
		while (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
			Token arrayOperatorToken = nowReading;
			readToken();
			
			ParseNode right = parseExpression();  
			expect(Punctuator.CLOSE_BRACKET);

			node = ArrayOperatorNode.withChildren(arrayOperatorToken, 
												  ArrayOperatorNode.INDEX_OPERATION, node, right);
		}
		return node;
	}
	private ParseNode parseSubelementAccess(ParseNode node) {
		while (nowReading.isLextant(Punctuator.DOT)) {
			Token dotToken = nowReading;
			readToken();
			
			ParseNode right = parseIdentifier();  

			node = SubelementAccessNode.withChildren(dotToken, node, right);
		}
		return node;
	}
	private boolean startsExpression8(Token token) {
		if (token.isLextant(Punctuator.OPEN_BRACKET))
			return true;
		return startsExpression9(token);
	}
	
	// expr9 -> expr10 [parenthesize or returnLength or
	//				   populated or empty array creation expr9]
	private ParseNode parseExpression9() {
		if(!startsExpression9(nowReading)) {
			return syntaxErrorNode("expression<9>");
		}
		
		if (startsIdentifier(nowReading)) {
			Token idToken = nowReading;
			ParseNode idNode = parseIdentifier();
			
			if (nowReading.isLextant(Punctuator.OPEN_PARENTHESES)) {
				ParseNode exprList = new ExpressionListNode(nowReading);
				readToken();
				
				if (!nowReading.isLextant(Punctuator.CLOSE_PARENTHESES)) {
					ParseNode expr = parseExpression();
					exprList.appendChild(expr);
					exprList = parseExpressionList(exprList);
				}
				
				expect(Punctuator.CLOSE_PARENTHESES);
				
				return FunctionInvocationNode.withChildren(idToken, idNode, exprList);		
			}
			else {
				return idNode;
			}
		}
		
		// expr or exprList
		if (nowReading.isLextant(Punctuator.OPEN_PARENTHESES)) {
			readToken();
			
			ParseNode expr = parseExpression();

			expect(Punctuator.CLOSE_PARENTHESES);
			return expr;
		}
		
		// populated array operation
		else if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
			Token token = nowReading;
			readToken();
			
			if (nowReading.isLextant(Punctuator.ADD)) {
				return arrayConcatenation(token);
			}
			else {
				return populatedArray(token);
			}
		}
		
		// fresh operation
		else if (nowReading.isLextant(Keyword.FRESH)) {
			Token operator = nowReading;
			readToken();
			
			if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
				return freshArray(operator);
			}
			else if (startsIdentifier(nowReading)) {
				return freshTuple(operator);
			}
			else {
				return syntaxErrorNode("open bracket or identifier");
			}
		}
		
		// length operation
		else if (nowReading.isLextant(Punctuator.LENGTH)) {		 // (right-assoc)
			Token lengthToken = nowReading;
			readToken();
			ParseNode right = parseExpression();
			
			expect(Punctuator.LENGTH);
			return UnaryOperatorNode.withChild(lengthToken, right);
		}
		else {
			return parseExpression10();
		}
	}
	private ParseNode arrayConcatenation(Token token) {
		readToken();
		ParseNode parent = new ArrayOperatorNode(token, ArrayOperatorNode.CONCATENATION_OPERATION);
		
		// first expr
		ParseNode expr1 = parseExpression7();
		parent.appendChild(expr1);
		
		expect(Punctuator.SEPARATOR);
		
		// second expr
		ParseNode expr2 = parseExpression7();
		parent.appendChild(expr2);
		
		// (, expr)*
		parent = parseArrayConcatenationExpressionList(parent);
		
		expect(Punctuator.ADD);
		expect(Punctuator.CLOSE_BRACKET);
		
		return parent;
		
	}
	private ParseNode populatedArray(Token token) {
		ParseNode parent = new ArrayOperatorNode(token, ArrayOperatorNode.POPULATED_CREATION);
		
		// first expr
		ParseNode expr = parseExpression();
		parent.appendChild(expr);
		
		// (, expr)*
		parent = parseExpressionList(parent);
	
		expect(Punctuator.CLOSE_BRACKET);
		
		return parent;
	}
	private ParseNode parseArrayConcatenationExpressionList(ParseNode node) {
		while(nowReading.isLextant(Punctuator.SEPARATOR)) {
			readToken();
			ParseNode expr = parseExpression7();
			node.appendChild(expr);
		}
		return node;
	}
	
	private ParseNode parseExpressionList(ParseNode node) {
		while(nowReading.isLextant(Punctuator.SEPARATOR)) {
			readToken();
			ParseNode expr = parseExpression();
			node.appendChild(expr);
		}
		return node;
	}
	
	private ParseNode freshArray(Token operator) {
		expect(Punctuator.OPEN_BRACKET);
		ParseNode left = parseArrayType();
		expect(Punctuator.CLOSE_BRACKET);
		
		expect(Punctuator.OPEN_PARENTHESES);
		ParseNode right = parseExpression();
		
		expect(Punctuator.CLOSE_PARENTHESES);
		return FreshOperatorNode.withChildren(operator, FreshOperatorNode.ARRAY_FRESH_CREATION, left, right);
	}
	private ParseNode freshTuple(Token operator) {
		ParseNode parent = new FreshOperatorNode(operator, FreshOperatorNode.TUPLE_FRESH_CREATION);
		ParseNode idNode = parseIdentifier();
		parent.appendChild(idNode);
		
		ParseNode exprList = new ExpressionListNode(nowReading);
		
		expect(Punctuator.OPEN_PARENTHESES);
		
		if (!nowReading.isLextant(Punctuator.CLOSE_PARENTHESES)) {
			ParseNode expr = parseExpression();
			exprList.appendChild(expr);
			exprList = parseExpressionList(exprList);
		}

		expect(Punctuator.CLOSE_PARENTHESES);
		
		parent.appendChild(exprList);
		return parent;
	}
	
	private boolean startsExpression9(Token token) {
		if (token.isLextant(Punctuator.OPEN_PARENTHESES, Punctuator.OPEN_BRACKET,
							Keyword.FRESH, Punctuator.LENGTH))
			return true;
		return startsExpression10(token);
	}
	
	// expr9 -> literal
	private ParseNode parseExpression10() {
		if(!startsExpression10(nowReading)) {
			return syntaxErrorNode("expression<9>");
		}
		return parseLiteral();
	}
	private boolean startsExpression10(Token token) {
		return startsLiteral(token);
	}
	
	// literal -> integerConst | floatConst | booleanConst | charConst | stringConst | identifier
	private ParseNode parseLiteral() {
		if(!startsLiteral(nowReading)) {
			return syntaxErrorNode("literal");
		}
		if(startsIntNumber(nowReading)) {
			return parseIntNumber();
		}
		else if(startsFloatNumber(nowReading)) {
			return parseFloatNumber();
		}
		else if(startsChar(nowReading)) {
			return parseChar();
		}
		else if(startsString(nowReading)) {
			return parseString();
		}
		else if(startsIdentifier(nowReading)) {
			return parseIdentifier();
		}
		else if(startsBooleanConstant(nowReading)) {
			return parseBooleanConstant();
		}
		assert false : "bad token " + nowReading + " in parseLiteral()";
		return null;
	}
	private boolean startsLiteral(Token token) {
		return startsIntNumber(token) || startsFloatNumber(token) || startsChar(token) || startsString(token) ||
			   startsIdentifier(token) || startsBooleanConstant(token);
	}

	// int (terminal)
	private ParseNode parseIntNumber() {
		if(!startsIntNumber(nowReading)) {
			return syntaxErrorNode("integer constant");
		}
		readToken();
		return new IntegerConstantNode(previouslyRead);
	}
	private boolean startsIntNumber(Token token) {
		return token instanceof IntegerToken;
	}
	
	// float (terminal)
	private ParseNode parseFloatNumber() {
		if(!startsFloatNumber(nowReading)) {
			return syntaxErrorNode("float constant");
		}
		readToken();
		return new FloatConstantNode(previouslyRead);
	}
	private boolean startsFloatNumber(Token token) {
		return token instanceof FloatToken;
	}
	
	// char (terminal)
	private ParseNode parseChar() {
		if(!startsChar(nowReading)) {
			return syntaxErrorNode("char constant");
		}
		readToken();
		return new CharConstantNode(previouslyRead);
	}
	private boolean startsChar(Token token) {
		return token instanceof CharToken;
	}
	
	// String (terminal)
	private ParseNode parseString() {
		if(!startsString(nowReading)) {
			return syntaxErrorNode("String constant");
		}
		readToken();
		return new StringConstantNode(previouslyRead);
	}
	private boolean startsString(Token token) {
		return token instanceof StringToken;
	}	

	// identifier (terminal)
	private ParseNode parseIdentifier() {
		if(!startsIdentifier(nowReading)) {
			return syntaxErrorNode("identifier");
		}
		readToken();
		return new IdentifierNode(previouslyRead);
	}
	private boolean startsIdentifier(Token token) {
		return token instanceof IdentifierToken;
	}

	// boolean constant (terminal)
	private ParseNode parseBooleanConstant() {
		if(!startsBooleanConstant(nowReading)) {
			return syntaxErrorNode("boolean constant");
		}
		readToken();
		return new BooleanConstantNode(previouslyRead);
	}
	private boolean startsBooleanConstant(Token token) {
		return token.isLextant(Keyword.TRUE, Keyword.FALSE);
	}
	
	private ParseNode parsePrimitiveType() {
		if (nowReading instanceof PrimitiveTypeToken) {
			readToken();
			return new TypeNode(previouslyRead);
		}
		else {
			return syntaxErrorNode("invalid type");
		}
	}
	private ParseNode parseArrayType() {	
		if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
			Token arrayOperatorToken = nowReading;
			
			readToken();
			ParseNode right = parseArrayType();
			
			expect(Punctuator.CLOSE_BRACKET);
			return TypeNode.withChild(arrayOperatorToken, right);
		}
		else if (startsIdentifier(nowReading)) {
			return parseParameterType();
		}
		else {
			return parsePrimitiveType();
		}
	}
	private ParseNode parseParameterType() {
		// this better be a tuple type
		if (startsIdentifier(nowReading)) {
			return parseIdentifier();
		}
		else if (startsNull(nowReading)) {
			return parseNull();
		}
		else {
			return parseArrayType();
		}
	}
	private ParseNode parseAnyType() {
		if (startsIdentifier(nowReading)) {
			return parseIdentifier();
		}
		else {
			return parseArrayType();
		}
	}
	
	
	private void readToken() {
		previouslyRead = nowReading;
		nowReading = scanner.next();
	}	
	
	// if the current token is one of the given lextants, read the next token.
	// otherwise, give a syntax error and read next token (to avoid endless looping).
	private void expect(Lextant ...lextants ) {
		if(!nowReading.isLextant(lextants)) {
			syntaxError(nowReading, "expecting " + Arrays.toString(lextants));
		}
		readToken();
	}	
	private ErrorNode syntaxErrorNode(String expectedSymbol) {
		syntaxError(nowReading, "expecting " + expectedSymbol);
		ErrorNode errorNode = new ErrorNode(nowReading);
		readToken();
		return errorNode;
	}
	private void syntaxError(Token token, String errorDescription) {
		String message = "" + token.getLocation() + " " + errorDescription;
		error(message);
	}
	private void error(String message) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.Parser");
		log.severe("syntax error: " + message);
	}	
}

