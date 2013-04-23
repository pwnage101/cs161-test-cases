;;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 1: ADD-LEX ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(ADD-LEX '(SALLY)
         '(HUMAN (GENDER (FEMALE))
                 (F-NAME (SALLY))
                 (L-NAME L-NAME))
         '((D-LAST-NAME L-NAME)))

(setq test-add-lex-1 C-LEX)

(ADD-LEX '(FREDDY)
         '(HUMAN (GENDER (MALE))
                 (F-NAME (FREDDY))
                 (L-NAME L-NAME))
         '((D-LAST-NAME L-NAME)))

(setq test-add-lex-2 C-LEX)

(print
 (list 'test-add-lex

       (EQUAL test-add-lex-1 '(((SALLY)
                                (HUMAN (GENDER (FEMALE))
                                       (F-NAME (SALLY))
                                       (L-NAME L-NAME))
                                ((D-LAST-NAME L-NAME)))))

       (EQUAL test-add-lex-2 '(((FREDDY)
                                (HUMAN (GENDER (MALE))
                                       (F-NAME (FREDDY))
                                       (L-NAME L-NAME))
                                ((D-LAST-NAME L-NAME)))
                               ((SALLY)
                                (HUMAN (GENDER (FEMALE))
                                       (F-NAME (SALLY))
                                       (L-NAME L-NAME))
                                ((D-LAST-NAME L-NAME)))))

       ))

(print
 (list 'test-recall-wph
       
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


(print
 (list 'test-tokenize

       (EQUAL (TOKENIZE '(ST-CHANGE
                          (AGENT AGENT)
                          (FROM (ACQUAINT))
                          (TO (FRIEND
                               (OF OF)))))

              '(ST-CHANGE
                (AGENT AGENT001)
                (FROM (ACQUAINT))
                (TO (FRIEND
                     (OF OF001)))))


       (EQUAL (TOKENIZE '(MTRANS
                          (AGENT AGENT)
                          (RECIP RECIP)
                          (OBJECT (C-CAUSE
                                   (ANTE ANTE)
                                   (CONSEQ (GOAL-FAILURE
                                            (AGENT AGENT)
                                            (TIME (FUTURE))))
                                   (JUSTIF JUSTIF)))))
              '(MTRANS
                (AGENT AGENT002)
                (RECIP RECIP001)
                (OBJECT (C-CAUSE
                         (ANTE ANTE001)
                         (CONSEQ (GOAL-FAILURE
                                  (AGENT AGENT003)
                                  (TIME (FUTURE))))
                         (JUSTIF JUSTIF001)))))

       (EQUAL (TOKENIZE 'AGENT) 'AGENT004)

       ))
