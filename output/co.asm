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
        DataZ        80                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        PushI        3                         
        PushI        2                         
        PushI        1                         
        Label        -total-number-of-bytes-2  
        PushI        17                        
        PushI        12                        
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
        PushI        3                         
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
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        PushI        99                        
        PushI        98                        
        PushI        97                        
        Label        -total-number-of-bytes-6  
        PushI        17                        
        PushI        3                         
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
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-8      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
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
        StoreC                                 
        PushD        -array-pc-sys-var-5       
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-5       
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-5       
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-5       
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-5       
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-5       
        LoadI                                  
        PushI        20                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        PushF        0.300000                  
        PushF        0.200000                  
        PushF        0.100000                  
        Label        -total-number-of-bytes-10 
        PushI        17                        
        PushI        24                        
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
        PushI        0                         
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
        PushI        8                         
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
        StoreF                                 
        PushD        -array-pc-sys-var-9       
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-9       
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-9       
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-9       
        LoadI                                  
        PushI        41                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% d
        DLabel       -string-15                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        99                        %% "c"
        DataC        0                         
        PushD        -string-15                
        DLabel       -string-14                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        98                        %% "b"
        DataC        0                         
        PushD        -string-14                
        DLabel       -string-13                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        97                        %% "a"
        DataC        0                         
        PushD        -string-13                
        Label        -total-number-of-bytes-17 
        PushI        17                        
        PushI        12                        
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
        PushI        2                         
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
        PushI        3                         
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
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% e
        PushI        0                         
        PushI        1                         
        Label        -total-number-of-bytes-21 
        PushI        17                        
        PushI        2                         
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
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-23     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
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
        StoreC                                 
        PushD        -array-pc-sys-var-20      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-20      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-20      
        LoadI                                  
        PushI        19                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% aa
        PushI        6                         
        Label        -total-number-of-bytes-33 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-33 
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
        Label        -array-pc-sub-size-34     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-35     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-32      
        DataI        0                         
        PushD        -array-pc-sys-var-32      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-35    
        PushD        -array-pc-sys-var-32      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-32      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-32      
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushI        5                         
        PushI        4                         
        PushI        3                         
        Label        -total-number-of-bytes-29 
        PushI        17                        
        PushI        12                        
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
        PushI        0                         
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
        PushI        3                         
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
        PushI        29                        
        Subtract                               
        PushI        2                         
        PushI        1                         
        Label        -total-number-of-bytes-25 
        PushI        17                        
        PushI        8                         
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
        PushI        2                         
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
        PushI        25                        
        Subtract                               
        Label        -total-number-of-bytes-37 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-37 
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
        Label        -array-pc-sub-size-38     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-39     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-36      
        DataI        0                         
        PushD        -array-pc-sys-var-36      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-39    
        PushD        -array-pc-sys-var-36      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-36      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-36      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-36      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-36      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-36      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-36      
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% bb
        PushI        102                       
        Label        -total-number-of-bytes-49 
        PushI        17                        
        PushI        1                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-49 
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
        Label        -array-pc-sub-size-50     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-51     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-48      
        DataI        0                         
        PushD        -array-pc-sys-var-48      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-51    
        PushD        -array-pc-sys-var-48      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-48      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-48      
        LoadI                                  
        PushI        18                        
        Subtract                               
        PushI        101                       
        PushI        100                       
        PushI        99                        
        Label        -total-number-of-bytes-45 
        PushI        17                        
        PushI        3                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-45 
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
        Label        -array-pc-sub-size-46     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-47     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-44      
        DataI        0                         
        PushD        -array-pc-sys-var-44      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-47    
        PushD        -array-pc-sys-var-44      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-44      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-44      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-44      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-44      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-44      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-44      
        LoadI                                  
        PushI        20                        
        Subtract                               
        PushI        98                        
        PushI        97                        
        Label        -total-number-of-bytes-41 
        PushI        17                        
        PushI        2                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-41 
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
        Label        -array-pc-sub-size-42     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-43     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-40      
        DataI        0                         
        PushD        -array-pc-sys-var-40      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-43    
        PushD        -array-pc-sys-var-40      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-40      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-40      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-40      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-40      
        LoadI                                  
        PushI        19                        
        Subtract                               
        Label        -total-number-of-bytes-53 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-53 
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
        Label        -array-pc-sub-size-54     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-55     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-52      
        DataI        0                         
        PushD        -array-pc-sys-var-52      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-55    
        PushD        -array-pc-sys-var-52      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-52      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-52      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-52      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-52      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-52      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-52      
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% cc
        PushF        0.600000                  
        Label        -total-number-of-bytes-65 
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-65 
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
        Label        -array-pc-sub-size-66     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        8                         
        StoreI                                 
        Label        -array-pc-elem-len-67     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-64      
        DataI        0                         
        PushD        -array-pc-sys-var-64      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-67    
        PushD        -array-pc-sys-var-64      
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-64      
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-64      
        LoadI                                  
        PushI        25                        
        Subtract                               
        PushF        0.500000                  
        PushF        0.400000                  
        PushF        0.300000                  
        Label        -total-number-of-bytes-61 
        PushI        17                        
        PushI        24                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-61 
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
        Label        -array-pc-sub-size-62     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        8                         
        StoreI                                 
        Label        -array-pc-elem-len-63     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-60      
        DataI        0                         
        PushD        -array-pc-sys-var-60      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-63    
        PushD        -array-pc-sys-var-60      
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-60      
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-60      
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-60      
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-60      
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-60      
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-60      
        LoadI                                  
        PushI        41                        
        Subtract                               
        PushF        0.200000                  
        PushF        0.100000                  
        Label        -total-number-of-bytes-57 
        PushI        17                        
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-57 
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
        Label        -array-pc-sub-size-58     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        8                         
        StoreI                                 
        Label        -array-pc-elem-len-59     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-56      
        DataI        0                         
        PushD        -array-pc-sys-var-56      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-59    
        PushD        -array-pc-sys-var-56      
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-56      
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-56      
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-56      
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-56      
        LoadI                                  
        PushI        33                        
        Subtract                               
        Label        -total-number-of-bytes-69 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-69 
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
        Label        -array-pc-sub-size-70     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-71     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-68      
        DataI        0                         
        PushD        -array-pc-sys-var-68      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-71    
        PushD        -array-pc-sys-var-68      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-68      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-68      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-68      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-68      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-68      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-68      
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% dd
        DLabel       -string-85                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        102                       %% "f"
        DataC        0                         
        PushD        -string-85                
        Label        -total-number-of-bytes-87 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-87 
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
        Label        -array-pc-sub-size-88     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-89     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-86      
        DataI        0                         
        PushD        -array-pc-sys-var-86      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-89    
        PushD        -array-pc-sys-var-86      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-86      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-86      
        LoadI                                  
        PushI        21                        
        Subtract                               
        DLabel       -string-80                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        101                       %% "e"
        DataC        0                         
        PushD        -string-80                
        DLabel       -string-79                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        100                       %% "d"
        DataC        0                         
        PushD        -string-79                
        DLabel       -string-78                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        99                        %% "c"
        DataC        0                         
        PushD        -string-78                
        Label        -total-number-of-bytes-82 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-82 
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
        Label        -array-pc-sub-size-83     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-84     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-81      
        DataI        0                         
        PushD        -array-pc-sys-var-81      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-84    
        PushD        -array-pc-sys-var-81      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-81      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-81      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-81      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-81      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-81      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-81      
        LoadI                                  
        PushI        29                        
        Subtract                               
        DLabel       -string-73                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        98                        %% "b"
        DataC        0                         
        PushD        -string-73                
        DLabel       -string-72                
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        97                        %% "a"
        DataC        0                         
        PushD        -string-72                
        Label        -total-number-of-bytes-75 
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-75 
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
        Label        -array-pc-sub-size-76     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-77     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-74      
        DataI        0                         
        PushD        -array-pc-sys-var-74      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-77    
        PushD        -array-pc-sys-var-74      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-74      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-74      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-74      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-74      
        LoadI                                  
        PushI        25                        
        Subtract                               
        Label        -total-number-of-bytes-91 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-91 
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
        Label        -array-pc-sub-size-92     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-93     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-90      
        DataI        0                         
        PushD        -array-pc-sys-var-90      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-93    
        PushD        -array-pc-sys-var-90      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-90      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-90      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-90      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-90      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-90      
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-90      
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% ee
        PushI        0                         
        Label        -total-number-of-bytes-103 
        PushI        17                        
        PushI        1                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-103 
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
        Label        -array-pc-sub-size-104    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-105    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-102     
        DataI        0                         
        PushD        -array-pc-sys-var-102     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-105   
        PushD        -array-pc-sys-var-102     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-102     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-102     
        LoadI                                  
        PushI        18                        
        Subtract                               
        PushI        1                         
        PushI        0                         
        PushI        1                         
        Label        -total-number-of-bytes-99 
        PushI        17                        
        PushI        3                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-99 
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
        Label        -array-pc-sub-size-100    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-101    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-98      
        DataI        0                         
        PushD        -array-pc-sys-var-98      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-101   
        PushD        -array-pc-sys-var-98      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-98      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-98      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-98      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-98      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-98      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-98      
        LoadI                                  
        PushI        20                        
        Subtract                               
        PushI        0                         
        PushI        1                         
        Label        -total-number-of-bytes-95 
        PushI        17                        
        PushI        2                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-95 
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
        Label        -array-pc-sub-size-96     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-97     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-94      
        DataI        0                         
        PushD        -array-pc-sys-var-94      
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-97    
        PushD        -array-pc-sys-var-94      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-94      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-94      
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-94      
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-94      
        LoadI                                  
        PushI        19                        
        Subtract                               
        Label        -total-number-of-bytes-107 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-107 
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
        Label        -array-pc-sub-size-108    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-109    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-106     
        DataI        0                         
        PushD        -array-pc-sys-var-106     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-109   
        PushD        -array-pc-sys-var-106     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-106     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-106     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-106     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-106     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-106     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-106     
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% f
        Label        -array-copy-operation-110 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-110    
        DataI        0                         
        PushD        -array-co-sys-var1-110    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-110    
        DataI        0                         
        PushD        -array-co-sys-var2-110    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-110    
        DataI        0                         
        PushD        -array-co-sys-var3-110    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-111 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var2-110    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-112      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-110    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-110    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-110    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-110    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-110    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-110    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-110    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-110    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-110    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-110    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-112 
        PushD        -array-co-sys-var2-110    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-112 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-110    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-110    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-110    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-112 
        Label        -array-co-elem-copy-e-112 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var3-110    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% g
        Label        -array-copy-operation-113 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-113    
        DataI        0                         
        PushD        -array-co-sys-var1-113    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-113    
        DataI        0                         
        PushD        -array-co-sys-var2-113    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-113    
        DataI        0                         
        PushD        -array-co-sys-var3-113    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-114 
        PushI        17                        
        PushI        1                         
        PushD        -array-co-sys-var2-113    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-115      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-113    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-113    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-113    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-113    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-113    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-113    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-113    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-113    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-113    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-113    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-115 
        PushD        -array-co-sys-var2-113    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-115 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-113    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-113    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-113    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-115 
        Label        -array-co-elem-copy-e-115 
        PushI        17                        
        PushI        1                         
        PushD        -array-co-sys-var3-113    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% h
        Label        -array-copy-operation-116 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-116    
        DataI        0                         
        PushD        -array-co-sys-var1-116    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-116    
        DataI        0                         
        PushD        -array-co-sys-var2-116    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-116    
        DataI        0                         
        PushD        -array-co-sys-var3-116    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-117 
        PushI        17                        
        PushI        8                         
        PushD        -array-co-sys-var2-116    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-118      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-116    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-116    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-116    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-116    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-116    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-116    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-116    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-116    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-116    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-116    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-118 
        PushD        -array-co-sys-var2-116    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-118 
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-116    
        LoadI                                  
        LoadF                                  
        StoreF                                 
        PushD        -array-co-sys-var1-116    
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-116    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-118 
        Label        -array-co-elem-copy-e-118 
        PushI        17                        
        PushI        8                         
        PushD        -array-co-sys-var3-116    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% i
        Label        -array-copy-operation-119 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% d
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-119    
        DataI        0                         
        PushD        -array-co-sys-var1-119    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-119    
        DataI        0                         
        PushD        -array-co-sys-var2-119    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-119    
        DataI        0                         
        PushD        -array-co-sys-var3-119    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-120 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var2-119    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-121      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-119    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-119    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-119    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-119    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-119    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-119    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-119    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-119    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-119    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-119    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-121 
        PushD        -array-co-sys-var2-119    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-121 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-119    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-119    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-119    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-121 
        Label        -array-co-elem-copy-e-121 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var3-119    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% j
        Label        -array-copy-operation-122 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% e
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-122    
        DataI        0                         
        PushD        -array-co-sys-var1-122    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-122    
        DataI        0                         
        PushD        -array-co-sys-var2-122    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-122    
        DataI        0                         
        PushD        -array-co-sys-var3-122    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-123 
        PushI        17                        
        PushI        1                         
        PushD        -array-co-sys-var2-122    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-124      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-122    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-122    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-122    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-122    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-122    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-122    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-122    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-122    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-122    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-122    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-124 
        PushD        -array-co-sys-var2-122    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-124 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-122    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-122    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-122    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-124 
        Label        -array-co-elem-copy-e-124 
        PushI        17                        
        PushI        1                         
        PushD        -array-co-sys-var3-122    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% ff
        Label        -array-copy-operation-125 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% aa
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-125    
        DataI        0                         
        PushD        -array-co-sys-var1-125    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-125    
        DataI        0                         
        PushD        -array-co-sys-var2-125    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-125    
        DataI        0                         
        PushD        -array-co-sys-var3-125    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-126 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var2-125    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-127      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-125    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-125    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-125    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-125    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-125    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-125    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-125    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-125    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-125    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-125    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-127 
        PushD        -array-co-sys-var2-125    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-127 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-125    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-125    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-125    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-127 
        Label        -array-co-elem-copy-e-127 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var3-125    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        64                        
        Add                                    %% gg
        Label        -array-copy-operation-128 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% bb
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-128    
        DataI        0                         
        PushD        -array-co-sys-var1-128    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-128    
        DataI        0                         
        PushD        -array-co-sys-var2-128    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-128    
        DataI        0                         
        PushD        -array-co-sys-var3-128    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-129 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var2-128    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-130      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-128    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-128    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-128    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-128    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-128    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-128    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-128    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-128    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-128    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-128    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-130 
        PushD        -array-co-sys-var2-128    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-130 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-128    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-128    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-128    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-130 
        Label        -array-co-elem-copy-e-130 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var3-128    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        68                        
        Add                                    %% hh
        Label        -array-copy-operation-131 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% cc
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-131    
        DataI        0                         
        PushD        -array-co-sys-var1-131    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-131    
        DataI        0                         
        PushD        -array-co-sys-var2-131    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-131    
        DataI        0                         
        PushD        -array-co-sys-var3-131    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-132 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var2-131    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-133      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-131    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-131    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-131    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-131    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-131    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-131    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-131    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-131    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-131    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-131    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-133 
        PushD        -array-co-sys-var2-131    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-133 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-131    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-131    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-131    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-133 
        Label        -array-co-elem-copy-e-133 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var3-131    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        72                        
        Add                                    %% ii
        Label        -array-copy-operation-134 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% dd
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-134    
        DataI        0                         
        PushD        -array-co-sys-var1-134    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-134    
        DataI        0                         
        PushD        -array-co-sys-var2-134    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-134    
        DataI        0                         
        PushD        -array-co-sys-var3-134    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-135 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var2-134    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-136      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-134    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-134    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-134    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-134    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-134    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-134    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-134    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-134    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-134    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-134    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-136 
        PushD        -array-co-sys-var2-134    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-136 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-134    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-134    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-134    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-136 
        Label        -array-co-elem-copy-e-136 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var3-134    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        76                        
        Add                                    %% jj
        Label        -array-copy-operation-137 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% ee
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var1-137    
        DataI        0                         
        PushD        -array-co-sys-var1-137    
        Exchange                               
        StoreI                                 
        PushI        13                        
        Add                                    
        LoadI                                  
        Duplicate                              
        DLabel       -array-co-sys-var2-137    
        DataI        0                         
        PushD        -array-co-sys-var2-137    
        Exchange                               
        StoreI                                 
        DLabel       -array-co-sys-var3-137    
        DataI        0                         
        PushD        -array-co-sys-var3-137    
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-138 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var2-137    
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-co-header-139      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-137    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-137    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-137    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-137    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-137    
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        -array-co-sys-var1-137    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-137    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-137    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-137    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-137    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        Label        -array-co-elem-copy-s-139 
        PushD        -array-co-sys-var2-137    
        LoadI                                  
        JumpFalse    -array-co-elem-copy-e-139 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-co-sys-var1-137    
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        -array-co-sys-var1-137    
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-co-sys-var2-137    
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-co-elem-copy-s-139 
        Label        -array-co-elem-copy-e-139 
        PushI        17                        
        PushI        4                         
        PushD        -array-co-sys-var3-137    
        LoadI                                  
        Multiply                               
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% f
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-140 
        DataI        0                         
        PushD        -array-print-sys-var1-140 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-140 
        PushD        -array-print-sys-var1-140 
        LoadI                                  
        JumpFalse    -array-print-loop-end-140 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-140 
        PushD        -array-print-sys-var1-140 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-140 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-140 
        PushD        -array-print-sys-var1-140 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-140 
        Label        -array-print-loop-end-140 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% g
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-141 
        DataI        0                         
        PushD        -array-print-sys-var1-141 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-141 
        PushD        -array-print-sys-var1-141 
        LoadI                                  
        JumpFalse    -array-print-loop-end-141 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-141 
        PushD        -array-print-sys-var1-141 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-141 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-141 
        PushD        -array-print-sys-var1-141 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-141 
        Label        -array-print-loop-end-141 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% h
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-142 
        DataI        0                         
        PushD        -array-print-sys-var1-142 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-142 
        PushD        -array-print-sys-var1-142 
        LoadI                                  
        JumpFalse    -array-print-loop-end-142 
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-142 
        PushD        -array-print-sys-var1-142 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-142 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-142 
        PushD        -array-print-sys-var1-142 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-142 
        Label        -array-print-loop-end-142 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-143 
        DataI        0                         
        PushD        -array-print-sys-var1-143 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-143 
        PushD        -array-print-sys-var1-143 
        LoadI                                  
        JumpFalse    -array-print-loop-end-143 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format144 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-143 
        PushD        -array-print-sys-var1-143 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-143 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-143 
        PushD        -array-print-sys-var1-143 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-143 
        Label        -array-print-loop-end-143 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% j
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-145 
        DataI        0                         
        PushD        -array-print-sys-var1-145 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-145 
        PushD        -array-print-sys-var1-145 
        LoadI                                  
        JumpFalse    -array-print-loop-end-145 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true146    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join146    
        Label        -print-boolean-true146    
        PushD        $boolean-true-string      
        Label        -print-boolean-join146    
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-145 
        PushD        -array-print-sys-var1-145 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-145 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-145 
        PushD        -array-print-sys-var1-145 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-145 
        Label        -array-print-loop-end-145 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% ff
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-147 
        DataI        0                         
        PushD        -array-print-sys-var1-147 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-147 
        PushD        -array-print-sys-var1-147 
        LoadI                                  
        JumpFalse    -array-print-loop-end-147 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-148 
        DataI        0                         
        PushD        -array-print-sys-var1-148 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-148 
        PushD        -array-print-sys-var1-148 
        LoadI                                  
        JumpFalse    -array-print-loop-end-148 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-148 
        PushD        -array-print-sys-var1-148 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-148 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-148 
        PushD        -array-print-sys-var1-148 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-148 
        Label        -array-print-loop-end-148 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-147 
        PushD        -array-print-sys-var1-147 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-147 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-147 
        PushD        -array-print-sys-var1-147 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-147 
        Label        -array-print-loop-end-147 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        64                        
        Add                                    %% gg
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-149 
        DataI        0                         
        PushD        -array-print-sys-var1-149 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-149 
        PushD        -array-print-sys-var1-149 
        LoadI                                  
        JumpFalse    -array-print-loop-end-149 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-150 
        DataI        0                         
        PushD        -array-print-sys-var1-150 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-150 
        PushD        -array-print-sys-var1-150 
        LoadI                                  
        JumpFalse    -array-print-loop-end-150 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-150 
        PushD        -array-print-sys-var1-150 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-150 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-150 
        PushD        -array-print-sys-var1-150 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-150 
        Label        -array-print-loop-end-150 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-149 
        PushD        -array-print-sys-var1-149 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-149 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-149 
        PushD        -array-print-sys-var1-149 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-149 
        Label        -array-print-loop-end-149 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        68                        
        Add                                    %% hh
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-151 
        DataI        0                         
        PushD        -array-print-sys-var1-151 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-151 
        PushD        -array-print-sys-var1-151 
        LoadI                                  
        JumpFalse    -array-print-loop-end-151 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-152 
        DataI        0                         
        PushD        -array-print-sys-var1-152 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-152 
        PushD        -array-print-sys-var1-152 
        LoadI                                  
        JumpFalse    -array-print-loop-end-152 
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-152 
        PushD        -array-print-sys-var1-152 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-152 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-152 
        PushD        -array-print-sys-var1-152 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-152 
        Label        -array-print-loop-end-152 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-151 
        PushD        -array-print-sys-var1-151 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-151 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-151 
        PushD        -array-print-sys-var1-151 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-151 
        Label        -array-print-loop-end-151 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        72                        
        Add                                    %% ii
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-153 
        DataI        0                         
        PushD        -array-print-sys-var1-153 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-153 
        PushD        -array-print-sys-var1-153 
        LoadI                                  
        JumpFalse    -array-print-loop-end-153 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-154 
        DataI        0                         
        PushD        -array-print-sys-var1-154 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-154 
        PushD        -array-print-sys-var1-154 
        LoadI                                  
        JumpFalse    -array-print-loop-end-154 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format155 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-154 
        PushD        -array-print-sys-var1-154 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-154 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-154 
        PushD        -array-print-sys-var1-154 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-154 
        Label        -array-print-loop-end-154 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-153 
        PushD        -array-print-sys-var1-153 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-153 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-153 
        PushD        -array-print-sys-var1-153 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-153 
        Label        -array-print-loop-end-153 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        76                        
        Add                                    %% jj
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-156 
        DataI        0                         
        PushD        -array-print-sys-var1-156 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-156 
        PushD        -array-print-sys-var1-156 
        LoadI                                  
        JumpFalse    -array-print-loop-end-156 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-157 
        DataI        0                         
        PushD        -array-print-sys-var1-157 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-157 
        PushD        -array-print-sys-var1-157 
        LoadI                                  
        JumpFalse    -array-print-loop-end-157 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true158    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join158    
        Label        -print-boolean-true158    
        PushD        $boolean-true-string      
        Label        -print-boolean-join158    
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-157 
        PushD        -array-print-sys-var1-157 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-157 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-157 
        PushD        -array-print-sys-var1-157 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-157 
        Label        -array-print-loop-end-157 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-156 
        PushD        -array-print-sys-var1-156 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-156 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-156 
        PushD        -array-print-sys-var1-156 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-156 
        Label        -array-print-loop-end-156 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-159         
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% f
        LoadI                                  
        Label        -compare-arg2-159         
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Label        -compare-sub-159          
        Subtract                               
        JumpFalse    -compare-true-159         
        Jump         -compare-false-159        
        Label        -compare-true-159         
        PushI        1                         
        Jump         -compare-join-159         
        Label        -compare-false-159        
        PushI        0                         
        Jump         -compare-join-159         
        Label        -compare-join-159         
        JumpTrue     -print-boolean-true164    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join164    
        Label        -print-boolean-true164    
        PushD        $boolean-true-string      
        Label        -print-boolean-join164    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-160         
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% g
        LoadI                                  
        Label        -compare-arg2-160         
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        Label        -compare-sub-160          
        Subtract                               
        JumpFalse    -compare-true-160         
        Jump         -compare-false-160        
        Label        -compare-true-160         
        PushI        1                         
        Jump         -compare-join-160         
        Label        -compare-false-160        
        PushI        0                         
        Jump         -compare-join-160         
        Label        -compare-join-160         
        JumpTrue     -print-boolean-true165    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join165    
        Label        -print-boolean-true165    
        PushD        $boolean-true-string      
        Label        -print-boolean-join165    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-161         
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% h
        LoadI                                  
        Label        -compare-arg2-161         
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        Label        -compare-sub-161          
        Subtract                               
        JumpFalse    -compare-true-161         
        Jump         -compare-false-161        
        Label        -compare-true-161         
        PushI        1                         
        Jump         -compare-join-161         
        Label        -compare-false-161        
        PushI        0                         
        Jump         -compare-join-161         
        Label        -compare-join-161         
        JumpTrue     -print-boolean-true166    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join166    
        Label        -print-boolean-true166    
        PushD        $boolean-true-string      
        Label        -print-boolean-join166    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-162         
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% i
        LoadI                                  
        Label        -compare-arg2-162         
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% d
        LoadI                                  
        Label        -compare-sub-162          
        Subtract                               
        JumpFalse    -compare-true-162         
        Jump         -compare-false-162        
        Label        -compare-true-162         
        PushI        1                         
        Jump         -compare-join-162         
        Label        -compare-false-162        
        PushI        0                         
        Jump         -compare-join-162         
        Label        -compare-join-162         
        JumpTrue     -print-boolean-true167    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join167    
        Label        -print-boolean-true167    
        PushD        $boolean-true-string      
        Label        -print-boolean-join167    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-163         
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% j
        LoadI                                  
        Label        -compare-arg2-163         
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% e
        LoadI                                  
        Label        -compare-sub-163          
        Subtract                               
        JumpFalse    -compare-true-163         
        Jump         -compare-false-163        
        Label        -compare-true-163         
        PushI        1                         
        Jump         -compare-join-163         
        Label        -compare-false-163        
        PushI        0                         
        Jump         -compare-join-163         
        Label        -compare-join-163         
        JumpTrue     -print-boolean-true168    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join168    
        Label        -print-boolean-true168    
        PushD        $boolean-true-string      
        Label        -print-boolean-join168    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-169         
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% ff
        LoadI                                  
        Label        -compare-arg2-169         
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% aa
        LoadI                                  
        Label        -compare-sub-169          
        Subtract                               
        JumpFalse    -compare-true-169         
        Jump         -compare-false-169        
        Label        -compare-true-169         
        PushI        1                         
        Jump         -compare-join-169         
        Label        -compare-false-169        
        PushI        0                         
        Jump         -compare-join-169         
        Label        -compare-join-169         
        JumpTrue     -print-boolean-true174    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join174    
        Label        -print-boolean-true174    
        PushD        $boolean-true-string      
        Label        -print-boolean-join174    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-170         
        PushD        $global-memory-block      
        PushI        64                        
        Add                                    %% gg
        LoadI                                  
        Label        -compare-arg2-170         
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% bb
        LoadI                                  
        Label        -compare-sub-170          
        Subtract                               
        JumpFalse    -compare-true-170         
        Jump         -compare-false-170        
        Label        -compare-true-170         
        PushI        1                         
        Jump         -compare-join-170         
        Label        -compare-false-170        
        PushI        0                         
        Jump         -compare-join-170         
        Label        -compare-join-170         
        JumpTrue     -print-boolean-true175    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join175    
        Label        -print-boolean-true175    
        PushD        $boolean-true-string      
        Label        -print-boolean-join175    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-171         
        PushD        $global-memory-block      
        PushI        68                        
        Add                                    %% hh
        LoadI                                  
        Label        -compare-arg2-171         
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% cc
        LoadI                                  
        Label        -compare-sub-171          
        Subtract                               
        JumpFalse    -compare-true-171         
        Jump         -compare-false-171        
        Label        -compare-true-171         
        PushI        1                         
        Jump         -compare-join-171         
        Label        -compare-false-171        
        PushI        0                         
        Jump         -compare-join-171         
        Label        -compare-join-171         
        JumpTrue     -print-boolean-true176    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join176    
        Label        -print-boolean-true176    
        PushD        $boolean-true-string      
        Label        -print-boolean-join176    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-172         
        PushD        $global-memory-block      
        PushI        72                        
        Add                                    %% ii
        LoadI                                  
        Label        -compare-arg2-172         
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% dd
        LoadI                                  
        Label        -compare-sub-172          
        Subtract                               
        JumpFalse    -compare-true-172         
        Jump         -compare-false-172        
        Label        -compare-true-172         
        PushI        1                         
        Jump         -compare-join-172         
        Label        -compare-false-172        
        PushI        0                         
        Jump         -compare-join-172         
        Label        -compare-join-172         
        JumpTrue     -print-boolean-true177    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join177    
        Label        -print-boolean-true177    
        PushD        $boolean-true-string      
        Label        -print-boolean-join177    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-arg1-173         
        PushD        $global-memory-block      
        PushI        76                        
        Add                                    %% jj
        LoadI                                  
        Label        -compare-arg2-173         
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% ee
        LoadI                                  
        Label        -compare-sub-173          
        Subtract                               
        JumpFalse    -compare-true-173         
        Jump         -compare-false-173        
        Label        -compare-true-173         
        PushI        1                         
        Jump         -compare-join-173         
        Label        -compare-false-173        
        PushI        0                         
        Jump         -compare-join-173         
        Label        -compare-join-173         
        JumpTrue     -print-boolean-true178    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join178    
        Label        -print-boolean-true178    
        PushD        $boolean-true-string      
        Label        -print-boolean-join178    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
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
