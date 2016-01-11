        Label        -mem-manager-initialize   
        DLabel       $heap-start-ptr           
        DataZ        4                         
        DLabel       $heap-after-ptr           
        DataZ        4                         
        DLabel       $heap-first-free          
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
        PushI        1000                      
        StoreI                                 
        DLabel       $stack-pointer            
        DataI        0                         
        PushD        $stack-pointer            
        PushI        1000                      
        StoreI                                 
        Jump         $$main                    
        DLabel       $eat-location-zero        
        DataZ        8                         
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
        DataZ        8                         
        Label        $$main                    
        Jump         -main-start-              
        Label        -main-start-              
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        PushI        10                        
        PushI        9                         
        PushI        8                         
        PushI        7                         
        PushI        6                         
        PushI        5                         
        PushI        4                         
        PushI        3                         
        PushI        2                         
        PushI        1                         
        PushI        0                         
        Label        -total-number-of-bytes-3  
        PushI        17                        
        PushI        44                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-3 
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
        Label        -array-pc-sub-size-4      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-5      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        11                        
        StoreI                                 
        DLabel       -array-pc-sys-var-2       
        DataI        0                         
        PushD        -array-pc-sys-var-2       
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-5     
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-2       
        LoadI                                  
        PushI        61                        
        Subtract                               
        Label        -for-statement-start-10   
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -for-loop-sys-var1-10     
        DataI        0                         
        PushD        -for-loop-sys-var1-10     
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        0                         
        StoreI                                 
        Label        -for-loop-start-10        
        Duplicate                              
        LoadI                                  
        PushD        -for-loop-sys-var1-10     
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpFalse    -for-loop-end-1           
        Label        -compare-arg1-6           
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-6           
        PushI        5                         
        Label        -compare-sub-6            
        Subtract                               
        JumpNeg      -compare-true-6           
        Jump         -compare-false-6          
        Label        -compare-true-6           
        PushI        1                         
        Jump         -compare-join-6           
        Label        -compare-false-6          
        PushI        0                         
        Jump         -compare-join-6           
        Label        -compare-join-6           
        Label        -if-cond-7                
        JumpFalse    -if-false-7               
        Jump         -for-loop-continue-1      
        Label        -if-false-7               
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -compare-arg1-8           
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-8           
        PushI        10                        
        Label        -compare-sub-8            
        Subtract                               
        JumpFalse    -compare-true-8           
        Jump         -compare-false-8          
        Label        -compare-true-8           
        PushI        1                         
        Jump         -compare-join-8           
        Label        -compare-false-8          
        PushI        0                         
        Jump         -compare-join-8           
        Label        -compare-join-8           
        Label        -if-cond-9                
        JumpFalse    -if-false-9               
        Jump         -for-loop-end-1           
        Label        -if-false-9               
        Label        -for-loop-continue-1      
        Duplicate                              
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -for-loop-start-10        
        Label        -for-loop-end-1           
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        PushI        9                         
        PushI        8                         
        PushI        7                         
        PushI        6                         
        Label        -total-number-of-bytes-25 
        PushI        17                        
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-25 
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
        Label        -array-pc-sub-size-26     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-27     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        DLabel       -array-pc-sys-var-24      
        DataI        0                         
        PushD        -array-pc-sys-var-24      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-27    
        PushD        -array-pc-sys-var-24      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-24      
        LoadI                                  
        PushI        33                        
        Subtract                               
        PushI        5                         
        PushI        4                         
        PushI        3                         
        Label        -total-number-of-bytes-21 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-21 
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
        Label        -array-pc-sub-size-22     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-23     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-20      
        DataI        0                         
        PushD        -array-pc-sys-var-20      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-23    
        PushD        -array-pc-sys-var-20      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        LoadI                                  
        PushI        29                        
        Subtract                               
        PushI        2                         
        PushI        1                         
        Label        -total-number-of-bytes-17 
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-17 
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
        Label        -array-pc-sub-size-18     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-19     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-16      
        DataI        0                         
        PushD        -array-pc-sys-var-16      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-19    
        PushD        -array-pc-sys-var-16      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-16      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-16      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-16      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-16      
        LoadI                                  
        PushI        25                        
        Subtract                               
        PushI        0                         
        Label        -total-number-of-bytes-13 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-13 
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
        Label        -array-pc-sub-size-14     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-15     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-12      
        DataI        0                         
        PushD        -array-pc-sys-var-12      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-15    
        PushD        -array-pc-sys-var-12      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-12      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-12      
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-29 
        PushI        17                        
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-29 
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
        Label        -array-pc-sub-size-30     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-31     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        DLabel       -array-pc-sys-var-28      
        DataI        0                         
        PushD        -array-pc-sys-var-28      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-31    
        PushD        -array-pc-sys-var-28      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-28      
        LoadI                                  
        PushI        33                        
        Subtract                               
        Label        -for-statement-start-37   
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -for-loop-sys-var1-37     
        DataI        0                         
        PushD        -for-loop-sys-var1-37     
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        DLabel       -for-loop-sys-var2-37     
        DataI        0                         
        PushD        -for-loop-sys-var2-37     
        Exchange                               
        StoreI                                 
        PushI        0                         
        DLabel       -for-loop-sys-var3-37     
        DataI        0                         
        PushD        -for-loop-sys-var3-37     
        Exchange                               
        StoreI                                 
        Label        -for-loop-start-37        
        PushD        -for-loop-sys-var3-37     
        LoadI                                  
        PushD        -for-loop-sys-var1-37     
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpFalse    -for-loop-end-11          
        Duplicate                              
        PushD        -for-loop-sys-var2-37     
        LoadI                                  
        LoadI                                  
        StoreI                                 
        Label        -compare-arg1-32          
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        Label        -compare-arg2-32          
        PushI        2                         
        Label        -compare-sub-32           
        Subtract                               
        JumpNeg      -compare-true-32          
        Jump         -compare-false-32         
        Label        -compare-true-32          
        PushI        1                         
        Jump         -compare-join-32          
        Label        -compare-false-32         
        PushI        0                         
        Jump         -compare-join-32          
        Label        -compare-join-32          
        Label        -if-cond-33               
        JumpFalse    -if-false-33              
        Jump         -for-loop-continue-11     
        Label        -if-false-33              
        Label        -compare-arg1-34          
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushI        13                        
        Add                                    
        LoadI                                  
        Label        -compare-arg2-34          
        PushI        4                         
        Label        -compare-sub-34           
        Subtract                               
        JumpFalse    -compare-true-34          
        Jump         -compare-false-34         
        Label        -compare-true-34          
        PushI        1                         
        Jump         -compare-join-34          
        Label        -compare-false-34         
        PushI        0                         
        Jump         -compare-join-34          
        Label        -compare-join-34          
        Label        -if-cond-35               
        JumpFalse    -if-false-35              
        Jump         -for-loop-end-11          
        Label        -if-false-35              
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-36  
        DataI        0                         
        PushD        -array-print-sys-var1-36  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-36 
        PushD        -array-print-sys-var1-36  
        LoadI                                  
        JumpFalse    -array-print-loop-end-36  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-36 
        PushD        -array-print-sys-var1-36  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-36 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-36 
        PushD        -array-print-sys-var1-36  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-36 
        Label        -array-print-loop-end-36  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-separator   
        Printf                                 
        Label        -for-loop-continue-11     
        PushD        -for-loop-sys-var2-37     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -for-loop-sys-var3-37     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -for-loop-start-37        
        Label        -for-loop-end-11          
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        PushI        -1                        
        StoreI                                 
        Label        -for-loop-start-43        
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Label        -compare-arg1-39          
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-39          
        PushI        5                         
        Label        -compare-sub-39           
        Subtract                               
        JumpNeg      -compare-true-39          
        Jump         -compare-false-39         
        Label        -compare-true-39          
        PushI        1                         
        Jump         -compare-join-39          
        Label        -compare-false-39         
        PushI        0                         
        Jump         -compare-join-39          
        Label        -compare-join-39          
        Label        -if-cond-40               
        JumpFalse    -if-false-40              
        Jump         -for-loop-continue-38     
        Label        -if-false-40              
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -compare-arg1-41          
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-41          
        PushI        10                        
        Label        -compare-sub-41           
        Subtract                               
        JumpFalse    -compare-true-41          
        Jump         -compare-false-41         
        Label        -compare-true-41          
        PushI        1                         
        Jump         -compare-join-41          
        Label        -compare-false-41         
        PushI        0                         
        Jump         -compare-join-41          
        Label        -compare-join-41          
        Label        -if-cond-42               
        JumpFalse    -if-false-42              
        Jump         -for-loop-end-38          
        Label        -if-false-42              
        Label        -for-loop-continue-38     
        Jump         -for-loop-start-43        
        Label        -for-loop-end-38          
        PushD        $print-format-newline     
        Printf                                 
        PushI        -1                        
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushI        10                        
        DLabel       -for-loop-sys-var2-49     
        DataI        0                         
        PushD        -for-loop-sys-var2-49     
        Exchange                               
        StoreI                                 
        Pop                                    
        Exchange                               
        DLabel       -for-loop-sys-var1-49     
        DataI        0                         
        PushD        -for-loop-sys-var1-49     
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        -for-loop-sys-var1-49     
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Label        -for-loop-start-49        
        Duplicate                              
        LoadI                                  
        PushD        -for-loop-sys-var2-49     
        LoadI                                  
        Subtract                               
        JumpNeg      -for-loop-true-49         
        Jump         -for-loop-false-49        
        Label        -for-loop-true-49         
        PushI        1                         
        Jump         -for-loop-join-49         
        Label        -for-loop-false-49        
        PushI        0                         
        Jump         -for-loop-join-49         
        Label        -for-loop-join-49         
        JumpFalse    -for-loop-end-44          
        Label        -compare-arg1-45          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-45          
        PushI        5                         
        Label        -compare-sub-45           
        Subtract                               
        JumpNeg      -compare-true-45          
        Jump         -compare-false-45         
        Label        -compare-true-45          
        PushI        1                         
        Jump         -compare-join-45          
        Label        -compare-false-45         
        PushI        0                         
        Jump         -compare-join-45          
        Label        -compare-join-45          
        Label        -if-cond-46               
        JumpFalse    -if-false-46              
        Jump         -for-loop-continue-44     
        Label        -if-false-46              
        Label        -compare-arg1-47          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-47          
        PushI        8                         
        Label        -compare-sub-47           
        Subtract                               
        JumpFalse    -compare-true-47          
        Jump         -compare-false-47         
        Label        -compare-true-47          
        PushI        1                         
        Jump         -compare-join-47          
        Label        -compare-false-47         
        PushI        0                         
        Jump         -compare-join-47          
        Label        -compare-join-47          
        Label        -if-cond-48               
        JumpFalse    -if-false-48              
        Jump         -for-loop-end-44          
        Label        -if-false-48              
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -for-loop-continue-44     
        Duplicate                              
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -for-loop-start-49        
        Label        -for-loop-end-44          
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushI        0                         
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushI        9                         
        DLabel       -for-loop-sys-var2-55     
        DataI        0                         
        PushD        -for-loop-sys-var2-55     
        Exchange                               
        StoreI                                 
        Pop                                    
        Exchange                               
        DLabel       -for-loop-sys-var1-55     
        DataI        0                         
        PushD        -for-loop-sys-var1-55     
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        -for-loop-sys-var1-55     
        LoadI                                  
        StoreI                                 
        Label        -for-loop-start-55        
        Duplicate                              
        LoadI                                  
        PushD        -for-loop-sys-var2-55     
        LoadI                                  
        Subtract                               
        JumpPos      -for-loop-false-55        
        Jump         -for-loop-true-55         
        Label        -for-loop-true-55         
        PushI        1                         
        Jump         -for-loop-join-55         
        Label        -for-loop-false-55        
        PushI        0                         
        Jump         -for-loop-join-55         
        Label        -for-loop-join-55         
        JumpFalse    -for-loop-end-50          
        Label        -compare-arg1-51          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-51          
        PushI        5                         
        Label        -compare-sub-51           
        Subtract                               
        JumpNeg      -compare-true-51          
        Jump         -compare-false-51         
        Label        -compare-true-51          
        PushI        1                         
        Jump         -compare-join-51          
        Label        -compare-false-51         
        PushI        0                         
        Jump         -compare-join-51          
        Label        -compare-join-51          
        Label        -if-cond-52               
        JumpFalse    -if-false-52              
        Jump         -for-loop-continue-50     
        Label        -if-false-52              
        Label        -compare-arg1-53          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-53          
        PushI        8                         
        Label        -compare-sub-53           
        Subtract                               
        JumpFalse    -compare-true-53          
        Jump         -compare-false-53         
        Label        -compare-true-53          
        PushI        1                         
        Jump         -compare-join-53          
        Label        -compare-false-53         
        PushI        0                         
        Jump         -compare-join-53          
        Label        -compare-join-53          
        Label        -if-cond-54               
        JumpFalse    -if-false-54              
        Jump         -for-loop-end-50          
        Label        -if-false-54              
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -for-loop-continue-50     
        Duplicate                              
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -for-loop-start-55        
        Label        -for-loop-end-50          
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        PushI        5                         
        StoreI                                 
        Label        -while-loop-start-56      
        Label        -compare-arg1-57          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        Label        -compare-arg2-57          
        PushI        10                        
        Label        -compare-sub-57           
        Subtract                               
        JumpNeg      -compare-true-57          
        Jump         -compare-false-57         
        Label        -compare-true-57          
        PushI        1                         
        Jump         -compare-join-57          
        Label        -compare-false-57         
        PushI        0                         
        Jump         -compare-join-57          
        Label        -compare-join-57          
        JumpFalse    -while-loop-end-56        
        Label        -compare-arg1-58          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        Label        -compare-arg2-58          
        PushI        8                         
        Label        -compare-sub-58           
        Subtract                               
        JumpFalse    -compare-true-58          
        Jump         -compare-false-58         
        Label        -compare-true-58          
        PushI        1                         
        Jump         -compare-join-58          
        Label        -compare-false-58         
        PushI        0                         
        Jump         -compare-join-58          
        Label        -compare-join-58          
        Label        -if-cond-59               
        JumpFalse    -if-false-59              
        Jump         -while-loop-end-56        
        Label        -if-false-59              
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -while-loop-start-56      
        Label        -while-loop-end-56        
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        PushI        0                         
        StoreI                                 
        Label        -while-loop-start-60      
        Label        -compare-arg1-61          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        Label        -compare-arg2-61          
        PushI        10                        
        Label        -compare-sub-61           
        Subtract                               
        JumpNeg      -compare-true-61          
        Jump         -compare-false-61         
        Label        -compare-true-61          
        PushI        1                         
        Jump         -compare-join-61          
        Label        -compare-false-61         
        PushI        0                         
        Jump         -compare-join-61          
        Label        -compare-join-61          
        JumpFalse    -while-loop-end-60        
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Label        -compare-arg1-62          
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        Label        -compare-arg2-62          
        PushI        5                         
        Label        -compare-sub-62           
        Subtract                               
        JumpPos      -compare-true-62          
        Jump         -compare-false-62         
        Label        -compare-true-62          
        PushI        1                         
        Jump         -compare-join-62          
        Label        -compare-false-62         
        PushI        0                         
        Jump         -compare-join-62          
        Label        -compare-join-62          
        Label        -if-cond-63               
        JumpFalse    -if-false-63              
        Jump         -while-loop-start-60      
        Jump         -if-else-63               
        Label        -if-false-63              
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -if-else-63               
        Jump         -while-loop-start-60      
        Label        -while-loop-end-60        
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
        DLabel       $heap-memory              
