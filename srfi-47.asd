;;;; srfi-47.asd -*- Mode: Lisp;-*-

(cl:in-package :asdf)


(defsystem :srfi-47
  :version "20200311"
  :description "SRFI 47 for CL: Array"
  :long-description "SRFI 47 for CL: Array
https://srfi.schemers.org/srfi-47"
  :author "Aubrey Jaffer"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (:fiveam :srfi-9 :srfi-23 :srfi-4)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-47")
               (:file "test")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-47))))
  (let ((name "https://github.com/g000001/srfi-47")
        (nickname :srfi-47))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-47))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-47#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-47)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))


;;; *EOF*
