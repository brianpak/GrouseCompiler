package symbolTable.Binding;

import parseTree.nodeTypes.GlobalDefTypes.FunctionDefinitionNode;
import inputHandler.TextLocation;
import semanticAnalyzer.types.Type;
import symbolTable.MemoryLocation;

public class FunctionBinding extends Binding {
	
	FunctionDefinitionNode functionDefinitionNode;
	

	public FunctionBinding(String declarationKind, Type type, TextLocation location, 
						MemoryLocation memoryLocation, String lexeme, boolean declarable,
						FunctionDefinitionNode functionDefinitionNode) {
		super(declarationKind, type, location, memoryLocation, lexeme, declarable);
		this.functionDefinitionNode = functionDefinitionNode;
	}
	
	public FunctionDefinitionNode getFunctionDefinitionNode() {
		return functionDefinitionNode;
	}
}
