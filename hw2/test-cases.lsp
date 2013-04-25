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

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 2: RECALL-WPH ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 3: TOKENIZE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; There is no easy way of checking the correctness of TOKENIZE, so
;; just check it for yourself!

(print
 (list 'test-tokenize-1

       (TOKENIZE '(ST-CHANGE
                   (AGENT AGENT)
                   (FROM (ACQUAINT))
                   (TO (FRIEND
                        (OF OF)))))

       ))

(print
 (list 'test-tokenize-2

       (TOKENIZE '(MTRANS
                   (AGENT AGENT)
                   (RECIP RECIP)
                   (OBJECT (C-CAUSE
                            (ANTE ANTE)
                            (CONSEQ (GOAL-FAILURE
                                     (AGENT AGENT)
                                     (TIME (FUTURE))))
                            (JUSTIF JUSTIF)))))
       ))

(print
 (list 'test-tokenize-3

       (TOKENIZE 'AGENT)

       ))

;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 4: WK-MEM ;;
;;;;;;;;;;;;;;;;;;;;;;;

(EXT-WK-MEM '(framei1))

(print
 (list 'test-ext-wk-mem-1

       (EQUAL (list-length WK-MEM) 1)
       (EQUAL (nth 0 WK-MEM) '(framei1))

       ))

(EXT-WK-MEM '(framei2))

(print
 (list 'test-ext-wk-mem-2

       (EQUAL (list-length WK-MEM) 2)
       (EQUAL (nth 0 WK-MEM) '(framei1))
       (EQUAL (nth 1 WK-MEM) '(framei2))

       ))

