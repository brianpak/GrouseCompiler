package symbolTable.Binding;

import parseTree.nodeTypes.StaticDeclarationNode;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import inputHandler.TextLocation;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.MemoryLocation;

public class Binding {
	private StaticDeclarationNode staticDec;
	private boolean declarable;
	private String declarationKind;
	private Type type;
	private TextLocation textLocation;
	private MemoryLocation memoryLocation;
	private String lexeme;
	
	public Binding(String declarationKind, Type type, TextLocation location, MemoryLocation memoryLocation, String lexeme, boolean declarable) {
		super();
		this.staticDec = null;
		this.declarable = declarable;
		this.declarationKind = declarationKind;
		this.type = type;
		this.textLocation = location;
		this.memoryLocation = memoryLocation;
		this.lexeme = lexeme;
	}
	

	public String toString() {
		return "[" + declarationKind +
				" "	+ lexeme +
				" " + type +  // " " + textLocation +	
				" " + memoryLocation +
				"]";
	}
	public boolean canDeclare() {
		return declarable;
	}
	public String getDeclarationKind() {
		return declarationKind;
	}
	public void setDeclarationType(String declarationKind) {
		this.declarationKind = declarationKind;
	}
	public String getLexeme() {
		return lexeme;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public StaticDeclarationNode getStaticDec() {
		return staticDec;
	}
	public void setStaticDec(StaticDeclarationNode node) {
		this.staticDec = node;
	}
	public TextLocation getLocation() {
		return textLocation;
	}
	public MemoryLocation getMemoryLocation() {
		return memoryLocation;
	}
	public void setMemoryLocation(MemoryLocation memoryLocation) {
		this.memoryLocation = memoryLocation;
	}
	public void generateAddress(ASMCodeFragment code) {
		memoryLocation.generateAddress(code, "%% " + lexeme);
	}
	
////////////////////////////////////////////////////////////////////////////////////
//Null Binding object
////////////////////////////////////////////////////////////////////////////////////

	public static Binding nullInstance() {
		return NullBinding.getInstance();
	}
	private static class NullBinding extends Binding {
		private static NullBinding instance=null;
		private NullBinding() {
			super("",
					PrimitiveType.ERROR,
					TextLocation.nullInstance(),
					MemoryLocation.nullInstance(),
					"the-null-binding",
					true);
		}
		public static NullBinding getInstance() {
			if(instance==null)
				instance = new NullBinding();
			return instance;
		}
	}
}
