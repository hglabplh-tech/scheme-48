; Part of Scheme 48 1.9.  See file COPYING for notices and license.

; Authors: Harald Glab-Plhak


;; lookup implementation of codecs by mike in r´text-codec.scm and look at usage of
;; these codecs in bytevector-string.scm

;; transcoder definitions
(define transcoder (make-enumeration '(elatin-1-codec eutf-8-codec eutf-16-codec)))

(define latin-1-codec
  (lambda ()

    ))

;;s48_copy_string_to_utf_8_n_2(s48_call_t call,
; s48_ref_t sch_s, long start, long count, char* s)
(define utf-8-codec
  (lambda (input)
    (external-s48-copy-string-to-utf-8-2 input 0)
    ))
(define utf-16-codec
  (lambda ()

    ))


;; look what else we need to be imported
(import-lambda-definition-2 external-s48-copy-string-to-utf-8-2 ;; change
  (string)
  "s48_copy_string_to_utf_8_2")

(import-lambda-definition-2 external-s48-copy-string-to-utf-16be ;; change
  (string)
  "s48_copy_string_to_utf_16be")

(import-lambda-definition-2 external-s48-copy-string-to-latin-1-2 ;; change
  (string)
  "s48_copy_string_to_latin_1_2")

(import-lambda-definition-2 external-s48-string-utf-8-length-2  ;; change
  (string)
  "s48_string_utf_8_length_2")

(import-lambda-definition-2 external-s48-string-utf-16be-length-2  ;; change
  (string)
  "s48_string_utf_16be_length_2")
