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
        DataZ        4                         
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        PushI        1                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        1                         
        Add                                    %% b
        PushI        0                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        2                         
        Add                                    %% an
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadC                                  
        BNegate                                
        StoreC                                 
        PushD        $global-memory-block      
        PushI        3                         
        Add                                    %% an3
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadC                                  
        BNegate                                
        BNegate                                
        BNegate                                
        StoreC                                 
        Label        -boolean-op-arg1-4        
        Label        -boolean-op-arg1-3        
        Label        -boolean-op-arg1-2        
        PushD        $global-memory-block      
        PushI        2                         
        Add                                    %% an
        LoadC                                  
        JumpFalse    -boolean-op-false-2       
        Label        -boolean-op-arg2-2        
        Label        -compare-arg1-1           
        PushD        $global-memory-block      
        PushI        1                         
        Add                                    %% b
        LoadC                                  
        Label        -compare-arg2-1           
        PushD        $global-memory-block      
        PushI        3                         
        Add                                    %% an3
        LoadC                                  
        Label        -compare-sub-1            
        Subtract                               
        JumpFalse    -compare-true-1           
        Jump         -compare-false-1          
        Label        -compare-true-1           
        PushI        1                         
        Jump         -compare-join-1           
        Label        -compare-false-1          
        PushI        0                         
        Jump         -compare-join-1           
        Label        -compare-join-1           
        JumpFalse    -boolean-op-false-2       
        Label        -boolean-op-true-2        
        PushI        1                         
        Jump         -boolean-op-join-2        
        Label        -boolean-op-false-2       
        PushI        0                         
        Jump         -boolean-op-join-2        
        Label        -boolean-op-join-2        
        JumpFalse    -boolean-op-false-3       
        Label        -boolean-op-arg2-3        
        PushD        $global-memory-block      
        PushI        1                         
        Add                                    %% b
        LoadC                                  
        BNegate                                
        JumpFalse    -boolean-op-false-3       
        Label        -boolean-op-true-3        
        PushI        1                         
        Jump         -boolean-op-join-3        
        Label        -boolean-op-false-3       
        PushI        0                         
        Jump         -boolean-op-join-3        
        Label        -boolean-op-join-3        
        JumpTrue     -boolean-op-true-4        
        Label        -boolean-op-arg2-4        
        PushI        0                         
        JumpTrue     -boolean-op-true-4        
        Label        -boolean-op-false-4       
        PushI        0                         
        Jump         -boolean-op-join-4        
        Label        -boolean-op-true-4        
        PushI        1                         
        Jump         -boolean-op-join-4        
        Label        -boolean-op-join-4        
        JumpTrue     -print-boolean-true5      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join5      
        Label        -print-boolean-true5      
        PushD        $boolean-true-string      
        Label        -print-boolean-join5      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -boolean-op-arg1-6        
        PushI        1                         
        JumpFalse    -boolean-op-false-6       
        Label        -boolean-op-arg2-6        
        PushI        1                         
        JumpFalse    -boolean-op-false-6       
        Label        -boolean-op-true-6        
        PushI        1                         
        Jump         -boolean-op-join-6        
        Label        -boolean-op-false-6       
        PushI        0                         
        Jump         -boolean-op-join-6        
        Label        -boolean-op-join-6        
        JumpTrue     -print-boolean-true7      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join7      
        Label        -print-boolean-true7      
        PushD        $boolean-true-string      
        Label        -print-boolean-join7      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -boolean-op-arg1-8        
        PushI        0                         
        JumpFalse    -boolean-op-false-8       
        Label        -boolean-op-arg2-8        
        PushI        1                         
        JumpFalse    -boolean-op-false-8       
        Label        -boolean-op-true-8        
        PushI        1                         
        Jump         -boolean-op-join-8        
        Label        -boolean-op-false-8       
        PushI        0                         
        Jump         -boolean-op-join-8        
        Label        -boolean-op-join-8        
        JumpTrue     -print-boolean-true9      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join9      
        Label        -print-boolean-true9      
        PushD        $boolean-true-string      
        Label        -print-boolean-join9      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -boolean-op-arg1-10       
        PushI        1                         
        JumpFalse    -boolean-op-false-10      
        Label        -boolean-op-arg2-10       
        PushI        0                         
        JumpFalse    -boolean-op-false-10      
        Label        -boolean-op-true-10       
        PushI        1                         
        Jump         -boolean-op-join-10       
        Label        -boolean-op-false-10      
        PushI        0                         
        Jump         -boolean-op-join-10       
        Label        -boolean-op-join-10       
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
        Label        -boolean-op-arg1-12       
        PushI        0                         
        JumpFalse    -boolean-op-false-12      
        Label        -boolean-op-arg2-12       
        PushI        0                         
        JumpFalse    -boolean-op-false-12      
        Label        -boolean-op-true-12       
        PushI        1                         
        Jump         -boolean-op-join-12       
        Label        -boolean-op-false-12      
        PushI        0                         
        Jump         -boolean-op-join-12       
        Label        -boolean-op-join-12       
        JumpTrue     -print-boolean-true13     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join13     
        Label        -print-boolean-true13     
        PushD        $boolean-true-string      
        Label        -print-boolean-join13     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -boolean-op-arg1-14       
        PushI        1                         
        JumpTrue     -boolean-op-true-14       
        Label        -boolean-op-arg2-14       
        PushI        1                         
        JumpTrue     -boolean-op-true-14       
        Label        -boolean-op-false-14      
        PushI        0                         
        Jump         -boolean-op-join-14       
        Label        -boolean-op-true-14       
        PushI        1                         
        Jump         -boolean-op-join-14       
        Label        -boolean-op-join-14       
        JumpTrue     -print-boolean-true15     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join15     
        Label        -print-boolean-true15     
        PushD        $boolean-true-string      
        Label        -print-boolean-join15     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -boolean-op-arg1-16       
        PushI        0                         
        JumpTrue     -boolean-op-true-16       
        Label        -boolean-op-arg2-16       
        PushI        1                         
        JumpTrue     -boolean-op-true-16       
        Label        -boolean-op-false-16      
        PushI        0                         
        Jump         -boolean-op-join-16       
        Label        -boolean-op-true-16       
        PushI        1                         
        Jump         -boolean-op-join-16       
        Label        -boolean-op-join-16       
        JumpTrue     -print-boolean-true17     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join17     
        Label        -print-boolean-true17     
        PushD        $boolean-true-string      
        Label        -print-boolean-join17     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -boolean-op-arg1-18       
        PushI        1                         
        JumpTrue     -boolean-op-true-18       
        Label        -boolean-op-arg2-18       
        PushI        0                         
        JumpTrue     -boolean-op-true-18       
        Label        -boolean-op-false-18      
        PushI        0                         
        Jump         -boolean-op-join-18       
        Label        -boolean-op-true-18       
        PushI        1                         
        Jump         -boolean-op-join-18       
        Label        -boolean-op-join-18       
        JumpTrue     -print-boolean-true19     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join19     
        Label        -print-boolean-true19     
        PushD        $boolean-true-string      
        Label        -print-boolean-join19     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -boolean-op-arg1-20       
        PushI        0                         
        JumpTrue     -boolean-op-true-20       
        Label        -boolean-op-arg2-20       
        PushI        0                         
        JumpTrue     -boolean-op-true-20       
        Label        -boolean-op-false-20      
        PushI        0                         
        Jump         -boolean-op-join-20       
        Label        -boolean-op-true-20       
        PushI        1                         
        Jump         -boolean-op-join-20       
        Label        -boolean-op-join-20       
        JumpTrue     -print-boolean-true21     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join21     
        Label        -print-boolean-true21     
        PushD        $boolean-true-string      
        Label        -print-boolean-join21     
        PushD        $print-format-boolean     
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
