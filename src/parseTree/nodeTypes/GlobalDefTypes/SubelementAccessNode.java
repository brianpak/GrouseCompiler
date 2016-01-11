package parseTree.nodeTypes.GlobalDefTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Punctuator;
import tokens.Token;

public class SubelementAccessNode extends ParseNode {

	public SubelementAccessNode(Token token) {
		super(token);
		assert(token.isLextant(Punctuator.DOT));
	}

	public SubelementAccessNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static SubelementAccessNode withChildren(Token token, ParseNode arg, ParseNode subElem) {
		SubelementAccessNode node = new SubelementAccessNode(token);
		node.appendChild(arg);
		node.appendChild(subElem);
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
