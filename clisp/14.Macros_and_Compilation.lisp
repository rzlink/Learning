(defmacro simple-incf (var)
  (list 'setq var (list '+ var 1)))

(setf a 4)
(simple-incf a)

(defmacro simple-incf (var &optional (amount 1))
  (list 'setq var (list '+ var amount)))

(setf b 2)
(simple-incf b (* 3 a))

(defun print-age-greeting (age)
  (cond ((and (> age 5) (< age 10)) (print "hey kiddo"))
        ((and (> age 10) (< age 21)) (print "hey buddy"))
        (t (print "generic greeting"))))

(print-age-greeting 6)
(print-age-greeting 15)

(macroexpand '(cond ((and (> age 5) (< age 10)) (print "hey kiddo"))
        ((and (> age 10) (< age 21)) (print "hey buddy"))
        (t (print "generic greeting"))))

(macroexpand-1 '(dotimes (x 10) (print x)))

(DO ((X 0 (1+ X)))
    ((>= X 10) NIL)
  (DECLARE (TYPE UNSIGNED-BYTE X))
  (PRINT X))
