(setf FRM-1
      '(MTRANS (AGENT (HUMAN (GENDER (FEMALE))
                             (F-NAME (V NAME1))
                             (L-NAME (GRENTZ))))))
(setf FRM-2
      '(MTRANS (AGENT (HUMAN (F-NAME (SALLY))
                             (GENDER (V GEND1))
                             (L-NAME (GRENTZ))))
               (RECIP (HUMAN (GENDER (MALE))
                             (REL (SON (F-NAME (FREDDY))
                                       (OF (HUMAN (GENDER (FEMALE))
                                                  (F-NAME (SALLY))
                                                  (L-NAME (GRENTZ))))))
                             (AGE (TEEN))
                             (L-NAME (V L-NAME2))))))

(setf FRM-3
      '(MTRANS (AGENT (HUMAN (F-NAME (SALLY))
                             (GENDER (V GEND1))
                             (L-NAME (GRENTZ))))
               (RECIP (HUMAN (GENDER (MALE))
                             (REL (SON (F-NAME (FREDDY))
                                       (OF (HUMAN (GENDER (FEMALE))
                                                  (F-NAME (SALLY))
                                                  (L-NAME (GRENTZ))))))))))

(setf FRM-4
      '(MTRANS (AGENT (HUMAN (GENDER (FEMALE))
                             (F-NAME (SALLY))
                             (L-NAME (V L-NAME1))))
               (RECIP (HUMAN (GENDER (MALE))
                             (REL (SON (OF (V OF-1))))))))

(setf FR-L1
      '((MTRANS (AGENT (V X1))
                (RECIP (V Y1))
                (OBJECT (V OBJ1)))
        (BELIEVE (AGENT (V Y1))
                 (OBJECT (IS-LIAR (AGENT (V X1)))))))

(setf FR-L2
      '((BELIEVE (AGENT (HUMAN (F-NAME (SALLY))
                               (GENDER (FEMALE))))
                 (OBJECT (IS-LIAR (AGENT (HUMAN (F-NAME (HANK))
                                                (GENDER (MALE)))))))
        (STEALS (AGENT (HUMAN (F-NAME (HANK))
                              (GENDER (MALE))))
                (OBJECT (VEHICLE)))
        (MTRANS (AGENT (HUMAN (F-NAME (HANK))
                              (GENDER (MALE))))
                (OBJECT (BUY (AGENT (HUMAN (F-NAME (HANK))
                                           (GENDER (MALE))))
                             (OBJECT (DONUTS))
                             (TIME (FUTURE))))
                (RECIP (HUMAN (F-NAME (SALLY))
                              (GENDER (FEMALE)))))))

(setf FR-L3
      '((BELIEVE (AGENT (HUMAN (F-NAME (SALLY))
                               (GENDER (FEMALE))))
                 (OBJECT (IS-LIAR (AGENT (HUMAN (F-NAME (HANK))
                                                (GENDER (MALE)))))))
        (STEALS (AGENT (HUMAN (F-NAME (HANK))
                              (GENDER (MALE))))
                (OBJECT (VEHICLE)))
        (MTRANS (AGENT (HUMAN (F-NAME (FREDDY))
                              (GENDER (MALE))))
                (OBJECT (BUY (AGENT (HUMAN (F-NAME (FREDDY))
                                           (GENDER (MALE))))
                             (OBJECT (DONUTS))
                             (TIME (FUTURE))))
                (RECIP (HUMAN (F-NAME (SALLY))
                              (GENDER (FEMALE)))))))


(setf RULE-1 '((MTRANS (AGENT (V X1))
                       (RECIP (V Y1))
                       (OBJECT (V OBJ1)))
               (BELIEVE (AGENT (V Y1))
                        (OBJECT (IS-LIAR (AGENT (V X1)))))
               ===>
               (DOUBTS (AGENT (V Y1))
                       (OBJECT (V OBJ1)))))


(setf STORY-FACTS-1
      '((TELL (AGENT (SALLY))
              (RECIP (FREDDY))
              (OBJECT (C-CAUSE (AGENT (HANK))
                               (OBJECT (GOAL-FAIL-FOR
                                        (AGENT (FREDDY)))))))
        (TELL (AGENT (HANK))
              (RECIP (FREDDY))
              (OBJECT (WANT (AGENT (HANK))
                            (OBJECT (DONUTS)))))
        (ASK (AGENT (HANK))
             (RECIP (FREDDY))
             (OBJECT (PTRANS (AGENT (FREDDY))
                             (OBJECT (HANK))
                             (DESTIN (SEVN-ELVN))
                             (INSTRU (CAR2)))))
        (VEHICLE (IS (CAR1)))
        (VEHICLE (IS (CAR2)))
        (SNACK (IS (DONUTS)))
        (IN (AGENT (FREDDY))
            (OBJECT (CAR2)))
        (STEAL (OBJECT (CAR1))
               (AGENT (HANK)))
        (AT (AGENT (HANK))
            (LOC (SEVN-ELVN)))
        (HOLD (AGENT (HANK))
              (OBJECT (GUN)))))


(setf RULE-LIST-1
      '(((TELL (AGENT (V AG))
               (OBJECT (V OBJ))
               (RECIP (V RC))) ===> (KNOW (AGENT (V RC))
                                          (OBJECT (V OBJ))))

        ((STEAL (AGENT (V AG))
                (OBJECT (V OBJ)))
         (VALUABLE (IS (V OBJ))) ===> (CRIMINAL (IS (V AG))))

        ((VEHICLE (IS (V OBJ))) ===> (VALUABLE (IS (V OBJ))))

        ((ASK (AGENT (V AG))
              (OBJECT (PTRANS (AGENT (V RC))
                              (OBJECT (V AG))
                              (DESTIN (V ESTB))
                              (INSTRU (V VH))))
              (RECIP (V RC)))
         (VEHICLE (IS (V VH)))
         (IN (AGENT (V RC))
             (OBJECT (V VH)))
         ===> (COMPLY-REQ (AGENT (V RC))
                          (FROM (V AG))
                          (OBJECT (PTRANS (AGENT (V RC))
                                          (OBJECT (V AG))
                                          (DESTIN (V ESTB))
                                          (INSTRU (V VH))))))

        ((COMPLY-REQ (AGENT (V X))
                     (FROM (V Y))
                     (OBJECT (PTRANS (AGENT (V X))
                                     (OBJECT (V Y))
                                     (DESTIN (V Z))
                                     (INSTRU (V VH)))))
         (KNOW (AGENT (V X))
               (OBJECT (WANT (AGENT (V Y))
                             (OBJECT (V O)))))
         (SNACK (IS (V O))) ===> (BELIEVE
                                  (AGENT (V X))
                                  (OBJECT (WILL-BUY (AGENT (V Y))
                                                    (OBJECT (V O))
                                                    (FROM (V Z))))))

        ((AT (AGENT (V X))
             (LOC (V LC)))
         (HOLD (AGENT (V X))
               (OBJECT (GUN)))
         (CRIMINAL (IS (V X))) ===> (ROB (AGENT (V X))
                                         (OBJECT (V LC))))

        ((BELIEVE (AGENT (V AG1))
                  (OBJECT (WILL-BUY (AGENT (V AG2))
                                    (OBJECT (V THING))
                                    (FROM (V ESTB)))))
         (ROB (AGENT (V AG2))
              (OBJECT (V ESTB))) ===> (SURPRISED (AGENT (V AG1))))))


(load "hw3.lsp")
