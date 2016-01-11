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
        DataZ        16                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        Label        -compare-arg1-1           
        PushI        5                         
        Label        -compare-arg2-1           
        PushI        3                         
        Label        -compare-sub-1            
        Subtract                               
        JumpPos      -compare-true-1           
        Jump         -compare-false-1          
        Label        -compare-true-1           
        PushI        1                         
        Jump         -compare-join-1           
        Label        -compare-false-1          
        PushI        0                         
        Jump         -compare-join-1           
        Label        -compare-join-1           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        1                         
        Add                                    %% b
        Label        -compare-arg1-2           
        PushI        3                         
        Label        -compare-arg2-2           
        PushI        5                         
        Label        -compare-sub-2            
        Subtract                               
        JumpNeg      -compare-true-2           
        Jump         -compare-false-2          
        Label        -compare-true-2           
        PushI        1                         
        Jump         -compare-join-2           
        Label        -compare-false-2          
        PushI        0                         
        Jump         -compare-join-2           
        Label        -compare-join-2           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        2                         
        Add                                    %% c
        Label        -compare-arg1-3           
        PushI        5                         
        Label        -compare-arg2-3           
        PushI        3                         
        Label        -compare-sub-3            
        Subtract                               
        JumpNeg      -compare-false-3          
        Jump         -compare-true-3           
        Label        -compare-true-3           
        PushI        1                         
        Jump         -compare-join-3           
        Label        -compare-false-3          
        PushI        0                         
        Jump         -compare-join-3           
        Label        -compare-join-3           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        3                         
        Add                                    %% d
        Label        -compare-arg1-4           
        PushI        5                         
        Label        -compare-arg2-4           
        PushI        5                         
        Label        -compare-sub-4            
        Subtract                               
        JumpNeg      -compare-false-4          
        Jump         -compare-true-4           
        Label        -compare-true-4           
        PushI        1                         
        Jump         -compare-join-4           
        Label        -compare-false-4          
        PushI        0                         
        Jump         -compare-join-4           
        Label        -compare-join-4           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% e
        Label        -compare-arg1-5           
        PushI        3                         
        Label        -compare-arg2-5           
        PushI        5                         
        Label        -compare-sub-5            
        Subtract                               
        JumpNeg      -compare-true-5           
        Jump         -compare-false-5          
        Label        -compare-true-5           
        PushI        1                         
        Jump         -compare-join-5           
        Label        -compare-false-5          
        PushI        0                         
        Jump         -compare-join-5           
        Label        -compare-join-5           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% f
        Label        -compare-arg1-6           
        PushI        5                         
        Label        -compare-arg2-6           
        PushI        5                         
        Label        -compare-sub-6            
        Subtract                               
        JumpPos      -compare-false-6          
        Jump         -compare-true-6           
        Label        -compare-true-6           
        PushI        1                         
        Jump         -compare-join-6           
        Label        -compare-false-6          
        PushI        0                         
        Jump         -compare-join-6           
        Label        -compare-join-6           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        6                         
        Add                                    %% g
        Label        -compare-arg1-7           
        PushI        5                         
        Label        -compare-arg2-7           
        PushI        5                         
        Label        -compare-sub-7            
        Subtract                               
        JumpFalse    -compare-true-7           
        Jump         -compare-false-7          
        Label        -compare-true-7           
        PushI        1                         
        Jump         -compare-join-7           
        Label        -compare-false-7          
        PushI        0                         
        Jump         -compare-join-7           
        Label        -compare-join-7           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        7                         
        Add                                    %% h
        Label        -compare-arg1-8           
        PushI        3                         
        Label        -compare-arg2-8           
        PushI        5                         
        Label        -compare-sub-8            
        Subtract                               
        JumpFalse    -compare-false-8          
        Jump         -compare-true-8           
        Label        -compare-true-8           
        PushI        1                         
        Jump         -compare-join-8           
        Label        -compare-false-8          
        PushI        0                         
        Jump         -compare-join-8           
        Label        -compare-join-8           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% i
        Label        -compare-arg1-9           
        PushF        0.300000                  
        Label        -compare-arg2-9           
        PushF        0.200000                  
        Label        -compare-sub-9            
        FSubtract                              
        JumpFPos     -compare-true-9           
        Jump         -compare-false-9          
        Label        -compare-true-9           
        PushI        1                         
        Jump         -compare-join-9           
        Label        -compare-false-9          
        PushI        0                         
        Jump         -compare-join-9           
        Label        -compare-join-9           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% j
        Label        -compare-arg1-10          
        PushF        0.200000                  
        Label        -compare-arg2-10          
        PushF        0.300000                  
        Label        -compare-sub-10           
        FSubtract                              
        JumpFNeg     -compare-true-10          
        Jump         -compare-false-10         
        Label        -compare-true-10          
        PushI        1                         
        Jump         -compare-join-10          
        Label        -compare-false-10         
        PushI        0                         
        Jump         -compare-join-10          
        Label        -compare-join-10          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        10                        
        Add                                    %% k
        Label        -compare-arg1-11          
        PushF        0.300000                  
        Label        -compare-arg2-11          
        PushF        0.200000                  
        Label        -compare-sub-11           
        FSubtract                              
        JumpFNeg     -compare-false-11         
        Jump         -compare-true-11          
        Label        -compare-true-11          
        PushI        1                         
        Jump         -compare-join-11          
        Label        -compare-false-11         
        PushI        0                         
        Jump         -compare-join-11          
        Label        -compare-join-11          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        11                        
        Add                                    %% l
        Label        -compare-arg1-12          
        PushF        0.300000                  
        Label        -compare-arg2-12          
        PushF        0.300000                  
        Label        -compare-sub-12           
        FSubtract                              
        JumpFNeg     -compare-false-12         
        Jump         -compare-true-12          
        Label        -compare-true-12          
        PushI        1                         
        Jump         -compare-join-12          
        Label        -compare-false-12         
        PushI        0                         
        Jump         -compare-join-12          
        Label        -compare-join-12          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% m
        Label        -compare-arg1-13          
        PushF        0.200000                  
        Label        -compare-arg2-13          
        PushF        0.300000                  
        Label        -compare-sub-13           
        FSubtract                              
        JumpFNeg     -compare-true-13          
        Jump         -compare-false-13         
        Label        -compare-true-13          
        PushI        1                         
        Jump         -compare-join-13          
        Label        -compare-false-13         
        PushI        0                         
        Jump         -compare-join-13          
        Label        -compare-join-13          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        13                        
        Add                                    %% n
        Label        -compare-arg1-14          
        PushF        0.300000                  
        Label        -compare-arg2-14          
        PushF        0.300000                  
        Label        -compare-sub-14           
        FSubtract                              
        JumpFPos     -compare-false-14         
        Jump         -compare-true-14          
        Label        -compare-true-14          
        PushI        1                         
        Jump         -compare-join-14          
        Label        -compare-false-14         
        PushI        0                         
        Jump         -compare-join-14          
        Label        -compare-join-14          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        14                        
        Add                                    %% o
        Label        -compare-arg1-15          
        PushF        0.300000                  
        Label        -compare-arg2-15          
        PushF        0.300000                  
        Label        -compare-sub-15           
        FSubtract                              
        JumpFZero    -compare-true-15          
        Jump         -compare-false-15         
        Label        -compare-true-15          
        PushI        1                         
        Jump         -compare-join-15          
        Label        -compare-false-15         
        PushI        0                         
        Jump         -compare-join-15          
        Label        -compare-join-15          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        15                        
        Add                                    %% p
        Label        -compare-arg1-16          
        PushF        0.200000                  
        Label        -compare-arg2-16          
        PushF        0.300000                  
        Label        -compare-sub-16           
        FSubtract                              
        JumpFZero    -compare-false-16         
        Jump         -compare-true-16          
        Label        -compare-true-16          
        PushI        1                         
        Jump         -compare-join-16          
        Label        -compare-false-16         
        PushI        0                         
        Jump         -compare-join-16          
        Label        -compare-join-16          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadC                                  
        JumpTrue     -print-boolean-true17     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join17     
        Label        -print-boolean-true17     
        PushD        $boolean-true-string      
        Label        -print-boolean-join17     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        1                         
        Add                                    %% b
        LoadC                                  
        JumpTrue     -print-boolean-true18     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join18     
        Label        -print-boolean-true18     
        PushD        $boolean-true-string      
        Label        -print-boolean-join18     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        2                         
        Add                                    %% c
        LoadC                                  
        JumpTrue     -print-boolean-true19     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join19     
        Label        -print-boolean-true19     
        PushD        $boolean-true-string      
        Label        -print-boolean-join19     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        3                         
        Add                                    %% d
        LoadC                                  
        JumpTrue     -print-boolean-true20     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join20     
        Label        -print-boolean-true20     
        PushD        $boolean-true-string      
        Label        -print-boolean-join20     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% e
        LoadC                                  
        JumpTrue     -print-boolean-true21     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join21     
        Label        -print-boolean-true21     
        PushD        $boolean-true-string      
        Label        -print-boolean-join21     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% f
        LoadC                                  
        JumpTrue     -print-boolean-true22     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join22     
        Label        -print-boolean-true22     
        PushD        $boolean-true-string      
        Label        -print-boolean-join22     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        6                         
        Add                                    %% g
        LoadC                                  
        JumpTrue     -print-boolean-true23     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join23     
        Label        -print-boolean-true23     
        PushD        $boolean-true-string      
        Label        -print-boolean-join23     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        7                         
        Add                                    %% h
        LoadC                                  
        JumpTrue     -print-boolean-true24     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join24     
        Label        -print-boolean-true24     
        PushD        $boolean-true-string      
        Label        -print-boolean-join24     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% i
        LoadC                                  
        JumpTrue     -print-boolean-true25     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join25     
        Label        -print-boolean-true25     
        PushD        $boolean-true-string      
        Label        -print-boolean-join25     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% j
        LoadC                                  
        JumpTrue     -print-boolean-true26     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join26     
        Label        -print-boolean-true26     
        PushD        $boolean-true-string      
        Label        -print-boolean-join26     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        10                        
        Add                                    %% k
        LoadC                                  
        JumpTrue     -print-boolean-true27     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join27     
        Label        -print-boolean-true27     
        PushD        $boolean-true-string      
        Label        -print-boolean-join27     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        11                        
        Add                                    %% l
        LoadC                                  
        JumpTrue     -print-boolean-true28     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join28     
        Label        -print-boolean-true28     
        PushD        $boolean-true-string      
        Label        -print-boolean-join28     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% m
        LoadC                                  
        JumpTrue     -print-boolean-true29     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join29     
        Label        -print-boolean-true29     
        PushD        $boolean-true-string      
        Label        -print-boolean-join29     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        13                        
        Add                                    %% n
        LoadC                                  
        JumpTrue     -print-boolean-true30     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join30     
        Label        -print-boolean-true30     
        PushD        $boolean-true-string      
        Label        -print-boolean-join30     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        14                        
        Add                                    %% o
        LoadC                                  
        JumpTrue     -print-boolean-true31     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join31     
        Label        -print-boolean-true31     
        PushD        $boolean-true-string      
        Label        -print-boolean-join31     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        15                        
        Add                                    %% p
        LoadC                                  
        JumpTrue     -print-boolean-true32     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join32     
        Label        -print-boolean-true32     
        PushD        $boolean-true-string      
        Label        -print-boolean-join32     
        PushD        $print-format-boolean     
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
