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
        Add                                    %% f
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-24     
        DataI        0                         
        PushD        -array-ec-sys-var1-24     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-24     
        DataI        0                         
        PushD        -array-ec-sys-var2-24     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-25 
        PushI        17                        
        PushI        4                         
        PushD        -array-ec-sys-var1-24     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-25  
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
        Label        -array-ec-sub-size-26     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-ec-elem-len-27     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-24     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-24     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-27    
        PushD        -array-ec-sys-var1-24     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-27      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        PushD        -array-ec-sys-var1-24     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-27    
        Label        -array-ec-arg-end-27      
        PushD        -array-ec-sys-var2-24     
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% g
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-28     
        DataI        0                         
        PushD        -array-ec-sys-var1-28     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-28     
        DataI        0                         
        PushD        -array-ec-sys-var2-28     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-29 
        PushI        17                        
        PushI        1                         
        PushD        -array-ec-sys-var1-28     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-29  
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
        Label        -array-ec-sub-size-30     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-ec-elem-len-31     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-28     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-28     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-31    
        PushD        -array-ec-sys-var1-28     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-31      
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        PushD        -array-ec-sys-var1-28     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-31    
        Label        -array-ec-arg-end-31      
        PushD        -array-ec-sys-var2-28     
        LoadI                                  
        PushI        1                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% h
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-32     
        DataI        0                         
        PushD        -array-ec-sys-var1-32     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-32     
        DataI        0                         
        PushD        -array-ec-sys-var2-32     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-33 
        PushI        17                        
        PushI        8                         
        PushD        -array-ec-sys-var1-32     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-33  
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
        Label        -array-ec-sub-size-34     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        8                         
        StoreI                                 
        Label        -array-ec-elem-len-35     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-32     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-32     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-35    
        PushD        -array-ec-sys-var1-32     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-35      
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        PushF        0.000000                  
        StoreF                                 
        PushD        -array-ec-sys-var1-32     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-35    
        Label        -array-ec-arg-end-35      
        PushD        -array-ec-sys-var2-32     
        LoadI                                  
        PushI        8                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% i
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-36     
        DataI        0                         
        PushD        -array-ec-sys-var1-36     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-36     
        DataI        0                         
        PushD        -array-ec-sys-var2-36     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-37 
        PushI        17                        
        PushI        4                         
        PushD        -array-ec-sys-var1-36     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-37  
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
        Label        -array-ec-sub-size-38     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-ec-elem-len-39     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-36     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-36     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-39    
        PushD        -array-ec-sys-var1-36     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-39      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        PushD        -array-ec-sys-var1-36     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-39    
        Label        -array-ec-arg-end-39      
        PushD        -array-ec-sys-var2-36     
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% j
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-40     
        DataI        0                         
        PushD        -array-ec-sys-var1-40     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-40     
        DataI        0                         
        PushD        -array-ec-sys-var2-40     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-41 
        PushI        17                        
        PushI        1                         
        PushD        -array-ec-sys-var1-40     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-41  
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
        Label        -array-ec-sub-size-42     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        1                         
        StoreI                                 
        Label        -array-ec-elem-len-43     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-40     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-40     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-43    
        PushD        -array-ec-sys-var1-40     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-43      
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreC                                 
        PushD        -array-ec-sys-var1-40     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-43    
        Label        -array-ec-arg-end-43      
        PushD        -array-ec-sys-var2-40     
        LoadI                                  
        PushI        1                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% ff
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-44     
        DataI        0                         
        PushD        -array-ec-sys-var1-44     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-44     
        DataI        0                         
        PushD        -array-ec-sys-var2-44     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-45 
        PushI        17                        
        PushI        4                         
        PushD        -array-ec-sys-var1-44     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-45  
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
        Label        -array-ec-sub-size-46     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-ec-elem-len-47     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-44     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-44     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-47    
        PushD        -array-ec-sys-var1-44     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-47      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        PushD        -array-ec-sys-var1-44     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-47    
        Label        -array-ec-arg-end-47      
        PushD        -array-ec-sys-var2-44     
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% gg
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-48     
        DataI        0                         
        PushD        -array-ec-sys-var1-48     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-48     
        DataI        0                         
        PushD        -array-ec-sys-var2-48     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-49 
        PushI        17                        
        PushI        4                         
        PushD        -array-ec-sys-var1-48     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-49  
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
        Label        -array-ec-sub-size-50     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-ec-elem-len-51     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-48     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-48     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-51    
        PushD        -array-ec-sys-var1-48     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-51      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        PushD        -array-ec-sys-var1-48     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-51    
        Label        -array-ec-arg-end-51      
        PushD        -array-ec-sys-var2-48     
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% hh
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-52     
        DataI        0                         
        PushD        -array-ec-sys-var1-52     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-52     
        DataI        0                         
        PushD        -array-ec-sys-var2-52     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-53 
        PushI        17                        
        PushI        4                         
        PushD        -array-ec-sys-var1-52     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-53  
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
        Label        -array-ec-sub-size-54     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-ec-elem-len-55     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-52     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-52     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-55    
        PushD        -array-ec-sys-var1-52     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-55      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        PushD        -array-ec-sys-var1-52     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-55    
        Label        -array-ec-arg-end-55      
        PushD        -array-ec-sys-var2-52     
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% ii
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-56     
        DataI        0                         
        PushD        -array-ec-sys-var1-56     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-56     
        DataI        0                         
        PushD        -array-ec-sys-var2-56     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-57 
        PushI        17                        
        PushI        4                         
        PushD        -array-ec-sys-var1-56     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-57  
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
        Label        -array-ec-sub-size-58     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-ec-elem-len-59     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-56     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-56     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-59    
        PushD        -array-ec-sys-var1-56     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-59      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        PushD        -array-ec-sys-var1-56     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-59    
        Label        -array-ec-arg-end-59      
        PushD        -array-ec-sys-var2-56     
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% jj
        PushI        3                         
        Duplicate                              
        DLabel       -array-ec-sys-var1-60     
        DataI        0                         
        PushD        -array-ec-sys-var1-60     
        Exchange                               
        StoreI                                 
        DLabel       -array-ec-sys-var2-60     
        DataI        0                         
        PushD        -array-ec-sys-var2-60     
        Exchange                               
        StoreI                                 
        Label        -total-number-of-bytes-61 
        PushI        17                        
        PushI        4                         
        PushD        -array-ec-sys-var1-60     
        LoadI                                  
        Multiply                               
        Add                                    
        Call         -mem-manager-allocate     
        Label        -array-empty-creation-61  
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
        Label        -array-ec-sub-size-62     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        4                         
        StoreI                                 
        Label        -array-ec-elem-len-63     
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushD        -array-ec-sys-var1-60     
        LoadI                                  
        StoreI                                 
        PushD        -array-ec-sys-var1-60     
        LoadI                                  
        JumpNeg      $$negative-array-length   
        Label        -array-ec-arg-start-63    
        PushD        -array-ec-sys-var1-60     
        LoadI                                  
        JumpFalse    -array-ec-arg-end-63      
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        0                         
        StoreI                                 
        PushD        -array-ec-sys-var1-60     
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-ec-arg-start-63    
        Label        -array-ec-arg-end-63      
        PushD        -array-ec-sys-var2-60     
        LoadI                                  
        PushI        4                         
        Multiply                               
        PushI        17                        
        Add                                    
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% f
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-64  
        DataI        0                         
        PushD        -array-print-sys-var1-64  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-64 
        PushD        -array-print-sys-var1-64  
        LoadI                                  
        JumpFalse    -array-print-loop-end-64  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-64 
        PushD        -array-print-sys-var1-64  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-64 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-64 
        PushD        -array-print-sys-var1-64  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-64 
        Label        -array-print-loop-end-64  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% g
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-65  
        DataI        0                         
        PushD        -array-print-sys-var1-65  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-65 
        PushD        -array-print-sys-var1-65  
        LoadI                                  
        JumpFalse    -array-print-loop-end-65  
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-65 
        PushD        -array-print-sys-var1-65  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-65 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-65 
        PushD        -array-print-sys-var1-65  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-65 
        Label        -array-print-loop-end-65  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% h
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-66  
        DataI        0                         
        PushD        -array-print-sys-var1-66  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-66 
        PushD        -array-print-sys-var1-66  
        LoadI                                  
        JumpFalse    -array-print-loop-end-66  
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-66 
        PushD        -array-print-sys-var1-66  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-66 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-66 
        PushD        -array-print-sys-var1-66  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-66 
        Label        -array-print-loop-end-66  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-67  
        DataI        0                         
        PushD        -array-print-sys-var1-67  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-67 
        PushD        -array-print-sys-var1-67  
        LoadI                                  
        JumpFalse    -array-print-loop-end-67  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format68 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-67 
        PushD        -array-print-sys-var1-67  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-67 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-67 
        PushD        -array-print-sys-var1-67  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-67 
        Label        -array-print-loop-end-67  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% j
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-69  
        DataI        0                         
        PushD        -array-print-sys-var1-69  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-69 
        PushD        -array-print-sys-var1-69  
        LoadI                                  
        JumpFalse    -array-print-loop-end-69  
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true70     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join70     
        Label        -print-boolean-true70     
        PushD        $boolean-true-string      
        Label        -print-boolean-join70     
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-69 
        PushD        -array-print-sys-var1-69  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-69 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-69 
        PushD        -array-print-sys-var1-69  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-69 
        Label        -array-print-loop-end-69  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        PushI        0                         
        StoreI                                 
        Label        -while-loop-start-71      
        Label        -compare-arg1-72          
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        LoadI                                  
        Label        -compare-arg2-72          
        PushI        3                         
        Label        -compare-sub-72           
        Subtract                               
        JumpNeg      -compare-true-72          
        Jump         -compare-false-72         
        Label        -compare-true-72          
        PushI        1                         
        Jump         -compare-join-72          
        Label        -compare-false-72         
        PushI        0                         
        Jump         -compare-join-72          
        Label        -compare-join-72          
        JumpFalse    -while-loop-end-71        
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% ff
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        LoadI                                  
        DLabel       -array-io-sys-var-73      
        DataI        0                         
        PushD        -array-io-sys-var-73      
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-73      
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-73      
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-73 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-73 
        PushD        -array-io-sys-var-73      
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
        PushI        44                        
        Add                                    %% gg
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        LoadI                                  
        DLabel       -array-io-sys-var-74      
        DataI        0                         
        PushD        -array-io-sys-var-74      
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-74      
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-74      
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-74 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-74 
        PushD        -array-io-sys-var-74      
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
        PushI        48                        
        Add                                    %% hh
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        LoadI                                  
        DLabel       -array-io-sys-var-75      
        DataI        0                         
        PushD        -array-io-sys-var-75      
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-75      
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-75      
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-75 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-75 
        PushD        -array-io-sys-var-75      
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
        PushI        52                        
        Add                                    %% ii
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        LoadI                                  
        DLabel       -array-io-sys-var-76      
        DataI        0                         
        PushD        -array-io-sys-var-76      
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-76      
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-76      
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-76 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-76 
        PushD        -array-io-sys-var-76      
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
        PushI        56                        
        Add                                    %% jj
        LoadI                                  
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        LoadI                                  
        DLabel       -array-io-sys-var-77      
        DataI        0                         
        PushD        -array-io-sys-var-77      
        Exchange                               
        StoreI                                 
        PushD        -array-io-sys-var-77      
        LoadI                                  
        JumpNeg      $$array-index-out-of-bounds 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        PushD        -array-io-sys-var-77      
        LoadI                                  
        Subtract                               
        JumpPos      -array-index-operation-77 
        Jump         $$array-index-out-of-bounds 
        Label        -array-index-operation-77 
        PushD        -array-io-sys-var-77      
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
        PushI        60                        
        Add                                    %% z
        PushD        $global-memory-block      
        PushI        60                        
        Add                                    %% z
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -while-loop-start-71      
        Label        -while-loop-end-71        
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% ff
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-78  
        DataI        0                         
        PushD        -array-print-sys-var1-78  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-78 
        PushD        -array-print-sys-var1-78  
        LoadI                                  
        JumpFalse    -array-print-loop-end-78  
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
        DLabel       -array-print-sys-var1-79  
        DataI        0                         
        PushD        -array-print-sys-var1-79  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-79 
        PushD        -array-print-sys-var1-79  
        LoadI                                  
        JumpFalse    -array-print-loop-end-79  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -array-print-separate-start-79 
        PushD        -array-print-sys-var1-79  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-79 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-79 
        PushD        -array-print-sys-var1-79  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-79 
        Label        -array-print-loop-end-79  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-78 
        PushD        -array-print-sys-var1-78  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-78 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-78 
        PushD        -array-print-sys-var1-78  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-78 
        Label        -array-print-loop-end-78  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% gg
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-80  
        DataI        0                         
        PushD        -array-print-sys-var1-80  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-80 
        PushD        -array-print-sys-var1-80  
        LoadI                                  
        JumpFalse    -array-print-loop-end-80  
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
        DLabel       -array-print-sys-var1-81  
        DataI        0                         
        PushD        -array-print-sys-var1-81  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-81 
        PushD        -array-print-sys-var1-81  
        LoadI                                  
        JumpFalse    -array-print-loop-end-81  
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        Label        -array-print-separate-start-81 
        PushD        -array-print-sys-var1-81  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-81 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-81 
        PushD        -array-print-sys-var1-81  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-81 
        Label        -array-print-loop-end-81  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-80 
        PushD        -array-print-sys-var1-80  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-80 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-80 
        PushD        -array-print-sys-var1-80  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-80 
        Label        -array-print-loop-end-80  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% hh
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-82  
        DataI        0                         
        PushD        -array-print-sys-var1-82  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-82 
        PushD        -array-print-sys-var1-82  
        LoadI                                  
        JumpFalse    -array-print-loop-end-82  
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
        DLabel       -array-print-sys-var1-83  
        DataI        0                         
        PushD        -array-print-sys-var1-83  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-83 
        PushD        -array-print-sys-var1-83  
        LoadI                                  
        JumpFalse    -array-print-loop-end-83  
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-float       
        Printf                                 
        Label        -array-print-separate-start-83 
        PushD        -array-print-sys-var1-83  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-83 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-83 
        PushD        -array-print-sys-var1-83  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-83 
        Label        -array-print-loop-end-83  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-82 
        PushD        -array-print-sys-var1-82  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-82 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-82 
        PushD        -array-print-sys-var1-82  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-82 
        Label        -array-print-loop-end-82  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% ii
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-84  
        DataI        0                         
        PushD        -array-print-sys-var1-84  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-84 
        PushD        -array-print-sys-var1-84  
        LoadI                                  
        JumpFalse    -array-print-loop-end-84  
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
        DLabel       -array-print-sys-var1-85  
        DataI        0                         
        PushD        -array-print-sys-var1-85  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-85 
        PushD        -array-print-sys-var1-85  
        LoadI                                  
        JumpFalse    -array-print-loop-end-85  
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        -string-printable-format86 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        Label        -array-print-separate-start-85 
        PushD        -array-print-sys-var1-85  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-85 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-85 
        PushD        -array-print-sys-var1-85  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-85 
        Label        -array-print-loop-end-85  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-84 
        PushD        -array-print-sys-var1-84  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-84 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-84 
        PushD        -array-print-sys-var1-84  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-84 
        Label        -array-print-loop-end-84  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% jj
        LoadI                                  
        PushD        $print-format-open-bracket 
        Printf                                 
        Duplicate                              
        PushI        13                        
        Add                                    
        LoadI                                  
        DLabel       -array-print-sys-var1-87  
        DataI        0                         
        PushD        -array-print-sys-var1-87  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-87 
        PushD        -array-print-sys-var1-87  
        LoadI                                  
        JumpFalse    -array-print-loop-end-87  
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
        DLabel       -array-print-sys-var1-88  
        DataI        0                         
        PushD        -array-print-sys-var1-88  
        Exchange                               
        StoreI                                 
        PushI        17                        
        Add                                    
        Label        -array-print-loop-start-88 
        PushD        -array-print-sys-var1-88  
        LoadI                                  
        JumpFalse    -array-print-loop-end-88  
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true89     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join89     
        Label        -print-boolean-true89     
        PushD        $boolean-true-string      
        Label        -print-boolean-join89     
        PushD        $print-format-boolean     
        Printf                                 
        Label        -array-print-separate-start-88 
        PushD        -array-print-sys-var1-88  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-88 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-88 
        PushD        -array-print-sys-var1-88  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-88 
        Label        -array-print-loop-end-88  
        PushD        $print-format-close-bracket 
        Printf                                 
        Pop                                    
        Label        -array-print-separate-start-87 
        PushD        -array-print-sys-var1-87  
        LoadI                                  
        PushI        1                         
        Subtract                               
        JumpFalse    -array-print-separate-end-87 
        PushD        $print-format-array-separator 
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Label        -array-print-separate-end-87 
        PushD        -array-print-sys-var1-87  
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -array-print-loop-start-87 
        Label        -array-print-loop-end-87  
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
