package semanticAnalyzer.signatures;

import java.util.List;

import parseTree.nodeTypes.LetStatementNode;
import parseTree.nodeTypes.OperatorNodeTypes.ArrayOperatorNode;
import parseTree.nodeTypes.OperatorNodeTypes.FreshOperatorNode;
import semanticAnalyzer.types.ArrayType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeVariable;

//immutable
public class FunctionSignature {
	private static final boolean ALL_TYPES_ACCEPT_ERROR_TYPES = true;
	private Type resultType;
	private Type[] paramTypes;
	Object whichVariant;
	
	
	///////////////////////////////////////////////////////////////
	// construction
	
	public FunctionSignature(Object whichVariant, Type ...types) {
		assert(types.length >= 1);
		storeParamTypes(types);
		resultType = types[types.length-1];
		this.whichVariant = whichVariant;
	}
	
	private void storeParamTypes(Type[] types) {
		paramTypes = new Type[types.length-1];
		for(int i=0; i<types.length-1; i++) {
			paramTypes[i] = types[i];
		}
	}
	
	
	///////////////////////////////////////////////////////////////
	// accessors
	
	public Object getVariant() {
		return whichVariant;
	}
	public Type resultType() {
		return resultType;
	}
	public boolean isNull() {
		return false;
	}
	
	
	///////////////////////////////////////////////////////////////
	// main query

	public boolean accepts(List<Type> types) {
		if(types.size() != paramTypes.length) {
			return false;
		}
		
		for(int i=0; i<paramTypes.length; i++) {
			if(!assignableTo(paramTypes[i], types.get(i))) {
				return false;
			}
		}		
		return true;
	}
	private boolean assignableTo(Type variableType, Type valueType) {
		if (valueType == PrimitiveType.ERROR && ALL_TYPES_ACCEPT_ERROR_TYPES) {
			return true;
		}

		else if (variableType instanceof ArrayType && valueType instanceof ArrayType) {
			ArrayType aT1 = (ArrayType)variableType;
			ArrayType aT2 = (ArrayType)valueType;
			
			return assignableTo(aT1.getSubType(), aT2.getSubType());
		}

		boolean result = variableType.match(valueType);
		
		if (variableType instanceof TypeVariable) {
			TypeVariable tV = (TypeVariable) variableType;
			setReturnType(tV);
			tV.restoreRef();
		}
		
		return result;
	}
	private void setReturnType(TypeVariable tV) {
		// if whichVariant is an instance of string
		// result type has to be reset
		if (whichVariant instanceof String) {
			switch ((String)whichVariant) {
			case ArrayOperatorNode.POPULATED_CREATION: 		{resultType = new ArrayType(tV.getOriginal());	break;}
			case ArrayOperatorNode.INDEX_OPERATION: 		{resultType = tV.getOriginal();					break;}
			case ArrayOperatorNode.CONCATENATION_OPERATION:	{resultType = new ArrayType(tV.getOriginal());	break;}
			
			case FreshOperatorNode.ARRAY_FRESH_CREATION: 	{resultType = new ArrayType(tV.getOriginal());	break;}

			case LetStatementNode.RE_ASSIGNMENT:			{resultType = tV.getOriginal();					break;}
			
			default: break;}
		}
	}
	
	// Null object pattern
	private static FunctionSignature neverMatchedSignature = new FunctionSignature(1, PrimitiveType.ERROR) {
		public boolean accepts(List<Type> types) {
			return false;
		}
		public boolean isNull() {
			return true;
		}
	};
	public static FunctionSignature nullInstance() {
		return neverMatchedSignature;
	}
	
	///////////////////////////////////////////////////////////////////
	// Signatures for grouse-0 operators
	// this section will probably disappear in grouse-1 (in favor of FunctionSignatures)
	
//	private static FunctionSignature addSignature = new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.INTEGER);
//	private static FunctionSignature multiplySignature = new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.INTEGER);
//	private static FunctionSignature greaterSignature = new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.BOOLEAN);
//
//	
//	// the switch here is ugly compared to polymorphism.  This should perhaps be a method on Lextant.
//	public static FunctionSignature signatureOf(Lextant lextant) {
//		assert(lextant instanceof Punctuator);	
//		Punctuator punctuator = (Punctuator)lextant;
//		
//		switch(punctuator) {
//		case ADD:		return addSignature;
//		case MULTIPLY:	return multiplySignature;
//		case GREATER:	return greaterSignature;
//
//		default:
//			return neverMatchedSignature;
//		}
//	}

}