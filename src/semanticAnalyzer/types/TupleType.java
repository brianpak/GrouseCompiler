package semanticAnalyzer.types;

public class TupleType implements Type {
	public static final int TYPE_ID_LENGTH = 4;
	public static final int STATUS_LENGTH = 4;
	public static final int REF_COUNT_LENGTH = 1;
	
	public static final int TYPE_ID_START_BYTE = 0;
	public static final int STATUS_START_BYTE = TYPE_ID_START_BYTE + TYPE_ID_LENGTH;
	public static final int REF_COUNT_START_BYTE = STATUS_START_BYTE + STATUS_LENGTH;
	public static final int ELEMENT_START_BYTE = REF_COUNT_START_BYTE + REF_COUNT_LENGTH; 
	
	public static final int HEADER_LENGTH = ELEMENT_START_BYTE;
	
	private Type[] subTypes;
	
	public TupleType() {
		subTypes = null;
	}
	public TupleType(Type[] subTypes) {
		this.subTypes = subTypes;
	}
	public int getSize() {
		return referenceTypeSize;
	}
	public String typeString() {
		String subString = "";
		if (subTypes != null) {
			for (Type subType : subTypes) {
				subString = subString + subType.typeString() + " ";
			}
		}
		return subString;
	}
	
	public Type[] getSubTypes() {
		return subTypes;
	}
	
	public boolean isReferenceType() {
		return true;
	}
	
	public boolean match(Type type) {
		if (type instanceof TupleType) {
			TupleType tT = (TupleType) type;
			Type[] sT = tT.getSubTypes();
			
			assert subTypes.length == sT.length;
		
			boolean result = true;
			for (int i = 0; i < subTypes.length; i++) {
				boolean current = subTypes[i].match(sT[i]);
				if (current == false) {
					result = false;
				}
			}
			return result;
		}
		return false;
	}
}
