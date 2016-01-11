package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class DiagStatementNode extends ParseNode {

	public DiagStatementNode(Token token) {
		super(token);
	}

	public DiagStatementNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static DiagStatementNode withChild(Token token, ParseNode child) {
		DiagStatementNode node = new DiagStatementNode(token);
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
