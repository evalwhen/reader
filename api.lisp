
(in-package #:reader)

(define-api reader/view (id) ()
  (let ((article (ensure-article id)))
    ;; (check-permission 'view article)
    (api-output (reformat-article article) :format "json")))

(defun reformat-article (article)
  (let ((table (make-hash-table :test 'eql)))
    (flet ((copy (field)
             (setf (gethash field table) (dm:field article field))))
      (mapcar #'copy '("_id" "title" "time" "author" "tags" "text" "format")))
    table))
