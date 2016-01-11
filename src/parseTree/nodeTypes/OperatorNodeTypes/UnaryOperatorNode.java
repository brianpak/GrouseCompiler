package parseTree.nodeTypes.OperatorNodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import tokens.LextantToken;
import tokens.Token;

public class UnaryOperatorNode extends OperatorNode {

	public UnaryOperatorNode(Token token) {
		super(token);
		assert(token.isLextant(Punctuator.NOT, Punctuator.LENGTH, Punctuator.ADDRESS, Punctuator.RECORD, Punctuator.REFCOUNT));
	}

	public UnaryOperatorNode(ParseNode node) {
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
	
	public static UnaryOperatorNode withChild(Token token, ParseNode right) {
		UnaryOperatorNode node = new UnaryOperatorNode(token);
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
