package parseTree.nodeTypes.GlobalDefTypes;

import lexicalAnalyzer.Punctuator;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.IdentifierNode;
import tokens.Token;

public class ParameterListNode extends ParseNode {
	
	private boolean isReturnParameterList = false;
	private boolean containsTupleParameter = false;
	
	public ParameterListNode(Token token) {
		super(token);
		assert token.isLextant(Punctuator.OPEN_PARENTHESES);
	}

	public ParameterListNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes

	public void setContainsTupleParameter() {
		assert this.nChildren() != 0;
		
		for (int i = 0; i < this.nChildren(); i++) {
			ParseNode parameterType = this.child(i).child(0);
			
			// tuple parameter type
			if (parameterType instanceof IdentifierNode) {
				containsTupleParameter = true;
			}
		}
	}
	
	public boolean getContainsTupleParameter() {
		return containsTupleParameter;
	}
	
	public void setIsReturnParameterList() {
		ParseNode parent = this.getParent();
		if (parent instanceof FunctionDefinitionNode) {
			if (parent.child(2) == this) {
				isReturnParameterList = true;
			}
			else 
				isReturnParameterList = false;
		}
		else
			isReturnParameterList = false;
	}
	
	public boolean getIsReturnParameterList() {
		return isReturnParameterList;
	}
	
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

