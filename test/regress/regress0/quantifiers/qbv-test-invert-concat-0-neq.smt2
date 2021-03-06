; COMMAND-LINE: --cbqi-bv --cbqi-bv-ineq=keep --no-cbqi-full
; EXPECT: unsat
(set-logic BV)
(set-info :status unsat)
(declare-fun a () (_ BitVec 8))
(declare-fun b () (_ BitVec 16))

(assert (forall ((x (_ BitVec 8))) (= (concat x a) b)))

(check-sat)
