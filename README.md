1) src/LexicalAnalyzer/LexicalAnalyzer.java<br />
Handles the lexical anlysis of the source<br />
Tokenizes each meaningful word and passes it to the parser<br />
ex) Removes comments and white spaces<br />


2) src/Parser/Parser.java<br />
Handles the syntax analysis of the source<br />
Constructs a node for each token passed by the lexical analyzer<br />
Builds an abstract tree structure according to the language definition, using the nodes<br />
ex) var a := b + c * d;<br />
```
	becomes       	a
					|
					*
				   / \
				  +	  d
				 / \
				b   c
```
				
				
3) src/semanticAnalyzer/SemanticAnalysisVisitor4.java<br />
Handles the semantic analysis of the source<br />
One or more visits on the tree built by the parser happen depending on features<br />
Mostly type checks are involved using the function signatures<br />
ex) the expression b + c * d<br />
```
	is only right when all of the types of b, c, and d are integers or floats
```	

4) src/asmCodeGenerator/ASMCodeGenerator.java<br />
Handles the code generation of the source<br />
Assembly codes are generated from this part<br />
Each node has its own machine code to be produced. Typically primitives result in values where as identifiers output an address of the memory<br />
ex) var a := b + c * d;<br />
```
	it will load the value of b on the ASM stack
	it will load the value of c on the ASM stack
	it will add the two values (b + c)
	it will load the value of d on the ASM stack
	it will multiply the two values ((b + c) * d)
	it will store the computed value to the location of a
```
