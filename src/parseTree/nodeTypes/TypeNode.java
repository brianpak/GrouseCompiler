package parseTree.nodeTypes;

import lexicalAnalyzer.Punctuator;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.PrimitiveTypeToken;
import tokens.Token;

public class TypeNode extends ParseNode {
	
	public TypeNode(Token token) {
		super(token);
		assert(token instanceof PrimitiveTypeToken ||		// primitive type
			   token.isLextant(Punctuator.OPEN_BRACKET));	// array type
	}
	public TypeNode(ParseNode node) {
		super(node);
	}
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static TypeNode withChild(Token token, ParseNode right) {
		TypeNode node = new TypeNode(token);
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