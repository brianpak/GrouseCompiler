package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Keyword;
import tokens.Token;

public class LetStatementNode extends ParseNode {
	public final static String RE_ASSIGNMENT = "re_assignment";
	
	public LetStatementNode(Token token) {
		super(token);
		assert(token.isLextant(Keyword.RE_ASSIGN));
	}

	public LetStatementNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static LetStatementNode withChildren(Token token, ParseNode declaredName, ParseNode initializer) {
		LetStatementNode node = new LetStatementNode(token);
		node.appendChild(declaredName);
		node.appendChild(initializer);
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

