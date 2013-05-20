;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROBLEM 1: UNIFRAME ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(print
 (list 'test-uniframe

       (equal (UNIFRAME FRM-1 FRM-2 '(T))
              '(T (NAME1 (SALLY)) (GEND1 (FEMALE))))

       (equal (UNIFRAME FRM-2 FRM-1 '(T))
              nil)

       ))
