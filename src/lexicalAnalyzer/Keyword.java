package lexicalAnalyzer;

import tokens.LextantToken;
import tokens.Token;


public enum Keyword implements Lextant {
	IMMUTABLE("imm"),
	MUTABLE("var"),
	RE_ASSIGN("let"),
	PRINT("print"),
	NEWLINE("nl"),
	
	TRUE("true"),
	FALSE("false"),
	
	MAIN("main"),
	IF("if"),
	ELSE("else"),
	
	WHILE("while"),
	
	FOR("for"),
	INDEX("index"),
	ELEMENT("element"),
	PAIR("pair"),
	OF("of"),
	EVER("ever"),
	COUNT("count"),
	
	BREAK("break"),
	CONTINUE("continue"),
	
	FRESH("fresh"),
	COPY("copy"),
	
	TUPLE("tuple"),
	FUNC("func"),
	CALL("call"),
	RETURN("return"),
	
	STATIC("static"),
	DIAGNOSTIC("diag"),
	
	NULL("null"),
	
	NULL_KEYWORD("");

	private String lexeme;
	private Token prototype;
	
	private Keyword(String lexeme) {
		this.lexeme = lexeme;
		this.prototype = LextantToken.make(null, lexeme, this);
	}
	
	public String getLexeme() {
		return lexeme;
	}
	
	public Token prototype() {
		return prototype;
	}
	
	public static Keyword forLexeme(String lexeme) {
		for(Keyword keyword: values()) {
			if(keyword.lexeme.equals(lexeme)) {
				return keyword;
			}
		}
		return NULL_KEYWORD;
	}
	
	public static boolean isAKeyword(String lexeme) {
		return forLexeme(lexeme) != NULL_KEYWORD;
	}
	
	/*   the following hashtable lookup can replace the serial-search implementation of forLexeme above. It is faster but less clear. 
	private static LexemeMap<Keyword> lexemeToKeyword = new LexemeMap<Keyword>(values(), NULL_KEYWORD);
	public static Keyword forLexeme(String lexeme) {
		return lexemeToKeyword.forLexeme(lexeme);
	}
	*/
}
