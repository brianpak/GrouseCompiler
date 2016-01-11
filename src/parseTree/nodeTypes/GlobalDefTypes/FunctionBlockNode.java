package parseTree.nodeTypes.GlobalDefTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class FunctionBlockNode extends ParseNode {
	
	private static int number = 0;
	String subroutine;
	String teardown;

	public FunctionBlockNode(Token token) {
		super(token);
	}

	public FunctionBlockNode(ParseNode node) {
		super(node);
	}

	// //////////////////////////////////////////////////////////
	// no attributes
	
	public void createSubroutine() {
		this.subroutine = "-sub-routine-" + number;
		number++;
	}
	
	public String getSubroutine() {
		return subroutine;
	}

	public void createTeardown() {
		this.teardown = "-tear-down-" + number;
		number++;
	}
	
	public String getTeardown() {
		return teardown;
	}
	// /////////////////////////////////////////////////////////
	// boilerplate for visitors

	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
