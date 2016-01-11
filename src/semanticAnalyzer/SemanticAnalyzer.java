package semanticAnalyzer;

import parseTree.*;


public class SemanticAnalyzer {
	ParseNode ASTree;
	
	public static ParseNode analyze(ParseNode ASTree) {
		SemanticAnalyzer analyzer = new SemanticAnalyzer(ASTree);
		return analyzer.analyze();
	}
	public SemanticAnalyzer(ParseNode ASTree) {
		this.ASTree = ASTree;
	}
	
	public ParseNode analyze() {
		ASTree.accept(new SemanticAnalysisVisitor1());
		ASTree.accept(new SemanticAnalysisVisitor2());
		ASTree.accept(new SemanticAnalysisVisitor3());
		ASTree.accept(new SemanticAnalysisVisitor4());
		
		return ASTree;
	}
}
