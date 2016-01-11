package parseTree.nodeTypes.OperatorNodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import tokens.LextantToken;
import tokens.Token;

public class BinaryOperatorNode extends OperatorNode {

	public BinaryOperatorNode(Token token) {
		super(token);
		assert(token.isLextant(Punctuator.ADD, Punctuator.SUBTRACT, Punctuator.MULTIPLY, Punctuator.DIVIDE, 
							   
							   Punctuator.GREATER, Punctuator.GREATER_OR_EQUAL, Punctuator.LESS, Punctuator.LESS_OR_EQUAL,
							   Punctuator.EQUAL, Punctuator.NOT_EQUAL, 
							   
							   Punctuator.CAST, 
							   
							   Punctuator.AND, Punctuator.OR,
							   
							   Keyword.FRESH));
	}

	public BinaryOperatorNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	public Lextant getOperator() {
		return lextantToken().getLextant();
	}
	public LextantToken lextantToken() {
		return (LextantToken)token;
	}	
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static BinaryOperatorNode withChildren(Token token, ParseNode left, ParseNode right) {
		BinaryOperatorNode node = new BinaryOperatorNode(token);
		node.appendChild(left);
		node.appendChild(right);
		return node;
	}
	
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
