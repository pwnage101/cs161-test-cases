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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 2,3: C-GEN, DECIDE-PHR ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(print
 (list 'test-decide-phr

       (equal (DECIDE-PHR 'HUMAN HM-1 D-TREES-1)
              '(HANDSOME))

       (equal (DECIDE-PHR 'HUMAN HM-2 D-TREES-1)
              '(HOMELY))

       (equal (DECIDE-PHR 'INGEST SAMUEL-1 D-TREES-1)
              '(ATE))

       (equal (DECIDE-PHR 'INGEST SMOKE-3 D-TREES-1)
              '(SMOKED))

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

       (equal (C-GEN EAT-2 ENG-PATS D-TREES-1)
              '(THE UGLY MALE TOLD A PRETTY FEMALE THAT SAMUEL ATE DONUTS))

       (equal (C-GEN SMOKE-3 ENG-PATS D-TREES-1)
              '(SAMUEL SMOKED GAS AT SCHOOL))

       (equal (C-GEN LAP-1 ENG-PATS D-TREES-1)
              '(THE HANDSOME MALE TOLD A HOMELY FEMALE THAT THE DOG LAPPED
                UP A COKE))

       ))
