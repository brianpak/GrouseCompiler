package symbolTable.Binding;

import parseTree.nodeTypes.IdentifierNode;
import parseTree.nodeTypes.GlobalDefTypes.FunctionDefinitionNode;
import parseTree.nodeTypes.GlobalDefTypes.TupleDefinitionNode;
import semanticAnalyzer.types.Type;
import symbolTable.Scope;

public class BindingHelper {

	public static void addBindingToLocalScope(String declarationKind, IdentifierNode identifier, Type type, boolean declarable) {
		Scope scope = identifier.getLocalScope();
		Binding binding = scope.createBinding(declarationKind, identifier.getToken(), type, declarable);
		identifier.setBinding(binding);
	}
	
	public static void reAddBindingToLocalScope(IdentifierNode identifier, Type type) {
		Scope scope = identifier.getLocalScope();
		Binding binding = scope.reDoBinding(identifier.getToken(), type);
		identifier.setBinding(binding);
	}
}
