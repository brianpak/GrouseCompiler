package parseTree.nodeTypes.GlobalDefTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.Token;

public class ReturnStatementNode extends ParseNode {
	
	FunctionDefinitionNode functionDefinitionNode;
	
	public ReturnStatementNode(Token token) {
		super(token);
	}
	public ReturnStatementNode(ParseNode node) {
		super(node);
	}

	public boolean insideFunctionDefinition() {
		for(ParseNode current : pathToRoot()) {
			if(current instanceof FunctionDefinitionNode) {
				functionDefinitionNode = (FunctionDefinitionNode) current;
				return true;
			}
		}
		return false;
	}
	
	public FunctionDefinitionNode getFunctionDefinitionNode() {
		assert functionDefinitionNode != null;
		return functionDefinitionNode;
	}
	
///////////////////////////////////////////////////////////
// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}

}
