package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Keyword;
import tokens.Token;

public class StaticDeclarationNode extends ParseNode {
	private String staticVar;
	
	public StaticDeclarationNode(Token token) {
		super(token);
		assert(token.isLextant(Keyword.STATIC));
	}

	public StaticDeclarationNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	public void setStaticVar(String staticVar) {
		this.staticVar = staticVar;
	}
	public String getStaticVar() {
		return staticVar;
	}
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
