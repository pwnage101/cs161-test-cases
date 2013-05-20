(setq C-LX-1
      '(((THE) NIL ((D-ATTACH-SF AFT PHYS-OBJ REF (DEF))))
        ((BIG) (SIZE (VAL (>NORM))) ((D-ATTACH-SF AFT PHYS-OBJ SIZE (<NORM))))
        ((APPLE) (FRUIT (TYPE (APPLE))) NIL)
        ((APPLE PIE) (DESSERT) NIL)
        ((THE BIG APPLE) (NYC) NIL)))

(setq APS-1 '(THE APPLE WAS FOUND IN THE BIG APPLE))
(setq APS-2 '(APPLE WAS FOUND))
(setq APS-3 '(APPLE PIE IS TASTY))
(setq APS-4 '(THE BIG APPLE IS AN EXCITING PLACE))
(setq APS-5 '(CRAB APPLE))

(setq C-LX-2
      '(((FREDDY)
         (HUMAN (GENDER (MALE))
                (F-NAME (FREDDY))
                (L-NAME L-NAME))
         ((D-LAST-NAME 'L-NAME)))

        ((SALLY)
         (HUMAN (GENDER (FEMALE))
                (F-NAME (SALLY))
                (L-NAME L-NAME))
         ((D-LAST-NAME 'L-NAME)))

        ((HANK)
         (HUMAN (GENDER (MALE))
                (F-NAME (HANK))
                (L-NAME L-NAME))
         ((D-LAST-NAME 'L-NAME)))

        ((HAROLD)
         (HUMAN (GENDER (MALE))
                (F-NAME (HAROLD))
                (L-NAME L-NAME))
         ((D-LAST-NAME 'L-NAME)))

        ((WARNED)
         (MTRANS
          (AGENT AGENT)
          (RECIP RECIP)
          (OBJECT (C-CAUSE
                   (ANTE ANTE)
                   (CONSEQ (GOAL-FAILURE
                            (AGENT AGENT)
                            (TIME (FUTURE))))
                   (JUSTIF JUSTIF))))
         ((D-FILL '(AGENT) 'BEF 'HUMAN)
          (D-FILL '(RECIP) 'AFT 'HUMAN)
          (D-AFT-PRED '(OBJECT ANTE) 'INVOLVE '(ACT ST-CHANGE))
          (D-AFT-PRED '(OBJECT JUSTIF) 'REASON-FOR '(ACT))
          (D-SAME-BINDING '(RECIP) '(OBJECT CONSEQ AGENT))))

        ((HER)
         (PRONOUN (TYPE (POSS))
                  (REF REF))
         ((D-POSS-PRO-REF 'REF 'BEF '(GENDER) 'FEMALE)))

        ((TEENAGE)
         (AGE (VAL (TEEN)))
         ((D-ATTACH-SF 'AFT 'HUMAN 'AGE '(TEEN))))

        ((SON)
         (HUMAN
          (GENDER (MALE))
          (REL (SON (OF OF)))
          (F-NAME F-NAME))
         ((D-POSS-PRO 'BEF '(REL OF))
          (D-IMM-AFT 'F-NAME)))

        ((ABOUT) (INVOLVE) ())

        ((BECOMING FRIENDS)
         (ST-CHANGE
          (AGENT AGENT)
          (FROM (ACQUAINT))
          (TO (FRIEND (OF OF))))
         ((D-FILL '(AGENT) 'BEF 'HUMAN)
          (D-AFT-PRED '(TO OF) 'WITH '(HUMAN))))

        ((WITH) (WITH) ())

        ((BECAUSE) (REASON-FOR) ())

        ((HE)
         (HUMAN (GENDER (MALE))
                (F-NAME F-NAME))
         ((D-PRO-REF 'BEF 'GENDER 'MALE 'F-NAME)))

        ((HAD STOLEN)
         (STEAL
          (AGENT AGENT)
          (OBJECT OBJECT)
          (TIME (PAST)))
         ((D-FILL '(AGENT) 'BEF 'HUMAN)
          (D-FILL '(OBJECT) 'AFT 'PHYS-OBJ)))

        ((A) () ((D-ATTACH-SF 'AFT 'PHYS-OBJ 'REF '(INDEF))))

        ((CAR) (VEHICLE) ())))

(load "hw2.lsp")
