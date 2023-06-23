(mapcar #'atom (list 1 '(2) "fool" nil))
 ; => (T NIL T T)

(mapcar #'+ (list 1 2 3) '(4 5 6))
 ; => (5 7 9)

(mapc #'(lambda (x y) (print (* x y))) '(1 0 2) '(3 4 5))

; 3
; 0
; 10  => (1 0 2)

(mapcar #'list '(1 2 3) '(4 5 6))
 ; => ((1 4) (2 5) (3 6))

(mapcan #'list '(1 2 3) '(4 5 6))
 ; => (1 4 2 5 3 6)

(mapcan #'(lambda (a b) (list (cons a b))) '(1 2 3) '(4 5 6))
 ; => ((1 . 4) (2 . 5) (3 . 6))


(mapcar #'(lambda (a b) (list (cons a b))) '(1 2 3) '(4 5 6))
 ; => (((1 . 4)) ((2 . 5)) ((3 . 6)))

(maplist #'(lambda (x) (format t "~&~A" x)) '(1 2 3 4 5))
; (1 2 3 4 5)
; (2 3 4 5)
; (3 4 5)
; (4 5)
; (5) => (NIL NIL NIL NIL NIL)

(mapcar #'(lambda (x) (format t "~&~A" x)) '(1 2 3 4 5))
; 1
; 2
; 3
; 4
; 5 => (NIL NIL NIL NIL NIL)

(maplist #'list '(1 2 3) '(4 5 6))
 ; => (((1 2 3) (4 5 6)) ((2 3) (5 6)) ((3) (6)))

(mapcar #'list '(1 2 3) '(4 5 6))
 ; => ((1 4) (2 5) (3 6))

(make-sequence 'list 3 :initial-element "foo")
 ; => ("foo" "foo" "foo")

(make-sequence 'vector 5 :initial-element 0)
 ; => #(0 0 0 0 0)

(make-array 5 :initial-element 0)
 ; => #(0 0 0 0 0)

(vector 0 0 0 0 0)
 ; => #(0 0 0 0 0)

(make-sequence 'string 5 :initial-element #\.)
 ; => "....."

(make-string 5 :initial-element #\.)
 ; => "....."

(mapcan #'(lambda (n) (when (evenp n) (list n))) '(1 2 3 4))
 ; => (2 4)

(remove nil (mapcar #'(lambda (n) (when (evenp n) n)) '(1 2 3 4)))
 ; => (2 4)

(elt '(1 2 3) 1)
 ; => 2 (2 bits, #x2, #o2, #b10)

(elt "abc" 1)
 ; => #\b

(elt (make-array 5 :initial-element 0) 1)
 ; => 0 (0 bits, #x0, #o0, #b0)

(elt (vector 1 2 3 4 5) 1)
 ; => 2 (2 bits, #x2, #o2, #b10)

(subseq '(1 2 3 4 5) 2)
 ; => (3 4 5)

(subseq '(0 1 2 3 4) 1 3)
 ; => (1 2)

(copy-seq '(1 2 3))
 ; => (1 2 3)

(copy-seq "abc")
 ; => "abc"

(length '(1 2 3))
 ; => 3 (2 bits, #x3, #o3, #b11)

(length "abc")
 ; => 3 (2 bits, #x3, #o3, #b11)

(count 3 '(1 2 3 3 4 5 3))
 ; => 3 (2 bits, #x3, #o3, #b11)

(count-if #'oddp '(1 2 3 4 5))
 ; => 3 (2 bits, #x3, #o3, #b11)

(count 3 '((1 2 3) (2 3 1) (3 1 2) (2 1 3) (1 3 2) (3 2 1)) :key #'second)
 ; => 2 (2 bits, #x2, #o2, #b10)

(count 3 '(1 2 3 4 5) :test #'<)
 ; => 2 (2 bits, #x2, #o2, #b10)

(remove 7 '(1 2 3 a b c t nil 7 0 7 7))
 ; => (1 2 3 A B C T NIL 0)

(substitute '(q) 7 '(1 2 3 a b c t nil 7 0 7 7 ))
 ; => (1 2 3 A B C T NIL (Q) 0 (Q) (Q))
(setf a '(1 1 1 2 3 3))

(remove-duplicates a)
 ; => (1 2 3)

a
 ; => (1 1 1 2 3 3)

(fill '(1 2 3 4 5) 7)
 ; => (7 7 7 7 7)

(fill '(1 2 3 4 5) '(a b))
 ; => ((A B) (A B) (A B) (A B) (A B))

(some #'(lambda (n) (or (< n 0) (> n 100))) '(0 1 99 100))
 ; => NIL

(every #'(lambda (w) (>= (length w) 5)) '("bears" "bulls" "racoon"))
 ; => T

(every #'(lambda (w) (>= (length w) 5)) '("bears" "cat" "racoon"))
 ; => NIL

(some #'> '(0 1 2 3 4 5) '(0 0 3 2 6))
 ; => T

(reduce #'+ '(1 2 3 4 5))
 ; => 15 (4 bits, #xF, #o17, #b1111)

(reduce #'- '(10 2 3 1))
 ; => 4 (3 bits, #x4, #o4, #b100)

;;; CONCATENATE: create new sequence
(concatenate 'list)
 ; => NIL

(concatenate 'vector)
 ; => #()

(concatenate 'list '(1 2 3) '(4 5))
 ; => (1 2 3 4 5)

(concatenate 'vector '(1 2 3) '(4 5))
 ; => #(1 2 3 4 5)

(concatenate 'vector #(1 2 3) #(4 5))
 ; => #(1 2 3 4 5)

(concatenate 'list #(1 2 3) '(4 5))
 ; => (1 2 3 4 5)

(concatenate 'vector '(1 2 3) #(4 5))
 ; => #(1 2 3 4 5)

(concatenate 'list "hello")
 ; => (#\h #\e #\l #\l #\o)

(find #\a "This is all about you, isn't it?")
 ; => #\a

(search "ab" "This is all about you, isn't it?")
 ; => 12 (4 bits, #xC, #o14, #b1100)

(sort '(9 3 5 4 8 7 1 2 0 6) #'>)
 ; => (9 8 7 6 5 4 3 2 1 0)

(merge 'vector '(1 3 5 7 9 8) (vector 2 6 4 7 0) #'>)
 ; => #(2 6 4 7 1 3 5 7 9 8 0)
