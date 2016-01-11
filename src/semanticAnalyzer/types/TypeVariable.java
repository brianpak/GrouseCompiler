package semanticAnalyzer.types;

public class TypeVariable implements Type {
	
	Type original;
	Type reference;
	
	public TypeVariable() {
		original = null;
		reference = null;
	}
	public int getSize() {
		return 0;
	}
	public String typeString() {
		return "";
	}
	public boolean isReferenceType() {
		return false;
	}
	
	public Type getOriginal() {
		return original;
	}
	public Type getReference() {
		return reference;
	}
	public void restoreRef() {
		reference = original;
		//System.out.println(reference.typeString());
	}
	public void reset() {
		reference = null;
	}
	
	public boolean match(Type type) {
		if (reference == null) {
			original = type;
			reference = type;
			return true;
		}
		else {
			boolean rtn = reference.match(type);
			restoreRef();
			return rtn;
		}
	}
}
