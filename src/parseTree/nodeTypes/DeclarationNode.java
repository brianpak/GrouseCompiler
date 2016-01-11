package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.ControlFlowTypes.MainBlockNode;
import parseTree.nodeTypes.ControlFlowTypes.ProgramNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionBlockNode;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class DeclarationNode extends ParseNode {

	public DeclarationNode(Token token) {
		super(token);
		assert(token.isLextant(Keyword.IMMUTABLE, Keyword.MUTABLE));
	}

	public DeclarationNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	public Lextant getDeclarationType() {
		return lextantToken().getLextant();
	}
	public LextantToken lextantToken() {
		return (LextantToken)token;
	}	
	
	public boolean isGlobalDeclaration() {
		for(ParseNode current : pathToRoot()) {
			if (current instanceof ProgramNode) {
				return true;
			}
			else if (current instanceof MainBlockNode || current instanceof FunctionBlockNode) {
				return false;
			}
		}
		return false;
	}
	
	public boolean isLocalDeclaration() {
		for(ParseNode current : pathToRoot()) {
			if (current instanceof MainBlockNode || current instanceof FunctionBlockNode) {
				return true;
			}
		}
		return false;
	}
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static DeclarationNode withChildren(Token token, ParseNode declaredName, ParseNode initializer) {
		DeclarationNode node = new DeclarationNode(token);
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
