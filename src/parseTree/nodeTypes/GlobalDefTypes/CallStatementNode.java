package parseTree.nodeTypes.GlobalDefTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class CallStatementNode extends ParseNode {

	public CallStatementNode(Token token) {
		super(token);
	}

	public CallStatementNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static CallStatementNode withChild(Token token, ParseNode child) {
		CallStatementNode node = new CallStatementNode(token);
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
