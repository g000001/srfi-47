;;;; srfi-47.asd -*- Mode: Lisp;-*-

(cl:in-package :asdf)

(defsystem :srfi-47
  :serial t
  :depends-on (:fiveam :srfi-9 :srfi-23 :srfi-4)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-47")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-47))))
  (load-system :srfi-47)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-47.internal :srfi-47))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
