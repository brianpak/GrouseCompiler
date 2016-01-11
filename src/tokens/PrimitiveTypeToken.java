package tokens;

import inputHandler.TextLocation;

public class PrimitiveTypeToken extends TokenImp {
	protected String value;
	
	protected PrimitiveTypeToken(TextLocation location, String lexeme) {
		super(location, lexeme);
	}
	
	protected void setValue(String lexeme) {
		this.value = lexeme;
	}
	public String getValue() {
		return value;
	}
	
	public static PrimitiveTypeToken make(TextLocation location, String lexeme) {
		PrimitiveTypeToken result = new PrimitiveTypeToken(location, lexeme);
		result.setValue(lexeme);
		return result;
	}
	
	@Override
	protected String rawString() {
		return "String, " + value;
	}
}
