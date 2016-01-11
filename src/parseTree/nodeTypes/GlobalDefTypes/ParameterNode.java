package parseTree.nodeTypes.GlobalDefTypes;

import lexicalAnalyzer.Punctuator;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ParameterNode extends ParseNode {
	
	public ParameterNode(Token token) {
		super(token);
		assert token.isLextant(Punctuator.OPEN_PARENTHESES);
	}

	public ParameterNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	
	////////////////////////////////////////////////////////////
	// convenience factory
	public static ParameterNode withChildren(Token token, ParseNode left, ParseNode right) {
		ParameterNode node = new ParameterNode(token);
		
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

