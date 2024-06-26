### s48_determine_pointer_size.m4 --- S48_DETERMINE_POINTER_SIZE macro  -*- Autoconf -*-
# serial 1
dnl
dnl
dnl Determines the size of a pointer.
AC_DEFUN([S48_DETERMINE_POINTER_SIZE], [dnl
dnl Our own version of AC_CHECK_SIZEOF([void *])
AC_MSG_CHECKING(size of void *)
     SIZEOF_VOID_P=$((`getconf LONG_BIT` / 8))
     AC_MSG_RESULT($SIZEOF_VOID_P)
     AC_DEFINE_UNQUOTED(ac_cv_sizeof_void_p, [$SIZEOF_VOID_P], [Check for sizeof (void *)])
])
### s48_determine_pointer_size.m4 ends here
