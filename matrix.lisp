(format t "vector is a list.")
(format t "matric is a list of vector.")
(format t "a vector in a matrix is a row.")
(defun vecp (object)
  (listp object))
(defun matp (object)
  (and (listp object)
       (every #'(lambda (element) (vecp element)) object)))
(defun sqrp (matrix)
  (let ((n (length matrix)))
    (and (matp matrix)
	 (every #'(lambda (vector) (= (length vector) n)) matrix))))
(defun vec+ (&rest vectors)
  (cond ((null vectors) null)
	((

      
