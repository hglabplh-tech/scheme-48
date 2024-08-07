;; Part of Scheme 48 1.9.  See file COPYING for notices and license.

;; Authors: Harald Glab-Plhak

;; test for the new ffi


(define-test-suite ffi-string-tests)
;; TODO: check if values are correct !!!!!
;; define -le for better understanding (fact is that utf-16-le is the default
;; for utf-16)
(define ffi-check-string-utf-16-le ffi-check-string-utf-16)

(define-test-case ffi-handle-utfXX-strings-test ffi-string-tests
  (let ((first-string "Gr��e")
         (second-string "Harry#the~+*?\n\rtestTheWest}][{][¢¢¶¡")
         (third-string "äöüß785123%&$/§!"))
    (let ((latin-1 (ffi-check-string-latin-1 first-string))
           (utf-8 (ffi-check-string-utf-8 first-string))
           (utf-16-le (ffi-check-string-utf-16-le first-string)))
      ;; check random values inside the generated vectors of the different
      ;; string types
      (check (eq? (byte-vector-ref latin-1 2) #x3f))
      (check (eq? (byte-vector-ref latin-1 3) #x3f))
      (check (eq? (byte-vector-ref utf-8 3) #xbf))
      (check (eq? (byte-vector-ref utf-8 5) #xef))
      ;; TODO: search the right values
      (check (eq? (byte-vector-ref utf-16-le 3) #x72))
      (check (eq? (byte-vector-ref utf-16-le 5) #xfd))
      )
    (let ((latin-1 (ffi-check-string-latin-1 second-string))
           (utf-8 (ffi-check-string-utf-8 second-string))
           (utf-16-le (ffi-check-string-utf-16-le second-string)))
      ;; check random values inside the generated vectors of the different
      ;; string types
      (check (eq? (byte-vector-ref latin-1 7) #x74))
      (check (eq? (byte-vector-ref latin-1 10) #xe2))
      (check (eq? (byte-vector-ref utf-8 12) #x5c))
      (check (eq? (byte-vector-ref utf-8 19) #x73))
      ;; TODO: search the right values
      (check (eq? (byte-vector-ref utf-16-le 20) #x00)) ;; Hash Tag #
      (check (eq? (byte-vector-ref utf-16-le 36) #x00)) ;; TILDE ~
      )
    (let ((latin-1 (ffi-check-string-latin-1 third-string))
           (utf-8 (ffi-check-string-utf-8 third-string))
           (utf-16-le (ffi-check-string-utf-16-le third-string)))
      ;; check random values inside the generated vectors of the different
      ;; string types
      (check (eq? (byte-vector-ref latin-1 2) #xcd))
      (check (eq? (byte-vector-ref latin-1 3) #xf3))
      (check (eq? (byte-vector-ref utf-8 3) #xc3))
      (check (eq? (byte-vector-ref utf-8 5) #xbc))
      ;; TODO: search the right values
      (check (eq? (byte-vector-ref utf-16-le 3) #xf6))
      (check (eq? (byte-vector-ref utf-16-le 5) #xfc))
      )
    ))
(define-test-case ffi-strings-test ffi-string-tests
  (let ((string "Gr��e"))
    (let ((latin-1 (ffi-check-string-latin-1 string))
           (utf-8 (ffi-check-string-utf-8 string)))
      (check (eq? (byte-vector-ref latin-1 2) 252))
      (check (eq? (byte-vector-ref latin-1 3) 223))
      (check (eq? (byte-vector-ref utf-8 3) 188))
      (check (eq? (byte-vector-ref utf-8 5) 159)))))
