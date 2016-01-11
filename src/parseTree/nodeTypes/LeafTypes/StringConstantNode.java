package parseTree.nodeTypes.LeafTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.StringToken;
import tokens.Token;

public class StringConstantNode extends ParseNode {
	public static final int TYPE_ID_LENGTH = 4;
	public static final int STATUS_LENGTH = 4;
	public static final int REF_COUNT_LENGTH = 1;
	public static final int LENGTH_LENGTH = 4;
	
	public static final int TYPE_ID_START_BYTE = 0;
	public static final int STATUS_START_BYTE = TYPE_ID_START_BYTE + TYPE_ID_LENGTH;
	public static final int REF_COUNT_START_BYTE = STATUS_START_BYTE + STATUS_LENGTH;
	public static final int LENGTH_START_BYTE = REF_COUNT_START_BYTE + REF_COUNT_LENGTH;
	public static final int STRING_START_BYTE = LENGTH_START_BYTE + LENGTH_LENGTH;
	
	public static final int HEADER_LENGTH = STRING_START_BYTE;
	
	public static final int EMPTY_BYTE = 1;

	public StringConstantNode(Token token) {
		super(token);
		assert(token instanceof StringToken);
	}
	public StringConstantNode(ParseNode node) {
		super(node);
	}

	////////////////////////////////////////////////////////////
	// attributes
	
	public String getValue() {
		return StringToken().getValue();
	}

	public StringToken StringToken() {
		return (StringToken)token;
	}	

	///////////////////////////////////////////////////////////
	// accept a visitor
	
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}

}
