/*
 * Part of Scheme 48 1.9.  See file COPYING for notices and license.
 *
 * Authors: Harald Glab-Plhak
 */
#include <stdio.h>
#ifdef _WIN32
    #include <io.h>
    #define F_OK 0
    #define access _access
#else
    #include <unistd.h>
#endif

#include "scheme48.h"
#include "scheme48vm.h"
#include "files.h"

static s48_ref_t r6rs_file_exists(s48_call_t call, s48_ref_t path){
    char* fname = ffi_string_to_utf_8(call, sch_string);
    if (access(fname, F_OK) == 0) {
        return s48_true_2(call);
    } else {
        return s48_false_2(call);
    }
}

static s48_ref_t r6rs_file_delete(s48_call_t call, s48_ref_t path){
    char* fname = ffi_string_to_utf_8(call, sch_string);
    if (access(fname, F_OK) == 0) {
        if (remove(fname) == 0) {
            return s48_true_2(call);
        }
        return s48_false_2(call);
    } else {
        return s48_false_2(call);
    }
}


void s48_init_files(void)
{
  S48_EXPORT_FUNCTION(r6rs_file_delete);
  S48_EXPORT_FUNCTION(r6rs_file_exists);

}
