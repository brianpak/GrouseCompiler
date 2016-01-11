package parseTree.nodeTypes.OperatorNodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Punctuator;
import tokens.Token;

public class ArrayOperatorNode extends OperatorNode {
	public final static String POPULATED_CREATION = "populated_op";
	public final static String INDEX_OPERATION = "index_op";
	public final static String CONCATENATION_OPERATION = "concatenation_op";

	private String operation;
	
	public ArrayOperatorNode(Token token, String operation) {
		super(token);
		assert(token.isLextant(Punctuator.OPEN_BRACKET));

		this.operation = operation;
	}
	
	public ArrayOperatorNode(ParseNode node) {
		super(node);
	}
	
	////////////////////////////////////////////////////////////
	// attributes

	public String getOperation() {
		return operation;
	}
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static ArrayOperatorNode withChildren(Token token, String operation, ParseNode left, ParseNode right) {
		ArrayOperatorNode node = new ArrayOperatorNode(token, operation);
		
		node.appendChild(left);
		node.appendChild(right);
		return node;
	}
	
	public static ArrayOperatorNode withChild(Token token, String operation, ParseNode right) {
		ArrayOperatorNode node = new ArrayOperatorNode(token, operation);
		
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
