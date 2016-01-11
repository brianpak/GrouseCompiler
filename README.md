1. src/LexicalAnalyzer/LexicalAnalyzer.java
2. 
Handles the lexical anlysis of the source

Tokenizes each meaningful word and passes it to the parser

ex) Removes comments and white spaces



2. src/Parser/Parser.java
3. 
Handles the syntax analysis of the source

Constructs a node for each token passed by the lexical analyzer

Builds an abstract tree structure according to the language definition, using the nodes

ex) var a := b + c * d;

	becomes       	a
	
					|
					
					*
					
				   / \
				   
				  +	  d
				  
				 / \
				 
				b   c
				
				
				
3. src/semanticAnalyzer/SemanticAnalysisVisitor4.java
4. 
Handles the semantic analysis of the source

One or more visits on the tree built by the parser happen depending on features

Mostly type checks are involved using the function signatures

ex) the expression b + c * d

	is only right when all of the types of b, c, and d are integers or floats
	


4. src/asmCodeGenerator/ASMCodeGenerator.java
5. 
Handles the code generation of the source

Assembly codes are generated from this part

Each node has its own machine code to be produced. Typically primitives result in values where as identifiers output an address of the memory

ex) var a := b + c * d;

	it will load the value of b on the ASM stack
	
	it will load the value of c on the ASM stack
	
	it will add the two values (b + c)
	
	it will load the value of d on the ASM stack
	
	it will multiply the two values ((b + c) * d)
	
	it will store the computed value to the location of a
	
