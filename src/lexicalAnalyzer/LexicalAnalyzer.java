package lexicalAnalyzer;

import logging.GrouseLogger;
import inputHandler.InputHandler;
import inputHandler.LocatedChar;
import inputHandler.LocatedCharStream;
import inputHandler.PushbackCharStream;
import inputHandler.TextLocation;
import semanticAnalyzer.types.PrimitiveType;
import tokens.CharToken;
import tokens.FloatToken;
import tokens.IdentifierToken;
import tokens.LextantToken;
import tokens.NullToken;
import tokens.IntegerToken;
import tokens.StringToken;
import tokens.Token;
import tokens.PrimitiveTypeToken;
import static lexicalAnalyzer.PunctuatorScanningAids.*;

public class LexicalAnalyzer extends ScannerImp implements Scanner {
	public static LexicalAnalyzer make(String filename) {
		InputHandler handler = InputHandler.fromFilename(filename);
		PushbackCharStream charStream = PushbackCharStream.make(handler);
		return new LexicalAnalyzer(charStream);
	}

	public LexicalAnalyzer(PushbackCharStream input) {
		super(input);
	}

	//////////////////////////////////////////////////////////////////////////////
	// Token-finding main dispatch	

	@Override
	protected Token findNextToken() {
		LocatedChar ch = nextNonWhitespaceChar();
		
		// comment
		if (ch.isSlash()) {
			LocatedChar nextChar = input.next();
			if (nextChar.isSlash()) {
				scanComment();
				return findNextToken();
			}
			else { // divide operator
				input.pushback(nextChar);
				return PunctuatorScanner.scan(ch, input);
			}
		}
		
		// negative number
		else if (ch.isNegativeSign()) {
			LocatedChar nextChar = input.next();
			if (nextChar.isDigit()) {
				return scanNumber(ch, nextChar);
			}
			else { // subtract operator
				input.pushback(nextChar);
				return PunctuatorScanner.scan(ch, input);
			}
		}
		
		// positive number
		else if(ch.isDigit()) {
			return scanNumber(ch);
		}
		
		// string
		else if(ch.isDoubleQuote()) {
			LocatedChar nextChar = input.next();
			if (nextChar.isDoubleQuote()) {
				return StringToken.make(ch.getLocation(), "");
			}
			else if (nextChar.isLinebreak()) {
				stringLexicalError(ch);
				return findNextToken();
			}
			else if (!nextChar.isASCII()) {
				stringLexicalError(ch);
				return findNextToken();
			}
			else {
				return scanString(nextChar);
			}
		}
		
		// character
		else if(ch.isSingleQuote()) {
			LocatedChar nextChar = input.next();
			if (nextChar.isPrintableASCII()) {
				return scanChar(nextChar);
			}
			else {
				charLexicalError(ch);
				input.pushback(nextChar);
				return findNextToken();
			}
		}
		
		else if(ch.isUpperCase() || ch.isLowerCase() || ch.isUnderscore()) {
			return scanIdentifier(ch);
		}
		else if(isPunctuatorStart(ch)) {
			return PunctuatorScanner.scan(ch, input);
		}
		else if(isEndOfInput(ch)) {
			return NullToken.make(ch.getLocation());
		}
		else {
			lexicalError(ch);
			return findNextToken();
		}
	}


