; Part of Scheme 48 1.9.  See file COPYING for notices and license.

; Authors: Harald Glab-Plhak

(define os-enc (get-os-string-encoding))

;; define the file options via enums like defined for r6rs
(define file-options (make-enumeration '(no-create no-fail no-truncate)))

;; define the buffer modes via enums like defined for r6rs
(define buffer-modes (make-enumeration '(none block line)))

;; eol style definitions
(define eol-styles (make-enumeration '(none lf cr crlf nel crnel ls)))

(define native-eol-style
  (lambda ()
    ))

;; the default file options
(define *default-file-options* )
(define *default-buffer-mode* )
(define *default-eol-style* )
(define *default-transcoder* )

;;static s48_ref_t r6rs_open_file_input_port(s48_call_t call, s48_ref_t path,
;            s48_ref_t file_options, s48_ref_t buffer_mode,
;            s48_ref_t maybe_transcoder) {

(define open-file-input-port
  (opt-lambda (file-path ((file-options *default-file-options*)
                           (file-buffer-mode *default-file-options*)))
    (external-r6rs-open-file-input-port file-path os-enc )))

;;static s48_ref_t r6rs_open_file_output_port(s48_call_t call, s48_ref_t path,
;             s48_ref_t file_options, s48_ref_t buffer_mode,
;             s48_ref_t maybe_transcoder)

(define open-file-output-port
  (opt-lambda (file-path ((file-options *default-file-options*)))
    (external-r6rs-open-file-output-port file-path os-enc)))

;;static s48_ref_t r6rs_open_file_input_output_port(s48_call_t call, s48_ref_t path,
;                                                         s48_ref_t file_options, s48_ref_t buffer_mode,
;                                                         s48_ref_t maybe_transcoder) {
(define open-file-input-output-port
  (opt-lambda (file-path ((file-options *default-file-options*)))
    (external-r6rs-open-file-input-output-port file-path os-enc)))


;; the imports for externals
(import-lambda-definition-2 external-r6rs-open-file-input-port
  (double bytevect index)
  "r6rs_open_file_input_port")

(import-lambda-definition-2 external-r6rs-open-file-output-port
  (double bytevect index)
  "r6rs_open_file_output_port")

(import-lambda-definition-2 external-r6rs-open-file-input-output-port
  (double bytevect index)
  "r6rs_open_file_input_output_port")
