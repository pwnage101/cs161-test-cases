(defvar C1 '(MTRANS (AGENT (HUMAN (GENDER (FEMALE))
			       (APPEARANCE (>NORM))
			       (AGE (<NORM))
			       (REF (INDEF))))
	     (RECIP (HUMAN (GENDER (MALE))
		     (F-NAME (JOHN))))
	     (OBJECT (INGEST (AGENT (HUMAN (GENDER (FEMALE))))
		      (OBJECT (FOOD (TYPE (APPLE))
				    (SIZE (>NORM))
				    (REF (DEFINITE))))
		      (TIME (PAST))))))

(defvar C1* '(MTRANS 
	     (RECIP (HUMAN (GENDER (MALE))
		     (F-NAME (JOHN))))
	     (AGENT (HUMAN (GENDER (FEMALE))
			       (APPEARANCE (>NORM))
			       (AGE (<NORM))
			       (REF (INDEF))))
	     (OBJECT (INGEST (AGENT (HUMAN (GENDER (FEMALE))))
		      (OBJECT (FOOD (SIZE (>NORM))
				    (TYPE (APPLE))
				    (REF (DEFINITE))))
		      (TIME (PAST))))))

(defvar C2 '(CAUSE
          (ANTE (INFORM (AGENT (HUMAN (F-NAME (FRED))
				       (GENDER (MALE))))
			 (RECIP (HUMAN (GENDER (FEMALE))
				       (F-NAME (BETTY))))
			 (OBJECT (STATE (VALUE (>NORM))
					(TYPE (APPEARANCE))
					(AGENT (HUMAN
						(GENDER (FEMALE))))))))
	   (CONSEQ (STATE (AGENT (HUMAN (GENDER (FEMALE))
					(F-NAME(BETTY))))
			  (VALUE (>>NORM))
			  (TYPE (HAPPY))))))

(defvar C3 '(PTRANS (AGENT AGENT0)
		 (OBJECT OBJECT0)
		 (SRC LOC0)
		 (DEST LOC1)
		 (INSTRU (MOVE (AGENT AGENT0)
			       (B-PART(LEGS))))))

(defvar F-NAME0 '(FRANK))

(defvar HUM1 '(HUMAN (F-NAME F-NAME0)
	       (GENDER (MALE))))

(defvar OBJECT0 HUM1)

(defvar AGENT0 HUM1)

(defvar LOC0 NIL)

(defvar LOC1 '(LOC (PROX (AUTO (OWNER AGENT1)))))

(defvar AGENT1 HUM1)
