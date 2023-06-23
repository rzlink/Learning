(setf *total-glasses* 0)

(defun sell (n)
  "Ye Olde Lemonade Stand: Sales by the Glass."
  (setf *total-glasses* (+ *total-glasses* n))
  (format t
          "~&That make ~S glasses so far today."
          *total-glasses*))

;;; 10.1
(defun sell (n)
  "Ye Olde Lemonade Stand: Sales by the Glass."
  (incf *total-glasses* n))

;;; 10.3.2 The PUSH and POP Macros
(defvar mystack nil)
(push 'dish1 mystack)
(push 'dish2 mystack)
(push 'dish3 mystack)

(pop mystack)

(let ((top-element (first mystack)))
  (setf mystack (rest mystack))
  top-element)

(defvar *friends* nil)

(defun meet (person)
  (cond ((equal person (first *friends*))
         'we-just-met)
        ((member person *friends*)
         'we-know-each-other)
        (t (push person *friends*)
           'pleased-to-meet-you)))

(meet 'fred)
(meet 'cindy)
(meet 'cindy)
(meet 'joe)

*friends*
*total-count*

;;; 10.3
(defvar *total-count* 0)
(defun meet (person)
  (cond ((equal person (first *friends*))
         'we-just-met)
        ((member person *friends*)
         'we-know-each-other)
        (t (push person *friends*)
           (incf *total-count*)
           'pleased-to-meet-you)))

;;; 10.4
(defun forget (person)
  (cond ((member person *friends*)
         (setf *friends* (remove person *friends*))
         'forget)
        (t `(dont know ,person))))

(forget 'fred1)

;;; 10.3.3 Updating Local Variables
(defun bad-style (n)
  (format t "~&N is ~S." n)
  (decf n 2)
  (format t "~&Now N is ~S." n)
  (decf n 2)
  (format t "~&Now N is ~S." n)
  `(result is ,(* n (- n 1))))

(bad-style 9)

(defun good-style (n)
  (let* ((p (- n 2))
         (q (- p 2)))
    (format t "~&N is ~S." n)
    (format t "~&P is ~S." p)
    (format t "~&Q is ~S." q)
    `(result is ,(* q (- q 1)))))

(good-style 9)

(defun get-name ()
  (let ((last-name nil)
        (first-name nil)
        (middle-name nil)
        (title nil))
    (format t "~&Last name? ")
    (setf last-name (read))
    (format t "~&First name? ")
    (setf first-name (read))
    (format t "~&Middle name or initial? ")
    (setf middle-name (read))
    (format t "~&Preferred title? ")
    (setf title (read))
    `(,title ,first-name ,middle-name ,last-name)))

(defun picky-multiple (x y)
  "Computes X times Y.
   Input X must be odd; Y must be even."
  (unless (oddp x)
    (incf x)
    (format t
            "~&Changing X to ~S to make it odd." x))
  (when (oddp y)
    (decf y)
    (format t
            "~&Changing Y to ~S to make it even." y))
  (* x y))

(picky-multiple 4 6)
(picky-multiple 2 9)

;;; GENERALIZED VARIABLES
(setf x '(jack benny was 39 for many years))

(setf (sixth x) 'several)

(decf (fourth x) 2)

(defun good (x y)
  (let* ((large (if (> x y) x y))
         (avg (/ (+ x y) 2.0))
         (pct (* 100 (/ avg large))))
    `(average ,avg is ,pct percentage of max ,large)))
