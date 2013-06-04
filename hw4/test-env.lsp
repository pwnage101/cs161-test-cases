(setf Q2ACON
      '(MTRANS (AGENT (HUMAN (F-NAME (SALLY))))
               (OBJECT (V WHAT))
               (RECIP (HUMAN (F-NAME (FREDDY))))))

(setf Q5ACON
      '(ACT (IS (V WHAT))
            (AGENT (HUMAN (F-NAME (HANK))))
            (LOC (SEVN-ELEVN))))

(setf Q18ACON
      '(CAUSE (ANTE (V WHAT))
              (CONSEQ (EMOTION (AGENT (HUMAN (F-NAME (HAROLD))))
                               (IS (ANGER))))))

(setf A2ACON
      '(MTRANS (AGENT (HUMAN (F-NAME (SALLY))))
               (RECIP (HUMAN (F-NAME (FREDDY))))
               (OBJECT (C-CAUSE (ANTE (ST-CHANGE (TO (FRIENDS))
                                                 (WITH (HUMAN (F-NAME (HANK))))))
                                (CONSEQ (GOAL-FAILURE (AGENT (HUMAN (F-NAME (FREDDY))))))
                                (JUSTIF (STEAL (AGENT (HUMAN (F-NAME (HANK))))
                                               (OBJECT (VEHICLE (REF (INDEF))))))))))

(setf A5ACON
      '(ROB (RECIP (HUMAN (F-NAME (HAROLD))
                          (OWN (STORE (REF (DEF))))))
            (AGENT (HUMAN (F-NAME (HANK))))
            (OBJECT (CASH))
            (INSTRU (GUN (REF (INDEF))))
            (LOC (SEVN-ELEVN))))

(setf A18ACON
      '(CAUSE (ANTE (ROB (RECIP (HUMAN (F-NAME (HAROLD))
                                       (OWN (STORE (REF (DEF))))))
                         (AGENT (HUMAN (F-NAME (HANK))))
                         (OBJECT (CASH))
                         (INSTRU (GUN (REF (INDEF))))))
              (CONSEQ (EMOTION (IS (ANGER))
                               (AGENT (HUMAN (F-NAME (HAROLD))))
                               (VAL (>NORM))))))

(setf EP-STMEM '(A2ACON A5ACON A18ACON))

(setf LAP-1
      '(MTRANS (AGENT (HUMAN (REF (DEF))
                             (APPEARANCE (>NORM))
                             (GENDER (MALE))))
               (RECIP (HUMAN (REF (INDEF))
                             (APPEARANCE (<NORM))
                             (GENDER (FEMALE))))
               (OBJECT (INGEST (AGENT (CANINE (REF (DEF))))
                               (OBJECT (LIQUID (IS (COKE))
                                               (REF (INDEF))))))))

(setf EAT-2
      '(MTRANS (AGENT (HUMAN (REF (DEF))
                             (APPEARANCE (<NORM))
                             (GENDER (MALE))))
               (RECIP (HUMAN (REF (INDEF))
                             (APPEARANCE (>NORM))
                             (GENDER (FEMALE))))
               (OBJECT (INGEST (AGENT (HUMAN (F-NAME (SAMUEL))))
                               (OBJECT (FOOD (IS (DONUTS))))))))

(setf SMOKE-3
      '(INGEST (AGENT (HUMAN (F-NAME (SAMUEL))))
               (OBJECT (GAS))
               (DESTIN (LUNGS))
               (LOC (SCHOOL))))

