;;;; clsql-local-time.lisp

(in-package #:clsql-local-time)

(defmethod clsql-sys:read-sql-value (val (type (eql 'local-time:timestamp))  database db-type)
  (let ((wall-time (clsql-sys:parse-timestring val)))
    (multiple-value-bind (usec sec min hour day month year dow)
        (clsql-sys:decode-time wall-time)
      (let ((ret (local-time:encode-timestamp (* usec 1000) sec min hour day month year :timezone local-time:+utc-zone+)))
        ret))))

(defmethod clsql-sys::database-output-sql ((time local-time:timestamp) database)
  (clsql-sys::database-output-sql (local-time:format-timestring nil time :format '(:year "-" :month "-" :day " " :hour ":" :min ":" :sec " " :timezone ) :timezone local-time:+utc-zone+) database))

(defmethod clsql-sys:database-get-type-specifier ((type (eql 'local-time:timestamp)) args database db-type)
  (clsql-sys:database-get-type-specifier 'clsql:wall-time args database db-type))
