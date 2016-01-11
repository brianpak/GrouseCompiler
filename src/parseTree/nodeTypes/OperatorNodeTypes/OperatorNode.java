package parseTree.nodeTypes.OperatorNodeTypes;

import parseTree.ParseNode;
import semanticAnalyzer.signatures.FunctionSignature;
import tokens.Token;

public class OperatorNode extends ParseNode {
	private FunctionSignature signature;
	
	public OperatorNode(Token token) {
		super(token);
		signature = FunctionSignature.nullInstance();
	}
	
	public OperatorNode(ParseNode node) {
		super(node);
		signature = FunctionSignature.nullInstance();
	}
	
	////////////////////////////////////////////////////////////
	// Signature methods for run-time
	
	public void setSignature(FunctionSignature signature) {
		this.signature = signature;
	}
	public FunctionSignature getSignature() {
		return this.signature;
	}
}
