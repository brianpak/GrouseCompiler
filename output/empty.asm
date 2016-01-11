        Label        -mem-manager-initialize   
        DLabel       $heap-start-ptr           
        DataZ        4                         
        DLabel       $heap-after-ptr           
        DataZ        4                         
        DLabel       $heap-first-free          
        DataZ        4                         
        DLabel       $heap-next-record-num     
        DataZ        4                         
        DLabel       $mmgr-newblock-block      
        DataZ        4                         
        DLabel       $mmgr-newblock-size       
        DataZ        4                         
        PushD        $heap-memory              
        Duplicate                              
        PushD        $heap-start-ptr           
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        DLabel       $frame-pointer            
        DataI        0                         
        PushD        $frame-pointer            
        Memtop                                 
        StoreI                                 
        DLabel       $stack-pointer            
        DataI        0                         
        PushD        $stack-pointer            
        Memtop                                 
        StoreI                                 
        Jump         $$main                    
        DLabel       $eat-location-zero        
        DataZ        8                         
        DLabel       $print-format-null        
        DataC        110                       %% "null"
        DataC        117                       
        DataC        108                       
        DataC        108                       
        DataC        0                         
        DLabel       $print-format-integer     
        DataC        37                        %% "%d"
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-float       
        DataC        37                        %% "%g"
        DataC        103                       
        DataC        0                         
        DLabel       $print-format-boolean     
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-character   
        DataC        37                        %% "%c"
        DataC        99                        
        DataC        0                         
        DLabel       $print-format-string      
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-newline     
        DataC        10                        %% "\n"
        DataC        0                         
        DLabel       $print-format-separator   
        DataC        32                        %% " "
        DataC        0                         
        DLabel       $print-format-open-bracket 
        DataC        91                        %% "["
        DataC        0                         
        DLabel       $print-format-close-bracket 
        DataC        93                        %% "]"
        DataC        0                         
        DLabel       $print-format-open-parentheses 
        DataC        40                        %% "("
        DataC        0                         
        DLabel       $print-format-close-parentheses 
        DataC        41                        %% ")"
        DataC        0                         
        DLabel       $print-format-comma-      
        DataC        44                        %% ","
        DataC        0                         
        DLabel       $boolean-true-string      
        DataC        116                       %% "true"
        DataC        114                       
        DataC        117                       
        DataC        101                       
        DataC        0                         
        DLabel       $boolean-false-string     
        DataC        102                       %% "false"
        DataC        97                        
        DataC        108                       
        DataC        115                       
        DataC        101                       
        DataC        0                         
        DLabel       $errors-general-message   
        DataC        82                        %% "Runtime error: %s\n"
        DataC        117                       
        DataC        110                       
        DataC        116                       
        DataC        105                       
        DataC        109                       
        DataC        101                       
        DataC        32                        
        DataC        101                       
        DataC        114                       
        DataC        114                       
        DataC        111                       
        DataC        114                       
        DataC        58                        
        DataC        32                        
        DataC        37                        
        DataC        115                       
        DataC        10                        
        DataC        0                         
        Label        $$general-runtime-error   
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        DLabel       $errors-int-divide-by-zero 
        DataC        105                       %% "integer divide by zero"
        DataC        110                       
        DataC        116                       
        DataC        101                       
        DataC        103                       
        DataC        101                       
        DataC        114                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        Label        $$i-divide-by-zero        
        PushD        $errors-int-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-float-divide-by-zero 
        DataC        102                       %% "float divide by zero"
        DataC        108                       
        DataC        111                       
        DataC        97                        
        DataC        116                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        Label        $$f-divide-by-zero        
        PushD        $errors-float-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-negative-array-length 
        DataC        110                       %% "negative array length"
        DataC        101                       
        DataC        103                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        108                       
        DataC        101                       
        DataC        110                       
        DataC        103                       
        DataC        116                       
        DataC        104                       
        DataC        0                         
        Label        $$negative-array-length   
        PushD        $errors-negative-array-length 
        Jump         $$general-runtime-error   
        DLabel       $errors-array-index-out-of-bounds 
        DataC        97                        %% "array index out of bounds"
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        105                       
        DataC        110                       
        DataC        100                       
        DataC        101                       
        DataC        120                       
        DataC        32                        
        DataC        111                       
        DataC        117                       
        DataC        116                       
        DataC        32                        
        DataC        111                       
        DataC        102                       
        DataC        32                        
        DataC        98                        
        DataC        111                       
        DataC        117                       
        DataC        110                       
        DataC        100                       
        DataC        115                       
        DataC        0                         
        Label        $$array-index-out-of-bounds 
        PushD        $errors-array-index-out-of-bounds 
        Jump         $$general-runtime-error   
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        28                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        PushI        0                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        PushI        0                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arr
        PushI        4                         
        PushI        3                         
        Label        -total-number-of-bytes-6  
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-6 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Label        -array-pc-sub-size-7      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-8      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-5       
        DataI        0                         
        PushD        -array-pc-sys-var-5       
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-8     
        PushD        -array-pc-sys-var-5       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-5       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-5       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-5       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-5       
        LoadI                                  
        PushI        25                        
        Subtract                               
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushI        2                         
        PushI        1                         
        Label        -total-number-of-bytes-2  
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-2 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Label        -array-pc-sub-size-3      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-4      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-1       
        DataI        0                         
        PushD        -array-pc-sys-var-1       
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-4     
        PushD        -array-pc-sys-var-1       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-1       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-1       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-1       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-1       
        LoadI                                  
        PushI        25                        
        Subtract                               
        Label        -total-number-of-bytes-10 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-10 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Label        -array-pc-sub-size-11     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-12     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-9       
        DataI        0                         
        PushD        -array-pc-sys-var-9       
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-12    
        PushD        -array-pc-sys-var-9       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% arr
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-13  
        DataI        0                         
        PushD        -array-print-sys-var1-13  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-13 
        PushD        -array-print-sys-var1-13  
        LoadI                                  
        JumpFalse    -array-print-loop-end-13  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Duplicate                              
        JumpTrue     -array-print-null-check-13 
        Pop                                    
        PushD        $print-format-null        
        Printf                                 
        Jump         -array-print-null-catch-13 
        Label        -array-print-null-check-13 
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-14  
        DataI        0                         
        PushD        -array-print-sys-var1-14  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-14 
        PushD        -array-print-sys-var1-14  
        LoadI                                  
        JumpFalse    -array-print-loop-end-14  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-null-catch-14 
        Label        -array-print-separate-start-14 
        PushD        -array-print-sys-var1-14  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-14 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-14 
        PushD        -array-print-sys-var1-14  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-14 
        Label        -array-print-loop-end-14  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-null-catch-13 
        Label        -array-print-separate-start-13 
        PushD        -array-print-sys-var1-13  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-13 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-13 
        PushD        -array-print-sys-var1-13  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-13 
        Label        -array-print-loop-end-13  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        JumpTrue     -length-op-null-check-12  
        Pop                                    
        PushI        -1                        
        Jump         -length-op-null-catch-12  
        Label        -length-op-null-check-12  
        PushI        13                        
        Add                                    
        LoadI                                  
        Label        -length-op-null-catch-12  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% arr2
        PushI        3                         
        PushI        2                         
        PushI        1                         
        Label        -total-number-of-bytes-16 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-16 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Label        -array-pc-sub-size-17     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-18     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-15      
        DataI        0                         
        PushD        -array-pc-sys-var-15      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-18    
        PushD        -array-pc-sys-var-15      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-15      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-15      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-15      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-15      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-15      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-15      
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% arr3
        PushI        6                         
        PushI        5                         
        PushI        4                         
        Label        -total-number-of-bytes-20 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-20 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Label        -array-pc-sub-size-21     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-22     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-19      
        DataI        0                         
        PushD        -array-pc-sys-var-19      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-22    
        PushD        -array-pc-sys-var-19      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-19      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-19      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-19      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-19      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-19      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-19      
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% arr4
        PushI        9                         
        PushI        8                         
        PushI        7                         
        Label        -total-number-of-bytes-24 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-24 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Label        -array-pc-sub-size-25     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-26     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-23      
        DataI        0                         
        PushD        -array-pc-sys-var-23      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-26    
        PushD        -array-pc-sys-var-23      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-23      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-23      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-23      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-23      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-23      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-23      
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% c
        Label        -array-concatenation-27   
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% arr2
        LoadI                                  
        Duplicate                              
        JumpTrue     -runtime-err-aco-127      
        Jump         $$general-runtime-error   
        Label        -runtime-err-aco-127      
        DLabel       -sysvar1-for-array-conc-27 
        DataI        0                         
        PushD        -sysvar1-for-array-conc-27 
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% arr3
        LoadI                                  
        Duplicate                              
        JumpTrue     -runtime-err-aco-2-27     
        Jump         $$general-runtime-error   
        Label        -runtime-err-aco-2-27     
        DLabel       -sysvar2-for-array-conc-27 
        DataI        0                         
        PushD        -sysvar2-for-array-conc-27 
        Exchange                               
        StoreI                                 
        PushI        0                         
        DLabel       -sysvar3-for-array-conc-27 
        DataI        0                         
        PushD        -sysvar3-for-array-conc-27 
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-28 
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        Add                                    
        StoreI                                 
        Label        -arrayConc-arg-start1-27  
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        Subtract                               
        JumpFalse    -arrayConc-arg-done1-27   
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        17                        
        Add                                    
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        LoadI                                  
        StoreI                                 
        PushD        -sysvar3-for-array-conc-27 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -arrayConc-arg-start1-27  
        Label        -arrayConc-arg-done1-27   
        PushD        -sysvar3-for-array-conc-27 
        PushI        0                         
        StoreI                                 
        Label        -arrayConc-arg-start2-27  
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        Subtract                               
        JumpFalse    -arrayConc-arg-done2-27   
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        17                        
        Add                                    
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        LoadI                                  
        StoreI                                 
        PushD        -sysvar3-for-array-conc-27 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -arrayConc-arg-start2-27  
        Label        -arrayConc-arg-done2-27   
        PushI        17                        
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        Add                                    
        Subtract                               
        PushD        -sysvar1-for-array-conc-27 
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% arr4
        LoadI                                  
        Duplicate                              
        JumpTrue     -runtime-err-aco-3-27     
        Jump         $$general-runtime-error   
        Label        -runtime-err-aco-3-27     
        PushD        -sysvar2-for-array-conc-27 
        Exchange                               
        StoreI                                 
        PushD        -sysvar3-for-array-conc-27 
        PushI        0                         
        StoreI                                 
        Label        -total-number-of-bytes-29 
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        9                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        Add                                    
        StoreI                                 
        Label        -arrayConc-arg-start3-281 
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        Subtract                               
        JumpFalse    -arrayConc-arg-done3-281  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        17                        
        Add                                    
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        LoadI                                  
        StoreI                                 
        PushD        -sysvar3-for-array-conc-27 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -arrayConc-arg-start3-281 
        Label        -arrayConc-arg-done3-281  
        PushD        -sysvar3-for-array-conc-27 
        PushI        0                         
        StoreI                                 
        Label        -arrayConc-arg-start4-282 
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        Subtract                               
        JumpFalse    -arrayConc-arg-done4-282  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        17                        
        Add                                    
        PushD        -sysvar3-for-array-conc-27 
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        LoadI                                  
        StoreI                                 
        PushD        -sysvar3-for-array-conc-27 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -arrayConc-arg-start4-282 
        Label        -arrayConc-arg-done4-282  
        PushI        17                        
        PushD        -sysvar1-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushD        -sysvar2-for-array-conc-27 
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% c
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-30  
        DataI        0                         
        PushD        -array-print-sys-var1-30  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-30 
        PushD        -array-print-sys-var1-30  
        LoadI                                  
        JumpFalse    -array-print-loop-end-30  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-null-catch-30 
        Label        -array-print-separate-start-30 
        PushD        -array-print-sys-var1-30  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-30 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-30 
        PushD        -array-print-sys-var1-30  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-30 
        Label        -array-print-loop-end-30  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
        Label        -mem-manager-make-tags    
        DLabel       $mmgr-tags-size           
        DataZ        4                         
        DLabel       $mmgr-tags-start          
        DataZ        4                         
        DLabel       $mmgr-tags-available      
        DataZ        4                         
        DLabel       $mmgr-tags-nextptr        
        DataZ        4                         
        DLabel       $mmgr-tags-prevptr        
        DataZ        4                         
        DLabel       $mmgr-tags-return         
        DataZ        4                         
        PushD        $mmgr-tags-return         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-size           
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-start          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-available      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-nextptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-nextptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-return         
        LoadI                                  
        Return                                 
        Label        -mem-manager-one-tag      
        DLabel       $mmgr-onetag-return       
        DataZ        4                         
        DLabel       $mmgr-onetag-location     
        DataZ        4                         
        DLabel       $mmgr-onetag-available    
        DataZ        4                         
        DLabel       $mmgr-onetag-size         
        DataZ        4                         
        DLabel       $mmgr-onetag-pointer      
        DataZ        4                         
        PushD        $mmgr-onetag-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-onetag-return       
        LoadI                                  
        Return                                 
        Label        -mem-manager-allocate     
        DLabel       $mmgr-alloc-return        
        DataZ        4                         
        DLabel       $mmgr-alloc-size          
        DataZ        4                         
        DLabel       $mmgr-alloc-current-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-size 
        DataZ        4                         
        PushD        $mmgr-alloc-return        
        Exchange                               
        StoreI                                 
        PushI        18                        
        Add                                    
        PushI        4                         
        Add                                    
        PushD        $mmgr-alloc-size          
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-process-current 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    -mmgr-alloc-no-block-works 
        Label        -mmgr-alloc-test-block    
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        1                         
        Add                                    
        JumpPos      -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Jump         -mmgr-alloc-process-current 
        Label        -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Call         -mem-manager-remove-block 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        26                        
        Subtract                               
        JumpNeg      -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Add                                    
        PushD        $mmgr-alloc-remainder-block 
        Exchange                               
        StoreI                                 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        PushD        $mmgr-alloc-remainder-size 
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushI        0                         
        PushI        0                         
        PushI        1                         
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushD        $mmgr-alloc-remainder-size 
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        Call         -mem-manager-deallocate   
        Jump         -mmgr-alloc-return-userblock 
        Label        -mmgr-alloc-no-block-works 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-newblock-size       
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        LoadI                                  
        PushD        $mmgr-newblock-block      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-newblock-size       
        LoadI                                  
        PushD        $heap-after-ptr           
        LoadI                                  
        Add                                    
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-newblock-size       
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        Duplicate                              
        PushD        $heap-next-record-num     
        LoadI                                  
        StoreI                                 
        PushI        1                         
        PushD        $heap-next-record-num     
        LoadI                                  
        Add                                    
        PushD        $heap-next-record-num     
        Exchange                               
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        -mem-manager-deallocate   
        DLabel       $mmgr-dealloc-return      
        DataZ        4                         
        DLabel       $mmgr-dealloc-block       
        DataZ        4                         
        PushD        $mmgr-dealloc-return      
        Exchange                               
        StoreI                                 
        PushI        4                         
        Subtract                               
        PushI        9                         
        Subtract                               
        PushD        $mmgr-dealloc-block       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-dealloc-return      
        LoadI                                  
        Return                                 
        Label        -mem-manager-remove-block 
        DLabel       $mmgr-remove-return       
        DataZ        4                         
        DLabel       $mmgr-remove-block        
        DataZ        4                         
        DLabel       $mmgr-remove-prev         
        DataZ        4                         
        DLabel       $mmgr-remove-next         
        DataZ        4                         
        PushD        $mmgr-remove-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-prev         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-next         
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-prev 
        PushD        $mmgr-remove-prev         
        LoadI                                  
        JumpFalse    -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $mmgr-remove-prev         
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         -mmgr-remove-process-next 
        Label        -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-next 
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    -mmgr-remove-done         
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-done         
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
        Label        -mem-manager-get-id       
        Exchange                               
        PushI        4                         
        Subtract                               
        LoadI                                  
        Exchange                               
        Return                                 
        DLabel       -$mmgr-diag-jump-table    
        DataD        -$mmgr-diag-test-0        
        DataD        -$mmgr-diag-test-1        
        DataD        -$mmgr-diag-test-2        
        DataD        -$mmgr-diag-test-3        
        DataD        -$mmgr-diag-test-4        
        DLabel       $mmgr-diag-return         
        DataZ        4                         
        Label        -mem-manager-diagnostics  
        PushD        $mmgr-diag-return         
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        PushD        -$mmgr-diag-jump-table    
        Add                                    
        LoadI                                  
        JumpV                                  
        Label        -$mmgr-diag-end           
        PushD        $mmgr-diag-return         
        LoadI                                  
        Return                                 
        Label        -$mmgr-diag-test-0        
        Jump         -$mmgr-diag-end           
        Label        -$mmgr-diag-test-1        
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Jump         -$mmgr-diag-end           
        Label        -$mmgr-diag-test-2        
        Duplicate                              
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadC                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        9                         
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Jump         -$mmgr-diag-end           
        Label        -$mmgr-diag-test-3        
        Duplicate                              
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadC                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        9                         
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Pop                                    
        Jump         -$mmgr-diag-end           
        Label        -$mmgr-diag-test-4        
        Pop                                    
        Pop                                    
        Pop                                    
        Jump         -$mmgr-diag-end           
        DLabel       mmgr-stringPrintFormat    
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $heap-memory              
