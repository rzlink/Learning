(defclass empty-object ()
  ())

(make-instance 'empty-object)

(make-instance (find-class 'empty-object))

(defclass 3d-point () (x y z))

(defstruct 3d-point-struct x y z)

(let ((a-point (make-instance '3d-point)))
  (setf (slot-value a-point 'x) 0)
  (slot-value a-point 'x))

(defclass 3d-point ()
  ((x :accessor point-x)
   (y :accessor point-y)
   (z :accessor point-z)))

(defclass 3d-point ()
  ((x :accessor point-x :initform 0 :initarg :x
      :documentation "x coordinate" :type real)
   (y :accessor point-y :initform 0 :initarg :y)
   (z :accessor point-z :initform 0 :initarg :z)))

(make-instance '3d-point :x 32 :y 17)

(let ((a-point (make-instance '3d-point)))
  (setf (point-x a-point) 0)
  (point-x a-point))

(defclass 3d-point ()
  ((x :reader get-x :writer set-x)
   (y :reader get-y :writer set-y)
   (z :reader get-z :writer set-z)))

(let ((a-point (make-instance '3d-point)))
  (set-z 3 a-point)
  (get-z a-point))

(defclass sphere ()
  ((x :accessor x)
   (y :accessor y)
   (z :accessor z)
   (radius :accessor radius)
   (volume :reader volume)
   (translate :writer translate)))

;;; Volume from Radius
(defmethod volume ((object sphere))
  (* 4/3 pi (expt (radius object) 3)))

;;; Radius to Volume
(defmethod radius ((new-radius number) (object sphere))
  (setf (slot-value object 'radius) new-radius)
  (setf (slot-value object 'volume)
        (* 4/3 pi (expt new-radius 3))))

(defclass 2d-object () ())

(defclass 2d-centered-object (2d-object)
  ((x :accessor x)
   (y :accessor y)
   (orientation :accessor orientation)))

(defclass oval (2d-centered-object)
  ((axis-1 :accessor axis-1)
   (axis-2 :accessor axis-2)))

(defclass regular-polygon (2d-centered-object)
  ((n-sides :accessor number-of-sides)
   (size :accessor size)))

(defparameter *my-special-variable* 17)

(defun show-my-special ()
  (declare (special *my-special-variable*))
  (print *my-special-variable*)
  nil)

(defun do-some-thing-else ()
  (show-my-special))

(defun dynamically-shadow-my-special ()
  (let ((*my-special-variable* 8))
    (do-some-thing-else))
  (show-my-special))
