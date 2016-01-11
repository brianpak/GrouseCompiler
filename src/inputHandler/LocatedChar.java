package inputHandler;

/** Value object for holding a character and its location in the input text.
 *  Contains delegates to select character operations.
 *
 */
public class LocatedChar {
	Character character;
	TextLocation location;
	
	public LocatedChar(Character character, TextLocation location) {
		super();
		this.character = character;
		this.location = location;
	}

	
	//////////////////////////////////////////////////////////////////////////////
	// getters
	
	public Character getCharacter() {
		return character;
	}
	public TextLocation getLocation() {
		return location;
	}
	public boolean isChar(char c) {
		return character == c;
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////
	// toString
	
	public String toString() {
		return "(" + charString() + ", " + location + ")";
	}
	private String charString() {
		if(Character.isWhitespace(character)) {
			int i = character;
			return String.format("'\\%d'", i);
		}
		else {
			return character.toString();
		}
	}

	
	//////////////////////////////////////////////////////////////////////////////
	// delegates
	public boolean isE() {
		return character == 'e';
	}
	public boolean isDot() {
		return character == '.';
	}
	public boolean isUnderscore() {
		return character == '_';
	}
	public boolean isTilde() {
		return character == '~';
	}
	public boolean isSlash() {
		return character == '/';
	}
	public boolean isPositiveSign() {
		return character == '+';
	}
	public boolean isNegativeSign() {
		return character == '-';
	}
	public boolean isDoubleQuote() {
		return character == '"';
	}
	public boolean isSingleQuote() {
		return character == '\'';
	}
	public boolean isPrintableASCII() {
		return character >= 32 && character <= 126;
	}
	public boolean isASCII() {
		return character >= 0 && character <= 126;
	}
	public boolean isLinebreak() {
		return character == '\n';
	}
	public boolean isLowerCase() {
		return Character.isLowerCase(character);
	}
	public boolean isUpperCase() {
		return Character.isUpperCase(character);
	}
	public boolean isDigit() {
		return Character.isDigit(character);
	}
	public boolean isWhitespace() {
		return Character.isWhitespace(character);
	}
}