	private LocatedChar nextNonWhitespaceChar() {
		LocatedChar ch = input.next();
		while(ch.isWhitespace()) {
			ch = input.next();
		}
		return ch;
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Comment lexical analysis
	private void scanComment() {
		LocatedChar ch = input.next();
		while (neitherSlashNorLinebreak(ch)) {
			ch = input.next();
		}
		while (ch.isSlash()) {
			ch = input.next();
			if (neitherSlashNorLinebreak(ch)) {
				ch = input.next();
				while (neitherSlashNorLinebreak(ch)) {
					ch = input.next();
				}
			}
			else if (ch.isSlash() || ch.isLinebreak()){
				return;
			}
		}
		if (ch.isLinebreak()) return;
		else {
			commentLexicalError(ch);
			input.pushback(ch);
			return;
		}
	}
	
	private boolean neitherSlashNorLinebreak(LocatedChar ch) {
		return !ch.isSlash() && !ch.isLinebreak();
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Integer/Float lexical analysis
	
	private Token scanNumber(LocatedChar firstChar, LocatedChar secondChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		buffer.append(secondChar.getCharacter());
		
		int type = appendSubsequentDigitsAndDecimals(buffer);
		return createCorrectNumberToken(firstChar, buffer, type);
	}

	private Token scanNumber(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		int type = appendSubsequentDigitsAndDecimals(buffer);
		
		return createCorrectNumberToken(firstChar, buffer, type);
	}
	
	private Token createCorrectNumberToken(LocatedChar firstChar, StringBuffer buffer, int type) {
		switch (type) {
		case 1: // integer token
			return IntegerToken.make(firstChar.getLocation(), buffer.toString());
		case 2: // float token
			return FloatToken.make(firstChar.getLocation(), buffer.toString());
		default: // invalid token
			return findNextToken();
		}
	}

	private int appendSubsequentDigitsAndDecimals(StringBuffer buffer) {
		LocatedChar c = input.next();
		LocatedChar previous;
		c = iterateNumbers(c, buffer);
		
		// float number
		if (c.isDot()) {
			buffer.append(c.getCharacter());
			previous = c;
			c = input.next();
			
			if (c.isDigit()) {
				buffer.append(c.getCharacter());
				c = input.next();
				c = iterateNumbers(c, buffer);
				
				if (c.isE()) {
					buffer.append(c.getCharacter());
					previous = c;
					c = input.next();
					
					if (c.isPositiveSign() || c.isNegativeSign()) {
						buffer.append(c.getCharacter());
						previous = c;
						c = input.next();
						
						if (c.isDigit()) {
							buffer.append(c.getCharacter());
							c = input.next();
							c = iterateNumbers(c, buffer);

							input.pushback(c);
							return 2;
						}
						else {
							numericalLexicalError(previous);
							input.pushback(c);
							return 3;
						}
					}
					else if (c.isDigit()) {
						buffer.append(c.getCharacter());
						c = input.next();
						c = iterateNumbers(c, buffer);
						
						input.pushback(c);
						return 2;
					}
					else {
						numericalLexicalError(previous);
						input.pushback(c);
						return 3;
					}
				}
				else {
					input.pushback(c);
					return 2;
				}
			}
			else {
				numericalLexicalError(previous);
				input.pushback(c);
				return 3;
			}
		}
		else {
			input.pushback(c);
			return 1;
		}
	}
	
	private LocatedChar iterateNumbers(LocatedChar c, StringBuffer buffer) {
		while(c.isDigit()) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		return c;
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// String lexical analysis
	
	private Token scanString(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		appendSubsequentStringLetter(buffer);
		
		LocatedChar c = input.next();
		if (c.isLinebreak()) {
			stringLexicalError(c);
			return findNextToken();
		}
		else if (c.isDoubleQuote())
			return StringToken.make(firstChar.getLocation(), buffer.toString());
		
		else { 	// contains non-ascii character
			stringLexicalError(c);
			input.pushback(c);
			return findNextToken();
		}
	}
	
	private void appendSubsequentStringLetter(StringBuffer buffer) {
		LocatedChar c = input.next();
		while(!c.isDoubleQuote() && !c.isLinebreak() && c.isASCII()) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		input.pushback(c);
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Character lexical analysis
	
	private Token scanChar(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		return CharToken.make(firstChar.getLocation(), buffer.toString());
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Identifier and keyword lexical analysis	

	private Token scanIdentifier(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		appendSubsequentIdentifierLetter(buffer);

		String lexeme = buffer.toString();
		if (lexeme.length() > 32) {
			IdentifierLexicalError(firstChar);
			return findNextToken();
		}
		
		if(Keyword.isAKeyword(lexeme)) {
			return LextantToken.make(firstChar.getLocation(), lexeme, Keyword.forLexeme(lexeme));
		}
		else if(PrimitiveType.isPrimitiveType(lexeme)) {
			return PrimitiveTypeToken.make(firstChar.getLocation(), lexeme);
		} 
		else {
			return IdentifierToken.make(firstChar.getLocation(), lexeme);
		}
	}
	private void appendSubsequentIdentifierLetter(StringBuffer buffer) {
		LocatedChar c = input.next();
		while(c.isUpperCase() || c.isLowerCase() || c.isUnderscore() || c.isTilde() || c.isDigit()) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		input.pushback(c);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Punctuator lexical analysis	
	// old method left in to show a simple scanning method.
	// current method is the algorithm object PunctuatorScanner.java

	@SuppressWarnings("unused")
	private Token oldScanPunctuator(LocatedChar ch) {
		TextLocation location = ch.getLocation();
		
		switch(ch.getCharacter()) {
		case '*':
			return LextantToken.make(location, "*", Punctuator.MULTIPLY);
		case '+':
			return LextantToken.make(location, "+", Punctuator.ADD);
		case '>':
			return LextantToken.make(location, ">", Punctuator.GREATER);
		case ':':
			if(ch.getCharacter()=='=') {
				return LextantToken.make(location, ":=", Punctuator.ASSIGN);
			}
			else {
				throw new IllegalArgumentException("found : not followed by = in scanOperator");
			}
		case ',':
			return LextantToken.make(location, ",", Punctuator.SEPARATOR);
		case ';':
			return LextantToken.make(location, ";", Punctuator.TERMINATOR);
		default:
			throw new IllegalArgumentException("bad LocatedChar " + ch + "in scanOperator");
		}
	}

	

	//////////////////////////////////////////////////////////////////////////////
	// Character-classification routines specific to Grouse scanning.	

	private boolean isPunctuatorStart(LocatedChar lc) {
		char c = lc.getCharacter();
		return isPunctuatorStartingCharacter(c);
	}

	private boolean isEndOfInput(LocatedChar lc) {
		return lc == LocatedCharStream.FLAG_END_OF_INPUT;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Error-reporting	

	private void lexicalError(LocatedChar ch) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: invalid character " + ch);
	}
	private void commentLexicalError(LocatedChar ch) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: comment does not end " + ch);
	}
	private void numericalLexicalError(LocatedChar ch) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: digits are not followed after " + ch);
	}
	private void charLexicalError(LocatedChar ch) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: a letter is not followed after " + ch);
	}
	private void stringLexicalError(LocatedChar ch) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: invalid character or missing a double quote " + ch);
	}
	private void IdentifierLexicalError(LocatedChar ch) {
		GrouseLogger log = GrouseLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: length of the identifier is longer than 32 characters " + ch);
	}
}
