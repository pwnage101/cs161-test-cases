; CS 161 Spring 2013: HW1 skeleton

(defun cad-r (l) (cons (car l) (cddr l))) ; What, suddenly I'm the bad guy for
		      ; making unintuitive function names?
		      ; Meanwhile, caaddr is *totally* self-explanatory.

(defun mapcdr (f l) (cons (car l) (mapcar f (cdr l))))

; FUNCTION: FILLER
; PURPOSE:  Return the FILLER of the given SLOT in the given FRAME
; OUTPUT:   A FILLER (FRAME or GAP), according to slot in frame, or NIL if not
;           present
; INPUTS:   slot: atom
;           frame: FRAME

(defun FILLER (slot frame)
  (if (null (cdr frame)) nil
      (if (eq (caadr frame) slot)
	  (cadadr frame)
	  (FILLER slot (cad-r frame)))))

; -----------------------------------------------------------------------------

; FUNCTION: PATH-SL
; PURPOSE:  Return a FILLER accessed by following a path of named SLOTS within
;           the given CONCEPT
; OUTPUT:   FILLER of the CONCEPT at the given path, or NIL if not present
; INPUTS:   slots: list (path of SLOTs to follow)
;           concept: FRAME

(defun PATH-SL (slots concept)
  (if (null slots)
      concept
      (PATH-SL (cdr slots) (FILLER (car slots) concept))))

; -----------------------------------------------------------------------------

; FUNCTION: PATH-PS
; PURPOSE:  Return a FILLER accessed by following a path of predicate-slot
;           pairs, where each predicate in the concept must match the
;           predicates in the path. 
; OUTPUT:   FILLER of the CONCEPT at the given path. If any predicate fails to
;           match, return FAIL. If any SLOT in the path does not exist, return
;           NIL.
; INPUTS:   path: a list of alternating predicate names and slot names,
;           beginning with a PRED and ending with a SLOTh
;           concept: instantiated FRAME

(defun PATH-PS (path concept)
  (if (null path)
      concept
      (if (eq (car path) (car concept))
	  (if (null (cdr path))
	      NIL
	      (PATH-PS (cddr path) (FILLER (cadr path) concept)))
	  'FAIL)))

; -----------------------------------------------------------------------------

; FUNCTION: GAPVALS
; PURPOSE:  Return a FRAME which is a copy of the referenced frame, except that
;           any GAPs have been replaced by their values
; OUTPUT:   FRAME, with all GAPs replaced
; INPUTS:   frame: FRAME to evaluate GAPs in

(defun GAPVALS (frame)
  (if (listp frame)
      (if (null frame)
	  NIL
	  (mapcdr 'GAPVALS frame))
      (GAPVALS (eval frame))))

; -----------------------------------------------------------------------------

; FUNCTION: REPLACE-SF
; PURPOSE:  Return a FRAME which is a copy of the referenced frame, with the
;           designated SLOT filled in with the given FILLER (or added if the
;           SLOT does not exist)
; OUTPUT:   Copy of FRAME with the top-level SLOT slot filled with filler
; INPUTS:   slot: atom (name of slot to fill)
;           filler: FILLER (value to put in SLOT)
;           frame: FRAME (frame to be modified)

(defun kasdjhsdf (slot filler un-frame) 
  (if (null un-frame)
      (list (list slot filler))
      (if (eq slot (caar un-frame))
	  (cons (list slot filler) (cdr un-frame))
	  (cons (car un-frame) (kasdjhsdf slot filler (cdr un-frame))))))
; Would the function name be more clear if I had capitalized it? :P
  
(defun REPLACE-SF (slot filler frame)
  (cons (car frame) (kasdjhsdf slot filler (cdr frame))))

; -----------------------------------------------------------------------------

; FUNCTION: REPLACE-PTH
; PURPOSE:  Return a FRAME which is a copy of the reference frame, with the
;           SLOT given in the designated PATH filled in with the given FILLER
;           (or added if that SLOT does not exist)
; OUTPUT:   Copy of FRAME with SLOT in path filled with filler
; INPUTS:   path: list (path of SLOTS to follow)
;           filler: FILLER (value to put in SLOT referenced by path)
;           frame: FRAME (frame to be modified) 

(defun REPLACE-PTH (path filler frame)
  (if (null (cdr path))
      (replace-sf (car path) filler frame)
      (mapcdr #'(lambda (arg)
		  (if (eq (car arg) (car path))
		      (cons (car arg)
			    (list (replace-pth (cdr path)
					 filler (cadr arg))))
		      arg))
	      frame)))

; -----------------------------------------------------------------------------

; FUNCTION: COMPARE-FRMS
; PURPOSE:  Boolean predicate which compares two frames
; OUTPUT:   T if frames have same slot-filler structure (order may vary),
;           NIL otherwise
; INPUTS:   frame1: FRAME (first frame to compare)
;           frame2: FRAME (second frame to compare)

(defun IN-SETP (elem set)
  (if (null set)
      NIL
      (if (COMPARE-FRMS elem (car set))
	  t
	  (IN-SETP elem (cdr set)))))

(defun SET-EQUALP (set1 set2)
  (if (null set1) t
      (if (IN-SETP (car set1) set2)
	  (SET-EQUALP (cdr set1) set2)
	  NIL)))

(defun COMPARE-FRMS (frame1 frame2)
  (if (equal (car frame1) (car frame2))
      (set-equalp (cdr frame1) (cdr frame2))
      NIL))
