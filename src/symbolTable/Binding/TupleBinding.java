package symbolTable.Binding;

import parseTree.nodeTypes.GlobalDefTypes.TupleDefinitionNode;
import inputHandler.TextLocation;
import semanticAnalyzer.types.Type;
import symbolTable.MemoryLocation;

public class TupleBinding extends Binding {
	
	TupleDefinitionNode tupleDefinitionNode;

	public TupleBinding(String declarationKind, Type type, TextLocation location, 
						MemoryLocation memoryLocation, String lexeme, boolean declarable,
						TupleDefinitionNode tupleDefinitionNode) {
		super(declarationKind, type, location, memoryLocation, lexeme, declarable);
		this.tupleDefinitionNode = tupleDefinitionNode;
	}
	
	public TupleDefinitionNode getTupleDefinitionNode() {
		return tupleDefinitionNode;
	}
}
