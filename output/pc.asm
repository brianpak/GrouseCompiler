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
        DLabel       $print-format-array-separator 
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
        DataZ        64                        
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
        Add                                    %% aaa
        PushI        6                         
        Label        -total-number-of-bytes-127 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-127 
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
        Label        -array-pc-sub-size-128    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-129    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-126     
        DataI        0                         
        PushD        -array-pc-sys-var-126     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-129   
        PushD        -array-pc-sys-var-126     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-126     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-126     
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-131 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-131 
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
        Label        -array-pc-sub-size-132    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-133    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-130     
        DataI        0                         
        PushD        -array-pc-sys-var-130     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-133   
        PushD        -array-pc-sys-var-130     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-130     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-130     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushI        5                         
        PushI        4                         
        PushI        3                         
        Label        -total-number-of-bytes-119 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-119 
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
        Label        -array-pc-sub-size-120    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-121    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-118     
        DataI        0                         
        PushD        -array-pc-sys-var-118     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-121   
        PushD        -array-pc-sys-var-118     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-118     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-118     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-118     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-118     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-118     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-118     
        LoadI                                  
        PushI        29                        
        Subtract                               
        Label        -total-number-of-bytes-123 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-123 
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
        Label        -array-pc-sub-size-124    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-125    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-122     
        DataI        0                         
        PushD        -array-pc-sys-var-122     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-125   
        PushD        -array-pc-sys-var-122     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-122     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-122     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushI        2                         
        PushI        1                         
        Label        -total-number-of-bytes-111 
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-111 
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
        Label        -array-pc-sub-size-112    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-113    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-110     
        DataI        0                         
        PushD        -array-pc-sys-var-110     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-113   
        PushD        -array-pc-sys-var-110     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-110     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-110     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-110     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-110     
        LoadI                                  
        PushI        25                        
        Subtract                               
        Label        -total-number-of-bytes-115 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-115 
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
        Label        -array-pc-sub-size-116    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-117    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-114     
        DataI        0                         
        PushD        -array-pc-sys-var-114     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-117   
        PushD        -array-pc-sys-var-114     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-114     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-114     
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-135 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-135 
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
        Label        -array-pc-sub-size-136    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-137    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-134     
        DataI        0                         
        PushD        -array-pc-sys-var-134     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-137   
        PushD        -array-pc-sys-var-134     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-134     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-134     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-134     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-134     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-134     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-134     
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% bbb
        PushI        102                       
        Label        -total-number-of-bytes-155 
        PushI        17                        
        PushI        1                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-155 
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
        Label        -array-pc-sub-size-156    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-157    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-154     
        DataI        0                         
        PushD        -array-pc-sys-var-154     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-157   
        PushD        -array-pc-sys-var-154     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-154     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-154     
        LoadI                                  
        PushI        18                        
        Subtract                               
        Label        -total-number-of-bytes-159 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-159 
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
        Label        -array-pc-sub-size-160    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-161    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-158     
        DataI        0                         
        PushD        -array-pc-sys-var-158     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-161   
        PushD        -array-pc-sys-var-158     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-158     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-158     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushI        101                       
        PushI        100                       
        PushI        99                        
        Label        -total-number-of-bytes-147 
        PushI        17                        
        PushI        3                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-147 
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
        Label        -array-pc-sub-size-148    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-149    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-146     
        DataI        0                         
        PushD        -array-pc-sys-var-146     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-149   
        PushD        -array-pc-sys-var-146     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-146     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-146     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-146     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-146     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-146     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-146     
        LoadI                                  
        PushI        20                        
        Subtract                               
        Label        -total-number-of-bytes-151 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-151 
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
        Label        -array-pc-sub-size-152    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-153    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-150     
        DataI        0                         
        PushD        -array-pc-sys-var-150     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-153   
        PushD        -array-pc-sys-var-150     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-150     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-150     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushI        98                        
        PushI        97                        
        Label        -total-number-of-bytes-139 
        PushI        17                        
        PushI        2                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-139 
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
        Label        -array-pc-sub-size-140    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-141    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-138     
        DataI        0                         
        PushD        -array-pc-sys-var-138     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-141   
        PushD        -array-pc-sys-var-138     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-138     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-138     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-138     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-138     
        LoadI                                  
        PushI        19                        
        Subtract                               
        Label        -total-number-of-bytes-143 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-143 
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
        Label        -array-pc-sub-size-144    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-145    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-142     
        DataI        0                         
        PushD        -array-pc-sys-var-142     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-145   
        PushD        -array-pc-sys-var-142     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-142     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-142     
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-163 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-163 
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
        Label        -array-pc-sub-size-164    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-165    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-162     
        DataI        0                         
        PushD        -array-pc-sys-var-162     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-165   
        PushD        -array-pc-sys-var-162     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-162     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-162     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-162     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-162     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-162     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-162     
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% ccc
        PushF        0.600000                  
        Label        -total-number-of-bytes-183 
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-183 
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
        Label        -array-pc-sub-size-184    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        8                         
        StoreI                                 
        Label        -array-pc-elem-len-185    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-182     
        DataI        0                         
        PushD        -array-pc-sys-var-182     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-185   
        PushD        -array-pc-sys-var-182     
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-182     
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-182     
        LoadI                                  
        PushI        25                        
        Subtract                               
        Label        -total-number-of-bytes-187 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-187 
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
        Label        -array-pc-sub-size-188    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-189    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-186     
        DataI        0                         
        PushD        -array-pc-sys-var-186     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-189   
        PushD        -array-pc-sys-var-186     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-186     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-186     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushF        0.500000                  
        PushF        0.400000                  
        PushF        0.300000                  
        Label        -total-number-of-bytes-175 
        PushI        17                        
        PushI        24                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-175 
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
        Label        -array-pc-sub-size-176    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        8                         
        StoreI                                 
        Label        -array-pc-elem-len-177    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-174     
        DataI        0                         
        PushD        -array-pc-sys-var-174     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-177   
        PushD        -array-pc-sys-var-174     
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-174     
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-174     
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-174     
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-174     
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-174     
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-174     
        LoadI                                  
        PushI        41                        
        Subtract                               
        Label        -total-number-of-bytes-179 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-179 
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
        Label        -array-pc-sub-size-180    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-181    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-178     
        DataI        0                         
        PushD        -array-pc-sys-var-178     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-181   
        PushD        -array-pc-sys-var-178     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-178     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-178     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushF        0.200000                  
        PushF        0.100000                  
        Label        -total-number-of-bytes-167 
        PushI        17                        
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-167 
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
        Label        -array-pc-sub-size-168    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        8                         
        StoreI                                 
        Label        -array-pc-elem-len-169    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-166     
        DataI        0                         
        PushD        -array-pc-sys-var-166     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-169   
        PushD        -array-pc-sys-var-166     
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-166     
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-166     
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        -array-pc-sys-var-166     
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-166     
        LoadI                                  
        PushI        33                        
        Subtract                               
        Label        -total-number-of-bytes-171 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-171 
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
        Label        -array-pc-sub-size-172    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-173    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-170     
        DataI        0                         
        PushD        -array-pc-sys-var-170     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-173   
        PushD        -array-pc-sys-var-170     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-170     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-170     
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-191 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-191 
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
        Label        -array-pc-sub-size-192    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-193    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-190     
        DataI        0                         
        PushD        -array-pc-sys-var-190     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-193   
        PushD        -array-pc-sys-var-190     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-190     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-190     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-190     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-190     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-190     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-190     
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% ddd
        DLabel       -string-215               
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        102                       %% "f"
        DataC        0                         
        PushD        -string-215               
        Label        -total-number-of-bytes-217 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-217 
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
        Label        -array-pc-sub-size-218    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-219    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-216     
        DataI        0                         
        PushD        -array-pc-sys-var-216     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-219   
        PushD        -array-pc-sys-var-216     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-216     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-216     
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-221 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-221 
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
        Label        -array-pc-sub-size-222    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-223    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-220     
        DataI        0                         
        PushD        -array-pc-sys-var-220     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-223   
        PushD        -array-pc-sys-var-220     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-220     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-220     
        LoadI                                  
        PushI        21                        
        Subtract                               
        DLabel       -string-206               
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        101                       %% "e"
        DataC        0                         
        PushD        -string-206               
        DLabel       -string-205               
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        100                       %% "d"
        DataC        0                         
        PushD        -string-205               
        DLabel       -string-204               
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        99                        %% "c"
        DataC        0                         
        PushD        -string-204               
        Label        -total-number-of-bytes-208 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-208 
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
        Label        -array-pc-sub-size-209    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-210    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-207     
        DataI        0                         
        PushD        -array-pc-sys-var-207     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-210   
        PushD        -array-pc-sys-var-207     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-207     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-207     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-207     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-207     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-207     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-207     
        LoadI                                  
        PushI        29                        
        Subtract                               
        Label        -total-number-of-bytes-212 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-212 
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
        Label        -array-pc-sub-size-213    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-214    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-211     
        DataI        0                         
        PushD        -array-pc-sys-var-211     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-214   
        PushD        -array-pc-sys-var-211     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-211     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-211     
        LoadI                                  
        PushI        21                        
        Subtract                               
        DLabel       -string-195               
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        98                        %% "b"
        DataC        0                         
        PushD        -string-195               
        DLabel       -string-194               
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        97                        %% "a"
        DataC        0                         
        PushD        -string-194               
        Label        -total-number-of-bytes-197 
        PushI        17                        
        PushI        8                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-197 
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
        Label        -array-pc-sub-size-198    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-199    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-196     
        DataI        0                         
        PushD        -array-pc-sys-var-196     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-199   
        PushD        -array-pc-sys-var-196     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-196     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-196     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-196     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-196     
        LoadI                                  
        PushI        25                        
        Subtract                               
        Label        -total-number-of-bytes-201 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-201 
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
        Label        -array-pc-sub-size-202    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-203    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-200     
        DataI        0                         
        PushD        -array-pc-sys-var-200     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-203   
        PushD        -array-pc-sys-var-200     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-200     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-200     
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-225 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-225 
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
        Label        -array-pc-sub-size-226    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-227    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-224     
        DataI        0                         
        PushD        -array-pc-sys-var-224     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-227   
        PushD        -array-pc-sys-var-224     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-224     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-224     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-224     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-224     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-224     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-224     
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% eee
        PushI        1                         
        Label        -total-number-of-bytes-245 
        PushI        17                        
        PushI        1                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-245 
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
        Label        -array-pc-sub-size-246    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-247    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-244     
        DataI        0                         
        PushD        -array-pc-sys-var-244     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-247   
        PushD        -array-pc-sys-var-244     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-244     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-244     
        LoadI                                  
        PushI        18                        
        Subtract                               
        Label        -total-number-of-bytes-249 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-249 
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
        Label        -array-pc-sub-size-250    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-251    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-248     
        DataI        0                         
        PushD        -array-pc-sys-var-248     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-251   
        PushD        -array-pc-sys-var-248     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-248     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-248     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushI        1                         
        PushI        0                         
        PushI        1                         
        Label        -total-number-of-bytes-237 
        PushI        17                        
        PushI        3                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-237 
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
        Label        -array-pc-sub-size-238    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-239    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-236     
        DataI        0                         
        PushD        -array-pc-sys-var-236     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-239   
        PushD        -array-pc-sys-var-236     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-236     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-236     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-236     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-236     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-236     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-236     
        LoadI                                  
        PushI        20                        
        Subtract                               
        Label        -total-number-of-bytes-241 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-241 
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
        Label        -array-pc-sub-size-242    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-243    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-240     
        DataI        0                         
        PushD        -array-pc-sys-var-240     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-243   
        PushD        -array-pc-sys-var-240     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-240     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-240     
        LoadI                                  
        PushI        21                        
        Subtract                               
        PushI        0                         
        PushI        1                         
        Label        -total-number-of-bytes-229 
        PushI        17                        
        PushI        2                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-229 
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
        Label        -array-pc-sub-size-230    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-pc-elem-len-231    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        2                         
        StoreI                                 
        DLabel       -array-pc-sys-var-228     
        DataI        0                         
        PushD        -array-pc-sys-var-228     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-231   
        PushD        -array-pc-sys-var-228     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-228     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-228     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -array-pc-sys-var-228     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-228     
        LoadI                                  
        PushI        19                        
        Subtract                               
        Label        -total-number-of-bytes-233 
        PushI        17                        
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-233 
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
        Label        -array-pc-sub-size-234    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-235    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        DLabel       -array-pc-sys-var-232     
        DataI        0                         
        PushD        -array-pc-sys-var-232     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-235   
        PushD        -array-pc-sys-var-232     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-232     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-232     
        LoadI                                  
        PushI        21                        
        Subtract                               
        Label        -total-number-of-bytes-253 
        PushI        17                        
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-populated-creation-253 
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
        Label        -array-pc-sub-size-254    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-pc-elem-len-255    
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        3                         
        StoreI                                 
        DLabel       -array-pc-sys-var-252     
        DataI        0                         
        PushD        -array-pc-sys-var-252     
        Exchange                               
        StoreI                                 
        Label        -array-pc-arg-start-255   
        PushD        -array-pc-sys-var-252     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-252     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-252     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-252     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-252     
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -array-pc-sys-var-252     
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -array-pc-sys-var-252     
        LoadI                                  
        PushI        29                        
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-256 
        DataI        0                         
        PushD        -array-print-sys-var1-256 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-256 
        PushD        -array-print-sys-var1-256 
        LoadI                                  
        JumpFalse    -array-print-loop-end-256 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-256 
        PushD        -array-print-sys-var1-256 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-256 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-256 
        PushD        -array-print-sys-var1-256 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-256 
        Label        -array-print-loop-end-256 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-257 
        DataI        0                         
        PushD        -array-print-sys-var1-257 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-257 
        PushD        -array-print-sys-var1-257 
        LoadI                                  
        JumpFalse    -array-print-loop-end-257 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-257 
        PushD        -array-print-sys-var1-257 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-257 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-257 
        PushD        -array-print-sys-var1-257 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-257 
        Label        -array-print-loop-end-257 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-258 
        DataI        0                         
        PushD        -array-print-sys-var1-258 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-258 
        PushD        -array-print-sys-var1-258 
        LoadI                                  
        JumpFalse    -array-print-loop-end-258 
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-258 
        PushD        -array-print-sys-var1-258 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-258 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-258 
        PushD        -array-print-sys-var1-258 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-258 
        Label        -array-print-loop-end-258 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% d
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-259 
        DataI        0                         
        PushD        -array-print-sys-var1-259 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-259 
        PushD        -array-print-sys-var1-259 
        LoadI                                  
        JumpFalse    -array-print-loop-end-259 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format260 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-259 
        PushD        -array-print-sys-var1-259 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-259 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-259 
        PushD        -array-print-sys-var1-259 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-259 
        Label        -array-print-loop-end-259 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% e
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-261 
        DataI        0                         
        PushD        -array-print-sys-var1-261 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-261 
        PushD        -array-print-sys-var1-261 
        LoadI                                  
        JumpFalse    -array-print-loop-end-261 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true262    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join262    
        Label        -print-boolean-true262    
        PushD        $boolean-true-string      
        Label        -print-boolean-join262    
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-261 
        PushD        -array-print-sys-var1-261 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-261 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-261 
        PushD        -array-print-sys-var1-261 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-261 
        Label        -array-print-loop-end-261 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
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
        DLabel       -array-print-sys-var1-263 
        DataI        0                         
        PushD        -array-print-sys-var1-263 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-263 
        PushD        -array-print-sys-var1-263 
        LoadI                                  
        JumpFalse    -array-print-loop-end-263 
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
        DLabel       -array-print-sys-var1-264 
        DataI        0                         
        PushD        -array-print-sys-var1-264 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-264 
        PushD        -array-print-sys-var1-264 
        LoadI                                  
        JumpFalse    -array-print-loop-end-264 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-264 
        PushD        -array-print-sys-var1-264 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-264 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-264 
        PushD        -array-print-sys-var1-264 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-264 
        Label        -array-print-loop-end-264 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-263 
        PushD        -array-print-sys-var1-263 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-263 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-263 
        PushD        -array-print-sys-var1-263 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-263 
        Label        -array-print-loop-end-263 
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
        DLabel       -array-print-sys-var1-265 
        DataI        0                         
        PushD        -array-print-sys-var1-265 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-265 
        PushD        -array-print-sys-var1-265 
        LoadI                                  
        JumpFalse    -array-print-loop-end-265 
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
        DLabel       -array-print-sys-var1-266 
        DataI        0                         
        PushD        -array-print-sys-var1-266 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-266 
        PushD        -array-print-sys-var1-266 
        LoadI                                  
        JumpFalse    -array-print-loop-end-266 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-266 
        PushD        -array-print-sys-var1-266 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-266 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-266 
        PushD        -array-print-sys-var1-266 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-266 
        Label        -array-print-loop-end-266 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-265 
        PushD        -array-print-sys-var1-265 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-265 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-265 
        PushD        -array-print-sys-var1-265 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-265 
        Label        -array-print-loop-end-265 
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
        DLabel       -array-print-sys-var1-267 
        DataI        0                         
        PushD        -array-print-sys-var1-267 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-267 
        PushD        -array-print-sys-var1-267 
        LoadI                                  
        JumpFalse    -array-print-loop-end-267 
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
        DLabel       -array-print-sys-var1-268 
        DataI        0                         
        PushD        -array-print-sys-var1-268 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-268 
        PushD        -array-print-sys-var1-268 
        LoadI                                  
        JumpFalse    -array-print-loop-end-268 
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-268 
        PushD        -array-print-sys-var1-268 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-268 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-268 
        PushD        -array-print-sys-var1-268 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-268 
        Label        -array-print-loop-end-268 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-267 
        PushD        -array-print-sys-var1-267 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-267 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-267 
        PushD        -array-print-sys-var1-267 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-267 
        Label        -array-print-loop-end-267 
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
        DLabel       -array-print-sys-var1-269 
        DataI        0                         
        PushD        -array-print-sys-var1-269 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-269 
        PushD        -array-print-sys-var1-269 
        LoadI                                  
        JumpFalse    -array-print-loop-end-269 
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
        DLabel       -array-print-sys-var1-270 
        DataI        0                         
        PushD        -array-print-sys-var1-270 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-270 
        PushD        -array-print-sys-var1-270 
        LoadI                                  
        JumpFalse    -array-print-loop-end-270 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format271 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-270 
        PushD        -array-print-sys-var1-270 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-270 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-270 
        PushD        -array-print-sys-var1-270 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-270 
        Label        -array-print-loop-end-270 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-269 
        PushD        -array-print-sys-var1-269 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-269 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-269 
        PushD        -array-print-sys-var1-269 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-269 
        Label        -array-print-loop-end-269 
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
        DLabel       -array-print-sys-var1-272 
        DataI        0                         
        PushD        -array-print-sys-var1-272 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-272 
        PushD        -array-print-sys-var1-272 
        LoadI                                  
        JumpFalse    -array-print-loop-end-272 
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
        DLabel       -array-print-sys-var1-273 
        DataI        0                         
        PushD        -array-print-sys-var1-273 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-273 
        PushD        -array-print-sys-var1-273 
        LoadI                                  
        JumpFalse    -array-print-loop-end-273 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true274    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join274    
        Label        -print-boolean-true274    
        PushD        $boolean-true-string      
        Label        -print-boolean-join274    
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-273 
        PushD        -array-print-sys-var1-273 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-273 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-273 
        PushD        -array-print-sys-var1-273 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-273 
        Label        -array-print-loop-end-273 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-272 
        PushD        -array-print-sys-var1-272 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-272 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-272 
        PushD        -array-print-sys-var1-272 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-272 
        Label        -array-print-loop-end-272 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Label        -for-statement-start-292  
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -for-loop-sys-var1-292    
        DataI        0                         
        PushD        -for-loop-sys-var1-292    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        0                         
        StoreI                                 
        Label        -for-loop-start-292       
        Duplicate                              
        LoadI                                  
        PushD        -for-loop-sys-var1-292    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpFalse    -for-loop-end-275         
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% aaa
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% i
        LoadI                                  
        DLabel       -array-io-sys-var-276     
        DataI        0                         
        PushD        -array-io-sys-var-276     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-276     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-276     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-276 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-276 
        PushD        -array-io-sys-var-276     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-277     
        DataI        0                         
        PushD        -array-io-sys-var-277     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-277     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-277     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-277 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-277 
        PushD        -array-io-sys-var-277     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-278     
        DataI        0                         
        PushD        -array-io-sys-var-278     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-278     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-278     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-278 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-278 
        PushD        -array-io-sys-var-278     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushI        100                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% bbb
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% i
        LoadI                                  
        DLabel       -array-io-sys-var-279     
        DataI        0                         
        PushD        -array-io-sys-var-279     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-279     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-279     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-279 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-279 
        PushD        -array-io-sys-var-279     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-280     
        DataI        0                         
        PushD        -array-io-sys-var-280     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-280     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-280     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-280 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-280 
        PushD        -array-io-sys-var-280     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-281     
        DataI        0                         
        PushD        -array-io-sys-var-281     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-281     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-281     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-281 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-281 
        PushD        -array-io-sys-var-281     
        LoadI                                  
        PushI        1                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushI        122                       
        StoreC                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% ccc
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% i
        LoadI                                  
        DLabel       -array-io-sys-var-282     
        DataI        0                         
        PushD        -array-io-sys-var-282     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-282     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-282     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-282 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-282 
        PushD        -array-io-sys-var-282     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-283     
        DataI        0                         
        PushD        -array-io-sys-var-283     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-283     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-283     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-283 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-283 
        PushD        -array-io-sys-var-283     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-284     
        DataI        0                         
        PushD        -array-io-sys-var-284     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-284     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-284     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-284 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-284 
        PushD        -array-io-sys-var-284     
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushF        100.500000                
        StoreF                                 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% ddd
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% i
        LoadI                                  
        DLabel       -array-io-sys-var-285     
        DataI        0                         
        PushD        -array-io-sys-var-285     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-285     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-285     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-285 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-285 
        PushD        -array-io-sys-var-285     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-286     
        DataI        0                         
        PushD        -array-io-sys-var-286     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-286     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-286     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-286 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-286 
        PushD        -array-io-sys-var-286     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-287     
        DataI        0                         
        PushD        -array-io-sys-var-287     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-287     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-287     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-287 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-287 
        PushD        -array-io-sys-var-287     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        DLabel       -string-288               
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        1                         
        DataC        122                       %% "z"
        DataC        0                         
        PushD        -string-288               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% eee
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% i
        LoadI                                  
        DLabel       -array-io-sys-var-289     
        DataI        0                         
        PushD        -array-io-sys-var-289     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-289     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-289     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-289 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-289 
        PushD        -array-io-sys-var-289     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-290     
        DataI        0                         
        PushD        -array-io-sys-var-290     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-290     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-290     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-290 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-290 
        PushD        -array-io-sys-var-290     
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        LoadI                                  
        PushI        0                         
        DLabel       -array-io-sys-var-291     
        DataI        0                         
        PushD        -array-io-sys-var-291     
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-291     
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-291     
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-291 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-291 
        PushD        -array-io-sys-var-291     
        LoadI                                  
        PushI        1                         
        Multiply                               
        Add                                    
        PushI        17                        
        Add                                    
        PushI        0                         
        StoreC                                 
        Label        -for-loop-continue-275    
        Duplicate                              
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -for-loop-start-292       
        Label        -for-loop-end-275         
        Pop                                    
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% aaa
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-293 
        DataI        0                         
        PushD        -array-print-sys-var1-293 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-293 
        PushD        -array-print-sys-var1-293 
        LoadI                                  
        JumpFalse    -array-print-loop-end-293 
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
        DLabel       -array-print-sys-var1-294 
        DataI        0                         
        PushD        -array-print-sys-var1-294 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-294 
        PushD        -array-print-sys-var1-294 
        LoadI                                  
        JumpFalse    -array-print-loop-end-294 
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
        DLabel       -array-print-sys-var1-295 
        DataI        0                         
        PushD        -array-print-sys-var1-295 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-295 
        PushD        -array-print-sys-var1-295 
        LoadI                                  
        JumpFalse    -array-print-loop-end-295 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-295 
        PushD        -array-print-sys-var1-295 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-295 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-295 
        PushD        -array-print-sys-var1-295 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-295 
        Label        -array-print-loop-end-295 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-294 
        PushD        -array-print-sys-var1-294 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-294 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-294 
        PushD        -array-print-sys-var1-294 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-294 
        Label        -array-print-loop-end-294 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-293 
        PushD        -array-print-sys-var1-293 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-293 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-293 
        PushD        -array-print-sys-var1-293 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-293 
        Label        -array-print-loop-end-293 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% bbb
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-296 
        DataI        0                         
        PushD        -array-print-sys-var1-296 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-296 
        PushD        -array-print-sys-var1-296 
        LoadI                                  
        JumpFalse    -array-print-loop-end-296 
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
        DLabel       -array-print-sys-var1-297 
        DataI        0                         
        PushD        -array-print-sys-var1-297 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-297 
        PushD        -array-print-sys-var1-297 
        LoadI                                  
        JumpFalse    -array-print-loop-end-297 
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
        DLabel       -array-print-sys-var1-298 
        DataI        0                         
        PushD        -array-print-sys-var1-298 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-298 
        PushD        -array-print-sys-var1-298 
        LoadI                                  
        JumpFalse    -array-print-loop-end-298 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-298 
        PushD        -array-print-sys-var1-298 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-298 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-298 
        PushD        -array-print-sys-var1-298 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-298 
        Label        -array-print-loop-end-298 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-297 
        PushD        -array-print-sys-var1-297 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-297 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-297 
        PushD        -array-print-sys-var1-297 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-297 
        Label        -array-print-loop-end-297 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-296 
        PushD        -array-print-sys-var1-296 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-296 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-296 
        PushD        -array-print-sys-var1-296 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-296 
        Label        -array-print-loop-end-296 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% ccc
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-299 
        DataI        0                         
        PushD        -array-print-sys-var1-299 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-299 
        PushD        -array-print-sys-var1-299 
        LoadI                                  
        JumpFalse    -array-print-loop-end-299 
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
        DLabel       -array-print-sys-var1-300 
        DataI        0                         
        PushD        -array-print-sys-var1-300 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-300 
        PushD        -array-print-sys-var1-300 
        LoadI                                  
        JumpFalse    -array-print-loop-end-300 
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
        DLabel       -array-print-sys-var1-301 
        DataI        0                         
        PushD        -array-print-sys-var1-301 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-301 
        PushD        -array-print-sys-var1-301 
        LoadI                                  
        JumpFalse    -array-print-loop-end-301 
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-301 
        PushD        -array-print-sys-var1-301 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-301 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-301 
        PushD        -array-print-sys-var1-301 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-301 
        Label        -array-print-loop-end-301 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-300 
        PushD        -array-print-sys-var1-300 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-300 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-300 
        PushD        -array-print-sys-var1-300 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-300 
        Label        -array-print-loop-end-300 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-299 
        PushD        -array-print-sys-var1-299 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-299 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-299 
        PushD        -array-print-sys-var1-299 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-299 
        Label        -array-print-loop-end-299 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% ddd
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-302 
        DataI        0                         
        PushD        -array-print-sys-var1-302 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-302 
        PushD        -array-print-sys-var1-302 
        LoadI                                  
        JumpFalse    -array-print-loop-end-302 
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
        DLabel       -array-print-sys-var1-303 
        DataI        0                         
        PushD        -array-print-sys-var1-303 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-303 
        PushD        -array-print-sys-var1-303 
        LoadI                                  
        JumpFalse    -array-print-loop-end-303 
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
        DLabel       -array-print-sys-var1-304 
        DataI        0                         
        PushD        -array-print-sys-var1-304 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-304 
        PushD        -array-print-sys-var1-304 
        LoadI                                  
        JumpFalse    -array-print-loop-end-304 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format305 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-304 
        PushD        -array-print-sys-var1-304 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-304 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-304 
        PushD        -array-print-sys-var1-304 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-304 
        Label        -array-print-loop-end-304 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-303 
        PushD        -array-print-sys-var1-303 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-303 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-303 
        PushD        -array-print-sys-var1-303 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-303 
        Label        -array-print-loop-end-303 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-302 
        PushD        -array-print-sys-var1-302 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-302 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-302 
        PushD        -array-print-sys-var1-302 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-302 
        Label        -array-print-loop-end-302 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% eee
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-306 
        DataI        0                         
        PushD        -array-print-sys-var1-306 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-306 
        PushD        -array-print-sys-var1-306 
        LoadI                                  
        JumpFalse    -array-print-loop-end-306 
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
        DLabel       -array-print-sys-var1-307 
        DataI        0                         
        PushD        -array-print-sys-var1-307 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-307 
        PushD        -array-print-sys-var1-307 
        LoadI                                  
        JumpFalse    -array-print-loop-end-307 
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
        DLabel       -array-print-sys-var1-308 
        DataI        0                         
        PushD        -array-print-sys-var1-308 
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-308 
        PushD        -array-print-sys-var1-308 
        LoadI                                  
        JumpFalse    -array-print-loop-end-308 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true309    
        PushD        $boolean-false-string     
        Jump         -print-boolean-join309    
        Label        -print-boolean-true309    
        PushD        $boolean-true-string      
        Label        -print-boolean-join309    
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-308 
        PushD        -array-print-sys-var1-308 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-308 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-308 
        PushD        -array-print-sys-var1-308 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-308 
        Label        -array-print-loop-end-308 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-307 
        PushD        -array-print-sys-var1-307 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-307 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-307 
        PushD        -array-print-sys-var1-307 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-307 
        Label        -array-print-loop-end-307 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-306 
        PushD        -array-print-sys-var1-306 
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-306 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-306 
        PushD        -array-print-sys-var1-306 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-306 
        Label        -array-print-loop-end-306 
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
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
