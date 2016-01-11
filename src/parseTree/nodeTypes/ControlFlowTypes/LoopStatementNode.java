package parseTree.nodeTypes.ControlFlowTypes;

import parseTree.ParseNode;
import tokens.Token;

public class LoopStatementNode extends ParseNode {
	private String loopStart;
	private String loopEnd;
	
	public LoopStatementNode(Token token) {
		super(token);
	}
	
	public LoopStatementNode(ParseNode node) {
		super(node);
	}
	
	////////////////////////////////////////////////////////////
	// Signature methods for run-time
	
	public void setLoopStart(String loopStart) {
		this.loopStart = loopStart;
	}
	public void setLoopEnd(String loopEnd) {
		this.loopEnd = loopEnd;
	}
	public String getLoopStart() {
		return loopStart;
	}
	public String getLoopEnd() {
		return loopEnd;
	}
}
