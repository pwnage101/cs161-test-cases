(print (list
        'test-recall-wph
        
        (EQUAL (RECALL-WPH APS-1 C-LX-1)
               '(NIL
                 ((D-ATTACH-SF AFT PHYS-OBJ REF (DEF)))
                 (APPLE WAS FOUND IN THE BIG APPLE)))

        (EQUAL (RECALL-WPH APS-2 C-LX-1)
               '((FRUIT (TYPE (APPLE))) NIL (WAS FOUND)))

        (EQUAL (RECALL-WPH APS-3 C-LX-1)
               '((DESSERT) NIL (IS TASTY)))

        (EQUAL (RECALL-WPH APS-4 C-LX-1)
               '((NYC) NIL (IS AN EXCITING PLACE)))

        (EQUAL (RECALL-WPH APS-5 C-LX-1)
               '((UNKNOWN (IS (CRAB))) NIL (APPLE)))

        ))
