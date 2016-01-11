package semanticAnalyzer.types;

public class ArrayType implements Type {
	public static final int TYPE_ID_LENGTH = 4;
	public static final int STATUS_LENGTH = 4;
	public static final int REF_COUNT_LENGTH = 1;
	public static final int SUB_TYPE_SIZE = 4;
	public static final int LENGTH_LENGTH = 4;
	
	public static final int TYPE_ID_START_BYTE = 0;
	public static final int STATUS_START_BYTE = TYPE_ID_START_BYTE + TYPE_ID_LENGTH;
	public static final int REF_COUNT_START_BYTE = STATUS_START_BYTE + STATUS_LENGTH;
	public static final int SUB_SIZE_START_BYTE = REF_COUNT_START_BYTE + REF_COUNT_LENGTH; 
	public static final int LENGTH_START_BYTE = SUB_SIZE_START_BYTE + SUB_TYPE_SIZE;
	public static final int ELEMENT_START_BYTE = LENGTH_START_BYTE + LENGTH_LENGTH;
	
	public static final int HEADER_LENGTH = ELEMENT_START_BYTE;
	
	private Type subType;
	
	public ArrayType() {
		subType = null;
	}
	public ArrayType(Type subType) {
		this.subType = subType;
	}
	public int getSize() {
		return referenceTypeSize;
	}
	public String typeString() {
		String subString = "";
		if (subType != null) {
			subString = subType.typeString();
		}
		return "array " + subString;
	}
	
	public Type getSubType() {
		return subType;
	}
	
	public boolean isReferenceType() {
		return true;
	}
	
	public boolean match(Type type) {
		if (type instanceof ArrayType) {
			ArrayType aT = (ArrayType) type;
			Type sT = aT.getSubType();
		
			return subType.match(sT);
		}
		return false;
	}
}
