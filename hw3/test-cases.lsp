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

       (null (set-exclusive-or (UNIFRAME FR-L1 FR-L2 '(T))
                               '(T (OBJ1 (BUY (AGENT (HUMAN (F-NAME (HANK))
                                                            (GENDER (MALE))))
                                              (OBJECT (DONUTS))
                                              (TIME (FUTURE))))
                                   (Y1 (HUMAN (F-NAME (SALLY)) (GENDER (FEMALE))))
                                   (X1 (HUMAN (F-NAME (HANK)) (GENDER (MALE)))))
                               :test #'equal))

       (equal (UNIFRAME FR-L2 FR-L1 '(T))
              nil)

       (null (set-exclusive-or (UNIFRAME (car (butlast (car RULE-LIST-1) 2))
                                         (car STORY-FACTS-1)
                                         '(T))
                               '(T (RC (FREDDY))
                                   (OBJ (C-CAUSE (AGENT (HANK))
                                                 (OBJECT (GOAL-FAIL-FOR
                                                          (AGENT (FREDDY))))))
                                   (AG (SALLY)))
                               :test #'equal))

       (null (set-exclusive-or (UNIFRAME '((STEAL (AGENT (V AG))
                                                  (OBJECT (V OBJ)))
                                           (VALUABLE (IS (V OBJ))))
                                         STORY-FACTS-1
                                         '(T))
                               nil
                               :test #'equal))

       (null (set-exclusive-or (UNIFRAME '((STEAL (AGENT (V AG))
                                                  (OBJECT (V OBJ)))
                                           (VEHICLE (IS (V CARV))))
                                         STORY-FACTS-1
                                         '(T))
                               '(T (AG (HANK)) (OBJ (CAR1)) (CARV (CAR1)))
                               :test #'equal))


       ))

(defun GETVARS (frame accu)
  (cond ((VARIABLEP frame) (cons (cadr frame) accu))
        ((FRAMEP frame) (GETVARS (cdr frame) accu))
        ((listp frame) (mapcan #'(lambda (x) (GETVARS x accu)) (cdr frame)))))

(setf SV-1 (STANDARDIZE-VVARS RULE-1))
(setf SV-2 (STANDARDIZE-VVARS RULE-1))
(setf SV-3 (STANDARDIZE-VVARS RULE-1))

(print
 (list 'standardize-vvars

       (null (intersection (GETVARS RULE-1 nil)
                           (GETVARS SV-1 nil)))

       (null (intersection (GETVARS SV-1 nil)
                           (GETVARS SV-2 nil)))

       (null (intersection (GETVARS RULE-1 nil)
                           (GETVARS SV-2 nil)))

))

(print
 (list 'subst-feta

       (equal (SUBST-FETA '(DOUBTS (AGENT (V Y1))
                                   (OBJECT (V OBJ1)))
                          '(T (Y1 (HUMAN (GENDER (FEMALE))
                                         (F-NAME (SALLY))))
                              (X1 (HUMAN (GENDER (MALE))
                                         (F-NAME (HANK))))
                              (OBJ1 (BUY (AGENT (HUMAN
                                                 (F-NAME (HANK))
                                                 (GENDER (MALE))))
                                         (OBJECT (DONUTS))
                                         (TIME (FUTURE))))))

              '(DOUBTS (AGENT (HUMAN (GENDER (FEMALE))
                                     (F-NAME (SALLY))))
                       (OBJECT (BUY (AGENT (HUMAN
                                            (F-NAME (HANK))
                                            (GENDER (MALE))))
                                    (OBJECT (DONUTS))
                                    (TIME (FUTURE))))))
       ))

(print
 (list 'ffinfer

       (null (set-exclusive-or (FFINFER STORY-FACTS-1 RULE-LIST-1 NIL)

                               '((KNOW (AGENT (FREDDY))
                                       (OBJECT (C-CAUSE (AGENT (HANK))
                                                        (OBJECT (GOAL-FAIL-FOR
                                                                 (AGENT (FREDDY)))))))
                                 (KNOW (AGENT (FREDDY))
                                       (OBJECT (WANT (AGENT (HANK))
                                                     (OBJECT (DONUTS)))))
                                 (VALUABLE (IS (CAR1)))
                                 (VALUABLE (IS (CAR2)))
                                 (CRIMINAL (IS (HANK)))
                                 (COMPLY-REQ (AGENT (FREDDY))
                                             (FROM (HANK))
                                             (OBJECT (PTRANS (AGENT (FREDDY))
                                                             (OBJECT (HANK))
                                                             (DESTIN (SEVN-ELVN))
                                                             (INSTRU (CAR2)))))
                                 (BELIEVE
                                  (AGENT (FREDDY))
                                  (OBJECT (WILL-BUY (AGENT (HANK))
                                                    (OBJECT (DONUTS))
                                                    (FROM (SEVN-ELVN)))))
                                 (ROB (AGENT (HANK))
                                      (OBJECT (SEVN-ELVN)))
                                 (SURPRISED (AGENT (FREDDY))))

                               :test #'equal))

       ))
