;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-47
  (:use)
  (:export
   :array? :make-array :make-shared-array :ac64 :ac32 :ar64 :ar32 :as64 :as32
   :as16 :as8 :au64 :au32 :au16 :au8 :at1 :array-rank :array-dimensions
   :array-in-bounds? :array-ref :array-set!))

(defpackage :srfi-47.internal
  (:use :srfi-47 :cl :fiveam :srfi-9)
  (:shadowing-import-from :srfi-23 :error)
  (:shadowing-import-from :srfi-47
                          :array-rank
                          :array-dimensions
                          :make-array )
  (:shadow :lambda :loop :assoc :map :member))
