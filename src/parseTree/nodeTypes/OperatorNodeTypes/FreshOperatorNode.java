package parseTree.nodeTypes.OperatorNodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.IdentifierNode;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class FreshOperatorNode extends OperatorNode {
	public final static String ARRAY_FRESH_CREATION = "fresh_array";
	public final static String TUPLE_FRESH_CREATION = "fresh_tuple";
	
	private String operation;

	public FreshOperatorNode(Token token, String operation) {
		super(token);
		assert(token.isLextant(Keyword.FRESH));
		
		this.operation = operation;
	}

	public FreshOperatorNode(ParseNode node) {
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

	public String getOperation() {
		return operation;
	}
	
	public IdentifierNode getIdentifierNode() {
		ParseNode child = this.child(0);
		if (child instanceof IdentifierNode)
			return (IdentifierNode) child;
		return null;
	}
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static FreshOperatorNode withChildren(Token token, String operation, ParseNode left, ParseNode right) {
		FreshOperatorNode node = new FreshOperatorNode(token, operation);
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
