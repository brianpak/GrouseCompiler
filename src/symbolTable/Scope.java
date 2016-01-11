package symbolTable;

import parseTree.nodeTypes.GlobalDefTypes.FunctionDefinitionNode;
import parseTree.nodeTypes.GlobalDefTypes.TupleDefinitionNode;
import inputHandler.TextLocation;
import logging.GrouseLogger;
import semanticAnalyzer.types.Type;
import symbolTable.Binding.Binding;
import symbolTable.Binding.FunctionBinding;
import symbolTable.Binding.TupleBinding;
import tokens.Token;

public class Scope {
	private Scope baseScope;
	private MemoryAllocator allocator;
	private SymbolTable symbolTable;
	
//////////////////////////////////////////////////////////////////////
// factories

	public static Scope createProgramScope() {
		return new Scope(programScopeAllocator(), nullInstance());
	}
	public static Scope createTupleScope() {
		return new Scope(tupleScopeAllocator(), nullInstance());
	}
	public static Scope createParameterScope() {
		return new Scope(parameterScopeAllocator(), nullInstance());
	}
	public static Scope createProcedureScope() {
		return new Scope(procedureScopeAllocator(), nullInstance());
	}
	public Scope createSubscope() {
		return new Scope(allocator, this);
	}
	
	private static MemoryAllocator programScopeAllocator() {
		return new PositiveMemoryAllocator(
				MemoryAccessMethod.DIRECT_ACCESS_BASE, 
				MemoryLocation.GLOBAL_VARIABLE_BLOCK);
	}
	private static MemoryAllocator tupleScopeAllocator() {
		return new PositiveMemoryAllocator(
				MemoryAccessMethod.NULL_ACCESS, 
				9);
	}
	private static MemoryAllocator parameterScopeAllocator() {
		return new NegativeMemoryAllocator(
				MemoryAccessMethod.INDIRECT_ACCESS_BASE, 
				MemoryLocation.FRAME_POINTER);
	}
	private static MemoryAllocator procedureScopeAllocator() {
		return new NegativeMemoryAllocator(
				MemoryAccessMethod.INDIRECT_ACCESS_BASE, 
				MemoryLocation.FRAME_POINTER);
	}
	
//////////////////////////////////////////////////////////////////////
// private constructor.	
	private Scope(MemoryAllocator allocator, Scope baseScope) {
		super();
		this.baseScope = (baseScope == null) ? this : baseScope;
		this.symbolTable = new SymbolTable();
		this.allocator = allocator;
	}
	
///////////////////////////////////////////////////////////////////////
//  basic queries	
	public Scope getBaseScope() {
		return baseScope;
	}
	public MemoryAllocator getAllocationStrategy() {
		return allocator;
	}
	public SymbolTable getSymbolTable() {
		return symbolTable;
	}
	
///////////////////////////////////////////////////////////////////////
//memory allocation
	public void enter() {
		allocator.saveState();
	}
	// must call leave() when destroying/leaving a scope.
	public void leave() {
		allocator.restoreState();
	}
	public int getAllocatedSize() {
		return allocator.getMaxAllocatedSize();
	}

///////////////////////////////////////////////////////////////////////
//bindings
	public Binding createBinding(String declaration, Token identifierToken, Type type, boolean declarable) {
		symbolTable.errorIfAlreadyDefined(identifierToken);

		return installBinding(declaration, identifierToken, type, declarable);
	}
	private Binding installBinding(String declaration, Token identifierToken, Type type, boolean declarable) {
		String lexeme = identifierToken.getLexeme();
		Binding binding = allocateNewBinding(declaration, type, identifierToken.getLocation(), lexeme, declarable);
		symbolTable.install(lexeme, binding);
		
		return binding;
	}
	private Binding allocateNewBinding(String declaration, Type type, TextLocation textLocation, String lexeme, boolean declarable) {
		MemoryLocation memoryLocation = allocator.allocate(type.getSize());
		return new Binding(declaration, type, textLocation, memoryLocation, lexeme, declarable);
	}
	
///////////////////////////////////////////////////////////////////////
//toString
	public String toString() {
		String result = "scope: ";
		result += " hash "+ hashCode() + "\n";
		result += symbolTable;
		return result;
	}

////////////////////////////////////////////////////////////////////////////////////
//Null Scope object - lazy singleton (Lazy Holder) implementation pattern
	public static Scope nullInstance() {
		return NullScope.instance;
	}
	private static class NullScope extends Scope {
		private static NullScope instance = new NullScope();

		private NullScope() {
			super(	new PositiveMemoryAllocator(MemoryAccessMethod.NULL_ACCESS, "", 0),
					null);
		}
		public String toString() {
			return "scope: the-null-scope";
		}
		@Override
		public Binding createBinding(String declaration, Token identifierToken, Type type, boolean declarable) {
			unscopedIdentifierError(identifierToken);
			return super.createBinding(declaration, identifierToken, type, declarable);
		}
		// subscopes of null scope need their own strategy.  Assumes global block is static.
		public Scope createSubscope() {
			return new Scope(programScopeAllocator(), this);
		}
	}


///////////////////////////////////////////////////////////////////////
//error reporting
	private static void unscopedIdentifierError(Token token) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.scope");
		log.severe("variable " + token.getLexeme() + 
				" used outside of any scope at " + token.getLocation());
	}

}
