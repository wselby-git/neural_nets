; Author: William Selby
; simple neural network in lisp

(defun neural-network (inputs weights)
  (let ((sum 0))
    (dotimes (i (length inputs))
      (setf sum (+ sum (* (nth i inputs) (nth i weights)))))
    (sigmoid sum)))

(defun sigmoid (x)
  (/ 1.0 (+ 1 (exp (- x)))))
