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
        DataZ        58                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% income
        PushI        3000                      
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bonus
        PushI        200                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% taxrate
        PushF        0.100000                  
        StoreF                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lend
        PushI        500                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% repaid
        PushF        0.500000                  
        StoreF                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% bill
        PushI        700                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% div
        PushI        2                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% c
        PushI        111                       
        StoreC                                 
        PushD        $global-memory-block      
        PushI        37                        
        Add                                    %% b
        PushI        1                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        38                        
        Add                                    %% s
        DLabel       -string-1                 
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        8                         
        DataC        101                       %% "employed"
        DataC        109                       
        DataC        112                       
        DataC        108                       
        DataC        111                       
        DataC        121                       
        DataC        101                       
        DataC        100                       
        DataC        0                         
        PushD        -string-1                 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        42                        
        Add                                    %% net1
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% taxrate
        LoadF                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% income
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bonus
        LoadI                                  
        Add                                    
        ConvertF                               
        FMultiply                              
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lend
        LoadI                                  
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% bill
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% div
        LoadI                                  
        Duplicate                              
        JumpFalse    $$i-divide-by-zero        
        Divide                                 
        ConvertF                               
        FSubtract                              
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lend
        LoadI                                  
        ConvertF                               
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% repaid
        LoadF                                  
        FMultiply                              
        FAdd                                   
        StoreF                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bonus
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bonus
        LoadI                                  
        PushI        200                       
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lend
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lend
        LoadI                                  
        PushI        2                         
        Multiply                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        50                        
        Add                                    %% net2
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% taxrate
        LoadF                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% income
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bonus
        LoadI                                  
        Add                                    
        ConvertF                               
        FMultiply                              
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lend
        LoadI                                  
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% bill
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% div
        LoadI                                  
        Duplicate                              
        JumpFalse    $$i-divide-by-zero        
        Divide                                 
        ConvertF                               
        FSubtract                              
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lend
        LoadI                                  
        ConvertF                               
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% repaid
        LoadF                                  
        FMultiply                              
        FAdd                                   
        StoreF                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% c
        PushI        120                       
        StoreC                                 
        PushD        $global-memory-block      
        PushI        37                        
        Add                                    %% b
        PushI        0                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        38                        
        Add                                    %% s
        DLabel       -string-2                 
        DataI        10                        
        DataI        5                         
        DataC        0                         
        DataI        10                        
        DataC        117                       %% "unemployed"
        DataC        110                       
        DataC        101                       
        DataC        109                       
        DataC        112                       
        DataC        108                       
        DataC        111                       
        DataC        121                       
        DataC        101                       
        DataC        100                       
        DataC        0                         
        PushD        -string-2                 
        StoreI                                 
        Label        -compare-arg1-3           
        PushD        $global-memory-block      
        PushI        42                        
        Add                                    %% net1
        LoadF                                  
        Label        -compare-arg2-3           
        PushD        $global-memory-block      
        PushI        50                        
        Add                                    %% net2
        LoadF                                  
        Label        -compare-sub-3            
        FSubtract                              
        JumpFPos     -compare-true-3           
        Jump         -compare-false-3          
        Label        -compare-true-3           
        PushI        1                         
        Jump         -compare-join-3           
        Label        -compare-false-3          
        PushI        0                         
        Jump         -compare-join-3           
        Label        -compare-join-3           
        JumpTrue     -print-boolean-true4      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join4      
        Label        -print-boolean-true4      
        PushD        $boolean-true-string      
        Label        -print-boolean-join4      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% c
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        37                        
        Add                                    %% b
        LoadC                                  
        JumpTrue     -print-boolean-true5      
        PushD        $boolean-false-string     
        Jump         -print-boolean-join5      
        Label        -print-boolean-true5      
        PushD        $boolean-true-string      
        Label        -print-boolean-join5      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $global-memory-block      
        PushI        38                        
        Add                                    %% s
        LoadI                                  
        Label        -string-printable-format6 
        PushI        13                        
        Add                                    
        PushD        $print-format-string      
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
