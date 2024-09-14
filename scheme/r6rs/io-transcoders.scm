; Part of Scheme 48 1.9.  See file COPYING for notices and license.

; Authors: Harald Glab-Plhak


;; lookup implementation of codecs by mike in r´text-codec.scm and look at usage of
;; these codecs in bytevector-string.scm

;; transcoder definitions
(define transcoder (make-enumeration '(elatin-1-codec eutf-8-codec eutf-16-codec)))
