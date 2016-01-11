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
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        50                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        PushI        2                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        PushI        3                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        PushI        5                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% d
        DLabel       -string-1                 
        DataC        0                         
        PushD        -string-1                 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% e
        DLabel       -string-2                 
        DataC        104                       %% "hello"
        DataC        101                       
        DataC        108                       
        DataC        108                       
        DataC        111                       
        DataC        0                         
        PushD        -string-2                 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% f
        PushI        60                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% g
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        Multiply                               
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% z
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        Multiply                               
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% h
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        Add                                    
        Multiply                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% f
        LoadI                                  
        ConvertF                               
        ConvertI                               
        Label        -cast-int-to-char-3       
        PushI        128                       
        Remainder                              
        StoreC                                 
        PushD        $global-memory-block      
        PushI        37                        
        Add                                    %% j
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% f
        LoadI                                  
        ConvertF                               
        ConvertI                               
        Add                                    
        Multiply                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        41                        
        Add                                    %% k
        Label        -compare-arg1-10          
        Label        -compare-arg1-8           
        Label        -compare-arg1-6           
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
        Label        -compare-arg2-6           
        Label        -compare-arg1-5           
        PushI        3                         
        Label        -compare-arg2-5           
        PushI        3                         
        Label        -compare-sub-5            
        Subtract                               
        JumpPos      -compare-false-5          
        Jump         -compare-true-5           
        Label        -compare-true-5           
        PushI        1                         
        Jump         -compare-join-5           
        Label        -compare-false-5          
        PushI        0                         
        Jump         -compare-join-5           
        Label        -compare-join-5           
        Label        -compare-sub-6            
        Subtract                               
        JumpFalse    -compare-true-6           
        Jump         -compare-false-6          
        Label        -compare-true-6           
        PushI        1                         
        Jump         -compare-join-6           
        Label        -compare-false-6          
        PushI        0                         
        Jump         -compare-join-6           
        Label        -compare-join-6           
        Label        -compare-arg2-8           
        Label        -compare-arg1-7           
        PushI        4                         
        Label        -compare-arg2-7           
        PushI        4                         
        Label        -compare-sub-7            
        Subtract                               
        JumpNeg      -compare-true-7           
        Jump         -compare-false-7          
        Label        -compare-true-7           
        PushI        1                         
        Jump         -compare-join-7           
        Label        -compare-false-7          
        PushI        0                         
        Jump         -compare-join-7           
        Label        -compare-join-7           
        Label        -compare-sub-8            
        Subtract                               
        JumpTrue     -compare-true-8           
        Jump         -compare-false-8          
        Label        -compare-true-8           
        PushI        1                         
        Jump         -compare-join-8           
        Label        -compare-false-8          
        PushI        0                         
        Jump         -compare-join-8           
        Label        -compare-join-8           
        Label        -compare-arg2-10          
        Label        -compare-arg1-9           
        PushI        6                         
        Label        -compare-arg2-9           
        PushI        6                         
        Label        -compare-sub-9            
        Subtract                               
        JumpPos      -compare-true-9           
        Jump         -compare-false-9          
        Label        -compare-true-9           
        PushI        1                         
        Jump         -compare-join-9           
        Label        -compare-false-9          
        PushI        0                         
        Jump         -compare-join-9           
        Label        -compare-join-9           
        Label        -compare-sub-10           
        Subtract                               
        JumpTrue     -compare-true-10          
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
        PushI        42                        
        Add                                    %% superlongexp
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        ConvertF                               
        ConvertI                               
        Multiply                               
        Subtract                               
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% f
        LoadI                                  
        ConvertF                               
        ConvertI                               
        Duplicate                              
        JumpFalse    $$i-divide-by-zero        
        Divide                                 
        Multiply                               
        Subtract                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        46                        
        Add                                    %% _k~12
        PushI        999                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        46                        
        Add                                    %% _k~12
        PushI        888                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% b
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% c
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% d
        LoadI                                  
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% e
        LoadI                                  
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% f
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% g
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% z
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% h
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% i
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        37                        
        Add                                    %% j
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        41                        
        Add                                    %% k
        LoadC                                  
        JumpTrue     -print-boolean-true11     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join11     
        Label        -print-boolean-true11     
        PushD        $boolean-true-string      
        Label        -print-boolean-join11     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% i
        LoadC                                  
        PushI        5                         
        Add                                    
        PushD        $print-format-integer     
        Printf                                 
        Halt                                   
