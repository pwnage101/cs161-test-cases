;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 1: ANSWER ;;
;;;;;;;;;;;;;;;;;;;;;;;

(print
 (list 'test-answer

       (null (set-exclusive-or (ANSWER Q2ACON EP-STMEM) A2ACON
                               :test #'equal))

       (null (set-exclusive-or (ANSWER Q5ACON EP-STMEM) A5ACON
                               :test #'equal))

       (null (set-exclusive-or (ANSWER Q18ACON EP-STMEM) A18ACON
                               :test #'equal))

       ))

(print
 (list 'test-c-gen

       (equal (C-GEN A2ACON ENG-PATS D-TREES-1)
              '(SALLY TOLD FREDDY THAT BECOMING FRIENDS WITH HANK COULD LEAD TO
                PROBLEMS FOR FREDDY BECAUSE HANK STOLE A CAR))

       (equal (C-GEN A5ACON ENG-PATS D-TREES-1)
              '(HANK ROBBED THE STORE OWNER HAROLD OF CASH USING A GUN))

       (equal (C-GEN A18ACON ENG-PATS D-TREES-1)
              '(HAROLD WAS VERY ANGRY BECAUSE HANK ROBBED THE STORE OWNER HAROLD
                OF CASH USING A GUN))

       ))


