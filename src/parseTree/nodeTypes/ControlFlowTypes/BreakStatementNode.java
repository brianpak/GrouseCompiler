package parseTree.nodeTypes.ControlFlowTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class BreakStatementNode extends ParseNode {
	
	LoopStatementNode loopNode;
	
	public BreakStatementNode(Token token) {
		super(token);
	}
	public BreakStatementNode(ParseNode node) {
		super(node);
	}

	public boolean insideLoop() {
		for(ParseNode current : pathToRoot()) {
			if(current instanceof LoopStatementNode) {
				loopNode = (LoopStatementNode) current;
				return true;
			}
		}
		return false;
	}
	
	public LoopStatementNode getLoopNode() {
		assert loopNode != null;
		return loopNode;
	}
	
///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}

}