;; (setf ENG-PATS
;;       '(
;;         (MTRANS (AGENT (PHR (TOLD)) RECIP (PHR (THAT)) OBJECT))
;;         (ROB (AGENT (PHR (robbed)) RECIP (PHR (OF)) OBJECT (PHR (USING)) INSTRU))
;;         (STEAL (AGENT (PHR (STOLE)) OBJECT))
;;         (C-CAUSE (ANTE (PHR (COULD LEAD TO)) CONSEQ (PHR (BECAUSE)) JUSTIF))
;;         (ST-CHANGE ((PHR (BECOMING)) TO (PHR (WITH)) WITH))
;;         (GOAL-FAILURE ((PHR (PROBLEMS FOR)) AGENT))
;;         (CAUSE (CONSEQ (PHR (BECAUSE)) ANTE))
;;         (EMOTION (AGENT (PHR (WAS)) VAL IS))
;;         (ANGER ((PHR (ANGRY))))
;;         (>NORM ((PHR (VERY))))
;;         (HUMAN (REF (DECIDE HUMAN) GENDER OWN F-NAME))
;;         (STORE (REF (PHR (STORE OWNER))))
;;         (CANINE (REF (PHR (DOG))))
;;         (GUN (REF (PHR (GUN))))
;;         (INGEST (AGENT (DECIDE INGEST) OBJECT LOC))
;;         (COKE (REF (PHR (COKE))))
;;         (CANINE (REF (PHR (DOG))))
;;         (FOOD (IS))
;;         (SCHOOL ((PHR (AT SCHOOL))))
;;         (VEHICLE (REF (PHR (CAR))))
;;         (INDEF ((PHR (A))))
;;         (DEF (PHR (THE)))
;;         (LIQUID (REF IS))
;;         (GAS ())
;;         ))

(setf ENG-PATS
      '(
        (MTRANS (AGENT (PHR (TOLD)) RECIP (PHR (THAT)) OBJECT))
        (ROB (AGENT (PHR (ROBBED)) RECIP (PHR (OF)) OBJECT (PHR (USING)) INSTRU))
        (STEAL (AGENT (PHR (STOLE)) OBJECT))
        (C-CAUSE (ANTE (PHR (COULD LEAD TO)) CONSEQ (PHR (BECAUSE)) JUSTIF))
        (ST-CHANGE ((PHR (BECOMING)) TO (PHR (WITH)) WITH))
        (GOAL-FAILURE ((PHR (PROBLEMS FOR)) AGENT))
        (CAUSE (CONSEQ (PHR (BECAUSE)) ANTE))
        (EMOTION (AGENT (PHR (WAS)) VAL IS))
        (ANGER ((PHR (ANGRY))))
        (>NORM ((PHR (VERY))))
        (HUMAN (REF (DECIDE HUMAN) GENDER OWN F-NAME))
        (STORE (REF (PHR (STORE OWNER))))
        (CANINE (REF (PHR (DOG))))
        (GUN (REF (PHR (GUN))))
        (INGEST (AGENT (DECIDE INGEST) OBJECT LOC))
        (COKE (REF (PHR (COKE))))
        (CANINE (REF (PHR (DOG))))
        (FOOD (IS))
        (SCHOOL ((PHR (AT SCHOOL))))
        (VEHICLE (REF (PHR (CAR))))
        (INDEF ((PHR (A))))
        (DEF ((PHR (THE))))
        (LIQUID (REF IS))
        (GAS ())
        ))


(setf D-TREES-1
      '((HUMAN
         (GENDER
          (MALE (APPEARANCE
                 (>NORM (PHR (HANDSOME)))
                 (<NORM (PHR (UGLY)))))
          (FEMALE (APPEARANCE
                   (>NORM (PHR (PRETTY)))
                   (<NORM (PHR (HOMELY)))))))
        (INGEST (OBJECT
                 (LIQUID (AGENT (CANINE (PHR (LAPPED UP)))
                                (HUMAN (PHR (DRANK)))))
                 (FOOD (AGENT (HUMAN (PHR (ATE)))))
                 (GAS (AGENT (HUMAN
                              (DESTIN (LUNGS (PHR (SMOKED)))))))))
        ))

(setf HM-1
      '(HUMAN (REF (DEF))
              (APPEARANCE (>NORM))
              (GENDER (MALE))))

(setf HM-2
      '(HUMAN (REF (INDEF))
              (APPEARANCE (<NORM))
              (GENDER (FEMALE))))

(setf SAMUEL-1
      '(INGEST (AGENT (HUMAN (F-NAME (SAMUEL))))
               (OBJECT (FOOD (IS (DONUTS))))))

(setf SMOKE-3
      '(INGEST (AGENT (HUMAN (F-NAME (SAMUEL))))
               (OBJECT (GAS))
               (DESTIN (LUNGS))
               (LOC (SCHOOL))))

(load "hw4.lsp")
