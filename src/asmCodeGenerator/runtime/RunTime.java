package asmCodeGenerator.runtime;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
public class RunTime {
	public static final String EAT_LOCATION_ZERO      			= "$eat-location-zero";		// helps us distinguish null pointers from real ones.
	public static final String NULL_PRINT_FORMAT	   			= "$print-format-null";
	public static final String INTEGER_PRINT_FORMAT   			= "$print-format-integer";
	public static final String FLOAT_PRINT_FORMAT     			= "$print-format-float";
	public static final String BOOLEAN_PRINT_FORMAT   			= "$print-format-boolean";
	public static final String CHARACTER_PRINT_FORMAT 			= "$print-format-character";
	public static final String STRING_PRINT_FORMAT 	  			= "$print-format-string";
	public static final String NEWLINE_PRINT_FORMAT   			= "$print-format-newline";
	public static final String SEPARATOR_PRINT_FORMAT 			= "$print-format-separator";
	public static final String COMMA_PRINT_FORMAT				= "$print-format-comma-";
	public static final String OPEN_BRACKET_PRINT_FORMAT 		= "$print-format-open-bracket";
	public static final String CLOSE_BRACKET_PRINT_FORMAT 		= "$print-format-close-bracket";
	public static final String OPEN_PARENTHESE_PRINT_FORMAT 	= "$print-format-open-parentheses";
	public static final String CLOSE_PARENTHESES_PRINT_FORMAT 	= "$print-format-close-parentheses";
	
	public static final String BOOLEAN_TRUE_STRING    = "$boolean-true-string";
	public static final String BOOLEAN_FALSE_STRING   = "$boolean-false-string";
	public static final String GLOBAL_MEMORY_BLOCK    = "$global-memory-block";
	
	public static final String USABLE_MEMORY_START    = "$usable-memory-start";
	public static final String MAIN_PROGRAM_LABEL     = "$$main";
	
	public static final String FRAME_POINTER		  = "$frame-pointer";
	public static final String STACK_POINTER		  = "$stack-pointer";
	
	public static final String GENERAL_RUNTIME_ERROR = "$$general-runtime-error";
	public static final String INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$i-divide-by-zero";
	public static final String FLOAT_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$f-divide-by-zero";
	public static final String NEGATIVE_ARRAY_LENGTH_RUNTIME_ERROR = "$$negative-array-length";
	public static final String ARRAY_INDEX_OUT_OF_BOUNDS = "$$array-index-out-of-bounds";

	private ASMCodeFragment environmentASM() {
		ASMCodeFragment result = new ASMCodeFragment(GENERATES_VOID);
		result.append(allocatePointers());
		result.append(jumpToMain());
		result.append(stringsForPrintf());
		result.append(runtimeErrors());
		result.add(DLabel, USABLE_MEMORY_START);
		return result;
	}
	
	private ASMCodeFragment allocatePointers() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		
		frag.add(DLabel, FRAME_POINTER);
		frag.add(DataI, 0);					// init the data as 0
		frag.add(PushD, FRAME_POINTER);
		frag.add(Memtop);					// MEMTOP
		frag.add(StoreI);
		
		frag.add(DLabel, STACK_POINTER);
		frag.add(DataI, 0);					// init the data as 0
		frag.add(PushD, STACK_POINTER);
		frag.add(Memtop);					// MEMTOP
		frag.add(StoreI);
		
