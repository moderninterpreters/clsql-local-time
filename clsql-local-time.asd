;;;; clsql-local-time.asd

(asdf:defsystem #:clsql-local-time
  :description "Describe clsql-local-time here"
  :author "Arnold Noronha <arnold@jipr.io>"
  :license  "MIT license"
  :version "0.0.1"
  :serial t
  :depends-on (#:clsql #:local-time)
  :components ((:file "package")
               (:file "clsql-local-time")))
