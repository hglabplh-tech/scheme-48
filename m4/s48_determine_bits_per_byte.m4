### s48_determine_bits_per_byte.m4 --- S48_DETERMINE_BITS_PER_BYTE macro  -*- Autoconf -*-
# serial 1
dnl
dnl
dnl Determines the number of bits per byte
AC_DEFUN([S48_DETERMINE_BITS_PER_BYTE], [dnl
AC_MSG_CHECKING(bits per byte)
     BITS_PER_BYTE=`expr 8`
	 AC_MSG_RESULT($BITS_PER_BYTE)
     AC_DEFINE_UNQUOTED(ac_cv_bits_per_byte, [8], [Check for the number of bits per byte])
])
### s48_determine_bits_per_byte.m4 ends here
