(print (list
	'test-filler
	
	(EQUAL (FILLER 'AGENT C1)
	       '(HUMAN (GENDER (FEMALE))
		 (APPEARANCE(>NORM))
		 (AGE (<NORM))
		 (REF (INDEF))))
	
	(EQUAL (FILLER 'SRC C1)
	       NIL)
	
	(EQUAL (FILLER 'OBJECT C1)
	       '(INGEST (AGENT (HUMAN (GENDER (FEMALE))))
		 (OBJECT (FOOD (TYPE (APPLE))
			  (SIZE (>NORM))
			  (REF (DEFINITE))))
		 (TIME (PAST))))
	
	(EQUAL (FILLER 'DEST C3)
	       'LOC1)
	
	(EQUAL (FILLER 'OWNER LOC1)
	       NIL)
	
	(EQUAL (FILLER 'PROX LOC1)
	       '(AUTO (OWNER AGENT1)))
	))

(print (list
	'test-path-sl
	
	(EQUAL (PATH-SL '(ANTE AGENT) C2)
	       '(HUMAN (F-NAME (FRED))
		 (GENDER (MALE))))
	
	(EQUAL (PATH-SL '(CONSEQ AGENT F-NAME) C2)
	       '(BETTY))
	
	(EQUAL (PATH-SL '(OBJECT AGENT F-NAME) C1)
	       NIL)
	
	(EQUAL (PATH-SL '(DEST) C3)
	       'LOC1)
	
	(EQUAL (PATH-SL '(F-NAME) HUM1)
	       'F-NAME0)
))

(print (list
	'test-path-ps
	
	(EQUAL (PATH-PS '(CAUSE CONSEQ STATE VALUE) C2)
	       '(>>NORM))
	
	(EQUAL (PATH-PS '(CAUSE TIME) C2)
	       NIL)
	
	(EQUAL (PATH-PS '(INFORM ANTE) C2)
	       'FAIL)
))

(print (list
	'test-gapvals
	
	(EQUAL (GAPVALS 'F-NAME0)
	       '(FRANK))
	
	(EQUAL (GAPVALS 'AGENT0)
	       '(HUMAN (F-NAME (FRANK))
		 (GENDER (MALE))))
	
	(EQUAL (GAPVALS C3)
	       '(PTRANS (AGENT (HUMAN (F-NAME (FRANK))
				(GENDER (MALE))))
			 (OBJECT (HUMAN (F-NAME (FRANK))
					(GENDER (MALE))))
		 (SRC ())
		 (DEST (LOC (PROX
			     (AUTO (OWNER
				    (HUMAN
				     (F-NAME (FRANK))
				     (GENDER (MALE))))))))
		 (INSTRU (MOVE (AGENT (HUMAN (F-NAME (FRANK))
					     (GENDER (MALE))))
			  (B-PART (LEGS))))))

	(EQUAL (GAPVALS C1)
	       C1)
))

(print (list
	'test-replace-sf

	(EQUAL (REPLACE-SF 'RECIP '(HUMAN) C1)
	       '(MTRANS (AGENT (HUMAN (GENDER (FEMALE))
				(APPEARANCE (>NORM))
				(AGE (<NORM))
				(REF (INDEF))))
		 (RECIP (HUMAN))
		 (OBJECT (INGEST (AGENT (HUMAN (GENDER (FEMALE))))
			  (OBJECT (FOOD (TYPE (APPLE))
					(SIZE (>NORM))
					(REF (DEFINITE))))
			  (TIME (PAST))))))

	 
	(EQUAL (REPLACE-SF 'TIME '(PAST) C3)
	       '(PTRANS (AGENT AGENT0)
		 (OBJECT OBJECT0)
		 (SRC LOC0)
		 (DEST LOC1)
		 (INSTRU (MOVE (AGENT AGENT0)
			  (B-PART (LEGS))))
		 (TIME (PAST))))
))

(print (list
	'test-replace-pth

	(EQUAL (REPLACE-PTH '(CONSEQ AGENT) '(HUMAN) C2)
	       '(CAUSE (ANTE
			(INFORM
			 (AGENT (HUMAN (F-NAME (FRED))
				       (GENDER (MALE))))
			 (RECIP (HUMAN (GENDER (FEMALE))
				       (F-NAME (BETTY))))
			 (OBJECT (STATE (VALUE (>NORM))
					(TYPE (APPEARANCE))
					(AGENT (HUMAN (GENDER (FEMALE))))))))
		 (CONSEQ (STATE (AGENT (HUMAN))
			  (VALUE (>>NORM))
			  (TYPE (HAPPY))))))
))

(print (list
	'test-compare-frms
))