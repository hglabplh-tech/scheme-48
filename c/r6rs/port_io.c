/*
 * Part of Scheme 48 1.9.  See file COPYING for notices and license.
 *
 * Authors: Harald Glab-Plhak
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h> /* find out when to use ifdef in cause of windows */

/* The s48 header files */
#include "scheme48.h"
#include "scheme48vm.h"		/* ps_close_fd() */
#include "c-mods.h"
#include "unix.h"
#include "fd-io.h"
#include "io.h"
#include "port_io.h"


typedef struct _io_result {
    FILE* handle;
    long error_code;
    char* error_message;
} io_result;

/* our header to export and define interface */

/*
(open-file-input-port filename) procedure
(open-file-input-port filename file-options)
procedure
(open-file-input-port filename procedure
file-options buffer-mode)
(open-file-input-port filename procedure
file-options buffer-mode maybe-transcoder) */

static io_result make_io_result(FILE* handle, long err_return) {
        io_result* result = malloc(sizeof(io_result))
        result->handle = handle;
        result->error_code = err_return;
        result->error_message = ps_error_string(err_return);
        return result;
}

static s48_ref_t make_port_result(s48_call_t call, FILE* handle, long err_return) {
     io_result* result = make_io_result(handle, err_return);
     return s48_make_local_ref(call, (s48_value) result);
}



static s48_ref_t r6rs_open_file_input_port(s48_call_t call, s48_ref_t path,
            s48_ref_t file_options) {
    long length = s48_string_utf_8_length_2(call, sch_in);
    buffer = (char*)s48_make_local_buf(call, length);
    s48_copy_string_to_utf_8_2(call, sch_in, buffer);
    FILE* handle = ps_open_input_output_file(char *name, long *status);
    return make_port_result(call, handle, 0L);
}

static s48_ref_t r6rs_open_file_output_port(s48_call_t call, s48_ref_t path,
             s48_ref_t file_options) {
             // read write vector in read / wrie funs do it today
    long length = s48_string_utf_8_length_2(call, sch_in);
    buffer = (char*)s48_make_local_buf(call, length);
    s48_copy_string_to_utf_8_2(call, sch_in, buffer);
    FILE* handle = ps_open_output_file(char *name, long *status);
    return make_port_result(call, handle, 0L);
}

static s48_ref_t r6rs_open_file_input_output_port(s48_call_t call, s48_ref_t path,
                                                         s48_ref_t file_options) {
    long length = s48_string_utf_8_length_2(call, sch_in);
    buffer = (char*)s48_make_local_buf(call, length);
    s48_copy_string_to_utf_8_2(call, sch_in, buffer);
    FILE* handle = ps_open_input_output_file(char *name, long *status);
    return make_port_result(call, handle, 0L);
}



static s48_ref_t r6rs_close_file(s48_ref_t file_handle) {
    FILE* handle =  (FILE*)s48_deref(file_handle)
    long result = ps_close_fd(handle);
    return make_port_result(handle, result);
}

void s48_init_port_io(void)
{
  S48_EXPORT_FUNCTION(r6rs_open_file_output_port);
  S48_EXPORT_FUNCTION(r6rs_open_file_input_port);
  S48_EXPORT_FUNCTION(r6rs_open_file_input_output_port);
  S48_EXPORT_FUNCTION(r6rs_close_file);
}






