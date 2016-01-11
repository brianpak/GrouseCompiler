package parseTree.nodeTypes.ControlFlowTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ForConditionNode extends ParseNode {

	public ForConditionNode(Token token) {
		super(token);
	}

	public ForConditionNode(ParseNode node) {
		super(node);
	}

	// //////////////////////////////////////////////////////////
	// no attributes

	// /////////////////////////////////////////////////////////
	// boilerplate for visitors

	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
