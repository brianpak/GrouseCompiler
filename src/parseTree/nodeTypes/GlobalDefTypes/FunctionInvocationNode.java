package parseTree.nodeTypes.GlobalDefTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class FunctionInvocationNode extends ParseNode {
	public final static String FUNCTION_INVOCATION = "function_invocation";

	public FunctionInvocationNode(Token token) {
		super(token);
	}

	public FunctionInvocationNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static FunctionInvocationNode withChildren(Token token, ParseNode left, ParseNode right) {
		FunctionInvocationNode node = new FunctionInvocationNode(token);
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
