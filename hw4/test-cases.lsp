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
              '(SALLY TOLD FREDDY THAT BECOMING FRIENDS WITH HANK COULD LEAD TO PROBLEMS FOR FREDDY BECAUSE HANK STOLE A CAR))

       ))


