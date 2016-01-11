package parseTree.nodeTypes.OperatorNodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.IdentifierNode;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class CopyOperatorNode extends OperatorNode {
	public final static String ARRAY_COPY_OPERATION = "copy_array";
	public final static String TUPLE_COPY_OPERATION = "copy_tuple";
	
	private String operation;

	public CopyOperatorNode(Token token) {
		super(token);
		assert(token.isLextant(Keyword.COPY));
		
		this.operation = null;
	}

	public CopyOperatorNode(ParseNode node) {
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
		assert operation != null;
		return operation;
	}
	
	public void setOperation(String operation) {
		this.operation = operation;
	}
	
	public IdentifierNode getIdentifierNode() {
		ParseNode child = this.child(0);
		if (child instanceof IdentifierNode)
			return (IdentifierNode) child;
		else if (child instanceof CopyOperatorNode) {
			return ((CopyOperatorNode) child).getIdentifierNode();
		}
		else if (child instanceof FreshOperatorNode) {
			return ((FreshOperatorNode) child).getIdentifierNode();
		}
		else {
			return null;
		}
	}
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static CopyOperatorNode withChild(Token token, ParseNode child) {
		CopyOperatorNode node = new CopyOperatorNode(token);
		node.appendChild(child);
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