		return frag;
	}
	
	private ASMCodeFragment jumpToMain() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		frag.add(Jump, MAIN_PROGRAM_LABEL);
		return frag;
	}

	private ASMCodeFragment stringsForPrintf() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		frag.add(DLabel, EAT_LOCATION_ZERO);
		frag.add(DataZ, 8);
		frag.add(DLabel, NULL_PRINT_FORMAT);
		frag.add(DataS, "null");
		frag.add(DLabel, INTEGER_PRINT_FORMAT);
		frag.add(DataS, "%d");
		frag.add(DLabel, FLOAT_PRINT_FORMAT);
		frag.add(DataS, "%g");
		frag.add(DLabel, BOOLEAN_PRINT_FORMAT);
		frag.add(DataS, "%s");
		frag.add(DLabel, CHARACTER_PRINT_FORMAT);
		frag.add(DataS, "%c");
		frag.add(DLabel, STRING_PRINT_FORMAT);
		frag.add(DataS, "%s");
		frag.add(DLabel, NEWLINE_PRINT_FORMAT);
		frag.add(DataS, "\n");
		frag.add(DLabel, SEPARATOR_PRINT_FORMAT);
		frag.add(DataS, " ");
		frag.add(DLabel, OPEN_BRACKET_PRINT_FORMAT);
		frag.add(DataS, "[");
		frag.add(DLabel, CLOSE_BRACKET_PRINT_FORMAT);
		frag.add(DataS, "]");
		frag.add(DLabel, OPEN_PARENTHESE_PRINT_FORMAT);
		frag.add(DataS, "(");
		frag.add(DLabel, CLOSE_PARENTHESES_PRINT_FORMAT);
		frag.add(DataS, ")");
		frag.add(DLabel, COMMA_PRINT_FORMAT);
		frag.add(DataS, ",");
		frag.add(DLabel, BOOLEAN_TRUE_STRING);
		frag.add(DataS, "true");
		frag.add(DLabel, BOOLEAN_FALSE_STRING);
		frag.add(DataS, "false");
		
		return frag;
	}
	
	private ASMCodeFragment runtimeErrors() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		
		generalRuntimeError(frag);
		integerDivideByZeroError(frag);
		floatDivideByZeroError(frag);
		negativeArrayLengthError(frag);
		arrayIndexOutOfBoundsError(frag);
		
		return frag;
	}
	private ASMCodeFragment generalRuntimeError(ASMCodeFragment frag) {
		String generalErrorMessage = "$errors-general-message";

		frag.add(DLabel, generalErrorMessage);
		frag.add(DataS, "Runtime error: %s\n");
		
		frag.add(Label, GENERAL_RUNTIME_ERROR);
		frag.add(PushD, generalErrorMessage);
		frag.add(Printf);
		frag.add(Halt);
		return frag;
	}
	private void integerDivideByZeroError(ASMCodeFragment frag) {
		String intDivideByZeroMessage = "$errors-int-divide-by-zero";
		
		frag.add(DLabel, intDivideByZeroMessage);
		frag.add(DataS, "integer divide by zero");
		
		frag.add(Label, INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
		frag.add(PushD, intDivideByZeroMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}
	private void floatDivideByZeroError(ASMCodeFragment frag) {
		String floatDivideByZeroMessage = "$errors-float-divide-by-zero";
		
		frag.add(DLabel, floatDivideByZeroMessage);
		frag.add(DataS, "float divide by zero");
		
		frag.add(Label, FLOAT_DIVIDE_BY_ZERO_RUNTIME_ERROR);
		frag.add(PushD, floatDivideByZeroMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}
	private void negativeArrayLengthError(ASMCodeFragment frag) {
		String negativeArrayLengthMessage = "$errors-negative-array-length";
		
		frag.add(DLabel, negativeArrayLengthMessage);
		frag.add(DataS, "negative array length");
		
		frag.add(Label, NEGATIVE_ARRAY_LENGTH_RUNTIME_ERROR);
		frag.add(PushD, negativeArrayLengthMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}
	private void arrayIndexOutOfBoundsError(ASMCodeFragment frag) {
		String arrayIndexOutOfBoundsMessage = "$errors-array-index-out-of-bounds";
		
		frag.add(DLabel, arrayIndexOutOfBoundsMessage);
		frag.add(DataS, "array index out of bounds");
		
		frag.add(Label, ARRAY_INDEX_OUT_OF_BOUNDS);
		frag.add(PushD, arrayIndexOutOfBoundsMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}
	
	public static ASMCodeFragment getEnvironment() {
		RunTime rt = new RunTime();
		return rt.environmentASM();
	}
}
