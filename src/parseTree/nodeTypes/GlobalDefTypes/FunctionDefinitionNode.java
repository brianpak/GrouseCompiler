package parseTree.nodeTypes.GlobalDefTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Keyword;
import tokens.Token;

public class FunctionDefinitionNode extends ParseNode {
	
	public FunctionDefinitionNode(Token token) {
		super(token);
		assert(token.isLextant(Keyword.FUNC));
	}

	public FunctionDefinitionNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	
	////////////////////////////////////////////////////////////
	// convenience factory

	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}

