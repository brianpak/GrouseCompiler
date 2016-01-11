package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.GlobalDefTypes.FunctionBlockNode;
import logging.GrouseLogger;
import symbolTable.Scope;
import symbolTable.Binding.Binding;
import symbolTable.Binding.FunctionBinding;
import symbolTable.Binding.TupleBinding;
import tokens.IdentifierToken;
import tokens.Token;

public class IdentifierNode extends ParseNode {
	private Binding binding;
	private Scope declarationScope;

	public IdentifierNode(Token token) {
		super(token);
		assert(token instanceof IdentifierToken);
		this.binding = null;
	}
	public IdentifierNode(ParseNode node) {
		super(node);
		
		if(node instanceof IdentifierNode) {
			this.binding = ((IdentifierNode)node).binding;
		}
		else {
			this.binding = null;
		}
	}
	
////////////////////////////////////////////////////////////
// attributes
	
	public IdentifierToken identifierToken() {
		return (IdentifierToken)token;
	}

	public void setBinding(Binding binding) {
		this.binding = binding;
	}
	public Binding getBinding() {
		return binding;
	}
	
////////////////////////////////////////////////////////////
// Speciality functions
	public ParseNode getFunctionBlock() {
		for (ParseNode current : pathToRoot()) {
			if (current instanceof FunctionBlockNode) {
				return current;
			}
		}
		return null;
	}
	
	public boolean declarationCheck() {
		String identifier = token.getLexeme();

		for(ParseNode current : pathToRoot()) {
			if(current.containsBindingOf(identifier)) {
				Binding binding = current.bindingOf(identifier);
				if(binding.canDeclare()) {
					return true;
				}
				else {
					cannotDefineError();
					return false;
				}
			}
		}
		return true;
	}
	
	public Binding findVariableBinding() {
		String identifier = token.getLexeme();

		for(ParseNode current : pathToRoot()) {
			if(current.containsBindingOf(identifier)) {
				declarationScope = current.getScope();
				return current.bindingOf(identifier);
			}
		}
		useBeforeDefineError();
		return Binding.nullInstance();
	}
	
	public TupleBinding findTupleBinding() {
		String lexeme = this.getToken().getLexeme();
		Scope scope = this.getProgramScope();
		Binding binding = scope.getSymbolTable().lookup(lexeme);
		
		assert binding instanceof TupleBinding;
		return (TupleBinding) binding;
	}
	
	public FunctionBinding findFunctionBinding() {
		String lexeme = this.getToken().getLexeme();
		Scope scope = this.getProgramScope();
		Binding binding = scope.getSymbolTable().lookup(lexeme);
		
		assert binding instanceof FunctionBinding;
		return (FunctionBinding) binding;
	}

	public Scope getDeclarationScope() {
		findVariableBinding();
		return declarationScope;
	}
	public void useBeforeDefineError() {
		GrouseLogger log = GrouseLogger.getLogger("compiler.semanticAnalyzer.identifierNode");
		Token token = getToken();
		log.severe("identifier " + token.getLexeme() + " used before defined at " + token.getLocation());
	}
	public void cannotDefineError() {
		GrouseLogger log = GrouseLogger.getLogger("compiler.semanticAnalyzer.identifierNode");
		Token token = getToken();
		log.severe("identifier " + token.getLexeme() + " cannot be declared at " + token.getLocation());
	}
	
///////////////////////////////////////////////////////////
// accept a visitor
		
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}
}
