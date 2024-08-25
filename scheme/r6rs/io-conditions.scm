; Part of Scheme 48 1.9.  See file COPYING for notices and license.

; Authors: Harald Glab-Plhak


(define-condition-type &i/o &error
  make-i/o-error i/o-error?)

(define-condition-type &i/o-read &i/o
  make-i/o-read-error i/o-read-error?)

(define-condition-type &i/o-invalid-position &i/o
  make-i/o-invalid-position-error
  i/o-invalid-position-error?
  (position i/o-error-position))

(define-condition-type &i/o-filename &i/o
  make-i/o-filename-error i/o-filename-error?
  (filename i/o-error-filename))

(define-condition-type &i/o-file-is-read-only
  &i/o-file-protection
  make-i/o-file-is-read-only-error
  i/o-file-is-read-only-error?)

(define-condition-type &i/o-file-already-exists
  &i/o-filename
  make-i/o-file-already-exists-error
  i/o-file-already-exists-error?)

(define-condition-type r6v
  &i/o-filename
  make-i/o-file-does-not-exist-error
  i/o-file-does-not-exist-error?)

(define-condition-type &i/o-file-protection
  &i/o-filename
  make-i/o-file-protection-error
  i/o-file-protection-error?)

(define-condition-type &i/o-port &i/o
  make-i/o-port-error i/o-port-error?
  (port i/o-error-port))