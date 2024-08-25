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

/* our header to export and define interface */

/*
(open-file-input-port filename) procedure
(open-file-input-port filename file-options)
procedure
(open-file-input-port filename procedure
file-options buffer-mode)
(open-file-input-port filename procedure
file-options buffer-mode maybe-transcoder) */


static s48_ref_t r6rs_open_file_input_port(s48_call_t call, s48_ref_t path,
            s48_ref_t file_options) {
    FILE* handle = ps_open_input_output_file(char *name, long *status);
}

static s48_ref_t r6rs_open_file_output_port(s48_call_t call, s48_ref_t path,
             s48_ref_t file_options) {
    FILE* handle = ps_open_output_file(char *name, long *status);
}

static s48_ref_t r6rs_open_file_input_output_port(s48_call_t call, s48_ref_t path,
                                                         s48_ref_t file_options) {
    long length = s48_string_utf_8_length_2(call, sch_in);
    buffer = (char*)s48_make_local_buf(call, length);
    s48_copy_string_to_utf_8_2(call, sch_in, buffer);
    FILE* handle = ps_open_input_output_file(char *name, long *status);
}



void s48_init_port_io(void)
{
  S48_EXPORT_FUNCTION(r6rs_open_file_output_port);
  S48_EXPORT_FUNCTION(r6rs_open_file_input_port);
  S48_EXPORT_FUNCTION(r6rs_open_file_input_output_port);
}






