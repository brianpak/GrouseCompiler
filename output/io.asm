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
        DataZ        40                        
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
        PushI        20                        
        Add                                    %% aa
        LoadI                                  
        PushI        2                         
        DLabel       -array-io-sys-var-110     
        DataI        0                         
        PushD        -array-io-sys-var-110     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-110     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-110     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-110 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-110 
        PushD        -array-io-sys-var-110     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% bb
        LoadI                                  
        PushI        2                         
        DLabel       -array-io-sys-var-111     
        DataI        0                         
        PushD        -array-io-sys-var-111     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-111     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-111     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-111 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-111 
        PushD        -array-io-sys-var-111     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% cc
        LoadI                                  
        PushI        2                         
        DLabel       -array-io-sys-var-112     
        DataI        0                         
        PushD        -array-io-sys-var-112     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-112     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-112     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-112 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-112 
        PushD        -array-io-sys-var-112     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% dd
        LoadI                                  
        PushI        2                         
        DLabel       -array-io-sys-var-113     
        DataI        0                         
        PushD        -array-io-sys-var-113     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-113     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-113     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-113 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-113 
        PushD        -array-io-sys-var-113     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% d
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% ee
        LoadI                                  
        PushI        2                         
        DLabel       -array-io-sys-var-114     
        DataI        0                         
        PushD        -array-io-sys-var-114     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-114     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-114     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-114 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-114 
        PushD        -array-io-sys-var-114     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% e
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% aa
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-115 
        DataI        0                         
        PushD        -array-print-sys-var1-115 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-115 
        PushD        -array-print-sys-var1-115 
        LoadI                                  
        JumpFalse    -array-print-loop-end-115 
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
        DLabel       -array-print-sys-var1-116 
        DataI        0                         
        PushD        -array-print-sys-var1-116 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-116 
        PushD        -array-print-sys-var1-116 
        LoadI                                  
        JumpFalse    -array-print-loop-end-116 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-116 
        PushD        -array-print-sys-var1-116 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-116 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-116 
        PushD        -array-print-sys-var1-116 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-116 
        Label        -array-print-loop-end-116 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-115 
        PushD        -array-print-sys-var1-115 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-115 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-115 
        PushD        -array-print-sys-var1-115 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-115 
        Label        -array-print-loop-end-115 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% bb
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-117 
        DataI        0                         
        PushD        -array-print-sys-var1-117 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-117 
        PushD        -array-print-sys-var1-117 
        LoadI                                  
        JumpFalse    -array-print-loop-end-117 
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
        DLabel       -array-print-sys-var1-118 
        DataI        0                         
        PushD        -array-print-sys-var1-118 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-118 
        PushD        -array-print-sys-var1-118 
        LoadI                                  
        JumpFalse    -array-print-loop-end-118 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-118 
        PushD        -array-print-sys-var1-118 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-118 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-118 
        PushD        -array-print-sys-var1-118 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-118 
        Label        -array-print-loop-end-118 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-117 
        PushD        -array-print-sys-var1-117 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-117 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-117 
        PushD        -array-print-sys-var1-117 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-117 
        Label        -array-print-loop-end-117 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% cc
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-119 
        DataI        0                         
        PushD        -array-print-sys-var1-119 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-119 
        PushD        -array-print-sys-var1-119 
        LoadI                                  
        JumpFalse    -array-print-loop-end-119 
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
        DLabel       -array-print-sys-var1-120 
        DataI        0                         
        PushD        -array-print-sys-var1-120 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-120 
        PushD        -array-print-sys-var1-120 
        LoadI                                  
        JumpFalse    -array-print-loop-end-120 
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-120 
        PushD        -array-print-sys-var1-120 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-120 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-120 
        PushD        -array-print-sys-var1-120 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-120 
        Label        -array-print-loop-end-120 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-119 
        PushD        -array-print-sys-var1-119 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-119 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-119 
        PushD        -array-print-sys-var1-119 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-119 
        Label        -array-print-loop-end-119 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% dd
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-121 
        DataI        0                         
        PushD        -array-print-sys-var1-121 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-121 
        PushD        -array-print-sys-var1-121 
        LoadI                                  
        JumpFalse    -array-print-loop-end-121 
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
        DLabel       -array-print-sys-var1-122 
        DataI        0                         
        PushD        -array-print-sys-var1-122 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-122 
        PushD        -array-print-sys-var1-122 
        LoadI                                  
        JumpFalse    -array-print-loop-end-122 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format123 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-122 
        PushD        -array-print-sys-var1-122 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-122 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-122 
        PushD        -array-print-sys-var1-122 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-122 
        Label        -array-print-loop-end-122 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-121 
        PushD        -array-print-sys-var1-121 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-121 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-121 
        PushD        -array-print-sys-var1-121 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-121 
        Label        -array-print-loop-end-121 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% ee
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-124 
        DataI        0                         
        PushD        -array-print-sys-var1-124 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-124 
        PushD        -array-print-sys-var1-124 
        LoadI                                  
        JumpFalse    -array-print-loop-end-124 
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
        DLabel       -array-print-sys-var1-125 
        DataI        0                         
        PushD        -array-print-sys-var1-125 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-125 
        PushD        -array-print-sys-var1-125 
        LoadI                                  
        JumpFalse    -array-print-loop-end-125 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true126    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join126    
        Label        -print-boolean-true126    
        PushD        $boolean-true-string      
        Label        -print-boolean-join126    
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-125 
        PushD        -array-print-sys-var1-125 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-125 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-125 
        PushD        -array-print-sys-var1-125 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-125 
        Label        -array-print-loop-end-125 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-124 
        PushD        -array-print-sys-var1-124 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-124 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-124 
        PushD        -array-print-sys-var1-124 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-124 
        Label        -array-print-loop-end-124 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
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
