; COMMAND-LINE: --incremental
; EXPECT: sat
; EXPECT: sat
; EXPECT: sat
; EXPECT: sat
; EXPECT: sat
; EXPECT: sat
; EXPECT: sat
; EXPECT: unsat
; EXPECT: sat
; EXIT: 10
(set-logic QF_LRA)
(declare-fun x0 () Real)
(declare-fun x1 () Real)
(declare-fun x2 () Real)
(check-sat)
(push 1)
(check-sat)
(pop 1)
(assert (or (not (> (+ (* (- 45) x0 ) (* 2 x2 ) (* (- 18) x1 ) (* 12 x2 ) ) (- 39))) (not (< (+ (* 12 x1 ) (* (- 34) x2 ) (* (- 6) x2 ) (* (- 11) x1 ) ) 14)) ))
(assert (or (<= (+ (* (- 4) x0 ) (* (- 42) x2 ) (* (- 22) x0 ) ) 15) (not (= (+ (* (- 24) x0 ) (* (- 4) x2 ) ) (- 18))) (>= (+ (* 43 x2 ) (* (- 47) x1 ) (* 22 x0 ) (* 4 x1 ) ) (- 33)) ))
(assert (or (not (<= (+ (* (- 10) x0 ) (* (- 4) x0 ) (* 40 x0 ) ) 47)) (not (= (+ (* 8 x0 ) (* (- 35) x0 ) ) 6)) (not (< (+ (* 13 x1 ) (* (- 1) x2 ) (* 16 x2 ) (* 6 x1 ) ) (- 43))) ))
(assert (or (<= (+ (* 35 x2 ) (* 39 x0 ) (* 25 x1 ) (* 46 x0 ) ) 9) (= (+ (* (- 40) x2 ) (* (- 2) x2 ) (* 17 x2 ) (* (- 48) x1 ) ) 18) ))
(assert (or (> (+ (* (- 47) x2 ) (* (- 24) x2 ) (* (- 25) x0 ) ) 13) (= (+ (* (- 41) x2 ) (* (- 3) x0 ) (* (- 6) x2 ) ) (- 13)) ))
(check-sat)
(push 1)
(check-sat)
(pop 1)
(assert (= (+ (* (- 7) x2 ) (* 6 x0 ) ) (- 1)) )
(assert (or (> (+ (* 21 x0 ) (* (- 48) x0 ) (* (- 39) x0 ) (* (- 3) x2 ) ) (- 48)) (< (+ (* 12 x2 ) (* 26 x1 ) (* 40 x2 ) ) (- 10)) ))
(check-sat)
(push 1)
(assert (or (= (+ (* (- 23) x2 ) (* 31 x2 ) ) 23) (< (+ (* 26 x0 ) (* 45 x0 ) (* (- 17) x1 ) (* (- 38) x2 ) ) (- 31)) (not (>= (+ (* 21 x1 ) (* (- 12) x2 ) ) (- 38))) ))
(check-sat)
(push 1)
(assert (not (<= (+ (* 26 x1 ) (* (- 40) x1 ) (* 22 x0 ) ) 8)) )
(assert (or (not (>= (+ (* 20 x0 ) (* 0 x0 ) (* 29 x1 ) ) (- 14))) (< (+ (* 12 x1 ) (* (- 25) x2 ) ) (- 50)) ))
(check-sat)
(pop 1)
(assert (or (= (+ (* 37 x1 ) (* (- 10) x1 ) (* (- 50) x1 ) (* (- 15) x1 ) ) 21) (not (< (+ (* (- 27) x0 ) (* 4 x0 ) ) (- 8))) ))
(assert (or (= (+ (* 0 x1 ) (* (- 43) x0 ) (* 32 x1 ) (* 16 x0 ) ) 11) (not (> (+ (* 20 x2 ) (* (- 11) x2 ) (* (- 14) x0 ) ) (- 43))) (= (+ (* 30 x1 ) (* (- 18) x2 ) (* 0 x1 ) (* (- 32) x0 ) ) (- 5)) ))
(assert (> (+ (* 43 x2 ) (* (- 3) x0 ) ) 4) )
(assert (> (+ (* 44 x0 ) (* 4 x2 ) ) (- 41)) )
(check-sat)
(pop 1)
(assert (or (< (+ (* 17 x0 ) (* 11 x0 ) (* 45 x1 ) ) (- 38)) (> (+ (* 49 x1 ) (* (- 9) x2 ) (* 7 x2 ) (* 3 x2 ) ) (- 20)) (not (< (+ (* 10 x2 ) (* 31 x0 ) ) (- 38))) ))
(assert (not (>= (+ (* (- 43) x2 ) (* (- 8) x1 ) (* (- 8) x0 ) ) 34)) )
(assert (not (>= (+ (* (- 42) x1 ) (* (- 40) x0 ) (* (- 22) x0 ) (* (- 37) x2 ) ) 21)) )
(check-sat)
(push 1)
