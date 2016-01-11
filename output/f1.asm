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
        DataZ        4                         
        Label        $$main                    
        Jump         -main-start-              
        Label        -sub-routine-0            
        PushI        0                         
        PushI        0                         
        Label        -total-number-of-bytes-4  
        PushI        9                         
        PushI        1                         
        Add                                    
        PushI        1                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -tuple-creation-4         
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        100                       
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
        DLabel       -return-tuple-3           
        DataI        0                         
        PushD        -return-tuple-3           
        Exchange                               
        StoreI                                 
        Label        -tuple-creation-start-4   
        PushD        -return-tuple-3           
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -return-tuple-3           
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -return-tuple-3           
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushD        -return-tuple-3           
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        -return-tuple-3           
        LoadI                                  
        PushI        9                         
        Subtract                               
        PushI        1                         
        Subtract                               
        PushI        1                         
        Subtract                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Label        -set-dynamic-link3        
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        Exchange                               
        StoreI                                 
        Label        -set-return-address3      
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        Exchange                               
        StoreI                                 
        Label        -FP-equals-SP-3           
        PushD        $frame-pointer            
        PushD        $stack-pointer            
        LoadI                                  
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -16                       
        Add                                    %% b
        PushF        1.230000                  
        StoreF                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -20                       
        Add                                    %% c
        PushI        20                        
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        9                         
        Add                                    
        PushI        99                        
        StoreC                                 
        PushD        $frame-pointer            
        LoadI                                  
        LoadI                                  
        PushI        1                         
        Add                                    
        PushI        9                         
        Add                                    
        PushI        1                         
        StoreC                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -24                       
        Add                                    %% e
        Label        -input-parameters-1       
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -16                       
        Add                                    %% b
        LoadF                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreF                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -20                       
        Add                                    %% c
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Call         -sub-routine-2            
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -24                       
        Add                                    %% e
        LoadI                                  
        PushD        $print-format-open-parentheses 
        Printf                                 
        PushI        9                         
        Add                                    
        Label        -tuple-print-loop-start-2 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        Label        -tuple-print-loop-end-2   
        PushD        $print-format-close-parentheses 
        Printf                                 
        Pop                                    
        PushD        $print-format-newline     
        Printf                                 
        Label        -tear-down-1              
        Label        -put-return-address-5     
        PushD        $frame-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        LoadI                                  
        Label        -put-dynamic-link-5       
        PushD        $frame-pointer            
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Subtract                               
        LoadI                                  
        StoreI                                 
        Label        -inc-by-frame-size-5      
        PushD        $stack-pointer            
        LoadI                                  
        PushI        24                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -copy-return-value-5      
        PushD        $stack-pointer            
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        $stack-pointer            
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        Return                                 
        Label        -sub-routine-2            
        PushI        0                         
        PushI        0                         
        Label        -total-number-of-bytes-7  
        PushI        9                         
        PushI        4                         
        Add                                    
        PushI        4                         
        Add                                    
        Call         -mem-manager-allocate     
        Label        -tuple-creation-7         
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        100                       
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
        DLabel       -return-tuple-6           
        DataI        0                         
        PushD        -return-tuple-6           
        Exchange                               
        StoreI                                 
        Label        -tuple-creation-start-7   
        PushD        -return-tuple-6           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -return-tuple-6           
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -return-tuple-6           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        -return-tuple-6           
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        -return-tuple-6           
        LoadI                                  
        PushI        9                         
        Subtract                               
        PushI        4                         
        Subtract                               
        PushI        4                         
        Subtract                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Label        -set-dynamic-link6        
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        Exchange                               
        StoreI                                 
        Label        -set-return-address6      
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        Exchange                               
        StoreI                                 
        Label        -FP-equals-SP-6           
        PushD        $frame-pointer            
        PushD        $stack-pointer            
        LoadI                                  
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        9                         
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushI        -8                        
        Add                                    
        LoadF                                  
        ConvertI                               
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushI        -12                       
        Add                                    
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        9                         
        Add                                    
        PushI        45                        
        StoreI                                 
        Label        -tear-down-3              
        Label        -put-return-address-8     
        PushD        $frame-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        LoadI                                  
        Label        -put-dynamic-link-8       
        PushD        $frame-pointer            
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Subtract                               
        LoadI                                  
        StoreI                                 
        Label        -inc-by-frame-size-8      
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -copy-return-value-8      
        PushD        $stack-pointer            
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        $stack-pointer            
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        Return                                 
        Label        -main-start-              
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        Label        -input-parameters-9       
        PushI        1                         
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushF        2.300000                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreF                                 
        Call         -sub-routine-0            
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $print-format-open-parentheses 
        Printf                                 
        PushI        9                         
        Add                                    
        Label        -tuple-print-loop-start-10 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        PushD        $print-format-comma-      
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadC                                  
        JumpTrue     -print-boolean-true11     
        PushD        $boolean-false-string     
        Jump         -print-boolean-join11     
        Label        -print-boolean-true11     
        PushD        $boolean-true-string      
        Label        -print-boolean-join11     
        PushD        $print-format-boolean     
        Printf                                 
        Label        -tuple-print-loop-end-10  
        PushD        $print-format-close-parentheses 
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
