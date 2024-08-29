(defun range-rec (times ele iter-f)
  (if (= times 0)
      nil
      (cons ele (range-rec (- times 1) (funcall iter-f ele) iter-f)))) 
(defun range (initial times &optional (way-of-iter #'1+))
  (range-rec times initial way-of-iter))
(defun range-iter (initial times &optional (way-of-iter #'1+))
  (reverse (do ((i times (- i 1))
		(content initial (funcall way-of-iter content))
		(res nil (cons content res)))
	       ((= i 0) res))))
(defun dividep (number divisor)
  (= 0 (rem number divisor)))
(defun primep (number)
  (if (= number 1)
      nil
      (do ((i 2 (1+ i)))
	  ((or (< number (* i i)) (dividep number i)) (< number (* i i))))))
(defun miller-rabin-p (number &optional (acc 1))
  ())
(defun atomp (object)
  (not (listp object)))
(defun sqr (x)
  (* x x))
(defun distance (point1 point2)
  (if (and (numberp point1)
	   (numberp point2))
      (abs (- point1 point2))
      (sqrt (reduce #'+ (mapcar #'(lambda (x y) (sqr (- x y))) point1 point2)))))
(defun int/ (a b)
  (multiple-value-bind (quotient) (floor (/ a b))
    quotient))
(defun pow-b-sqr (x n &optional (mod nil))
  (if (= n 0)
      1
      (if (evenp n)
	  (if mod
	      (rem (sqr (pow-b-sqr x (/ n 2))) mod)
	      (sqr (pow-b-sqr x (/ n 2))))
	  (if mod
	      (rem (* x (sqr (pow-b-sqr x (int/ n 2)))) mod)
	      (* x (sqr (pow-b-sqr x (int/ n 2))))))))
(defun leap-yearp (year)
  (or (dividep year 400)
      (and (not (dividep year 100))
	   (dividep year 4))))
(defun +mod (a b &key (mod 2147483648))
  (rem (+ a b) mod))
(defun rad->deg (rad)
  (* (/ rad pi) 180))
(defun num->dig (num)
  (do ((res nil (cons (rem n 10) res))
       (n num (int/ n 10)))
      ((= n 0) res)))
(format t "include:~{~%~t~t~a~};"
	(list 'range
	      'range-iter
	      'dividep
	      'primep
	      'atomp
	      'sqr
	      'distance
	      'int/
	      'pow-b-sqr
	      'leap-yearp
	      '+mod
	      'rad->deg
	      'num->dig))
