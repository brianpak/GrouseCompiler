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
        DataZ        23                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% quarters
        PushI        5                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dimes
        PushI        3                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% nickels
        PushI        7                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% pennies
        PushI        17                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% value
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% quarters
        LoadI                                  
        PushI        25                        
        Multiply                               
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dimes
        LoadI                                  
        PushI        10                        
        Multiply                               
        Add                                    
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% nickels
        LoadI                                  
        PushI        5                         
        Multiply                               
        Add                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% pennies
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% value
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% moredimes
        Label        -compare-arg1-1           
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dimes
        LoadI                                  
        Label        -compare-arg2-1           
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% nickels
        LoadI                                  
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
        PushI        20                        
        Add                                    %% moredimes
        LoadC                                  
        JumpTrue     -print-boolean-true2      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join2      
        Label        -print-boolean-true2      
        PushD        $boolean-true-string      
        Label        -print-boolean-join2      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        21                        
        Add                                    %% boot
        PushI        1                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% boof
        PushI        0                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        21                        
        Add                                    %% boot
        LoadC                                  
        JumpTrue     -print-boolean-true3      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join3      
        Label        -print-boolean-true3      
        PushD        $boolean-true-string      
        Label        -print-boolean-join3      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% boof
        LoadC                                  
        JumpTrue     -print-boolean-true4      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join4      
        Label        -print-boolean-true4      
        PushD        $boolean-true-string      
        Label        -print-boolean-join4      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        21                        
        Add                                    %% boot
        LoadC                                  
        JumpTrue     -print-boolean-true5      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join5      
        Label        -print-boolean-true5      
        PushD        $boolean-true-string      
        Label        -print-boolean-join5      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% boof
        LoadC                                  
        JumpTrue     -print-boolean-true6      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join6      
        Label        -print-boolean-true6      
        PushD        $boolean-true-string      
        Label        -print-boolean-join6      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
