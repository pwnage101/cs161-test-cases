;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 1: UNIFRAME ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(print
 (list 'test-uniframe

       (null (set-exclusive-or (UNIFRAME FRM-1 FRM-2 '(T))
                               '(T (NAME1 (SALLY)) (GEND1 (FEMALE)))
                               :test #'equal))

       (equal (UNIFRAME FRM-2 FRM-1 '(T))
              nil)

       (null (set-exclusive-or (UNIFRAME FRM-4 FRM-3 '(T))
                               '(T (L-NAME1 (GRENTZ))
                                   (GEND1 (FEMALE))
                                   (OF-1 (HUMAN (GENDER (FEMALE))
                                                (F-NAME (SALLY))
                                                (L-NAME (GRENTZ)))))
                               :test #'equal))

       (equal (UNIFRAME FRM-3 FRM-4 '(T))
              nil)



       ))
