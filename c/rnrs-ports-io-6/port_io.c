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
#include "posix.h"
#include "c-mods.h"
#include "unix.h"
#include "fd-io.h"
#include "io.h"

/* our header to export and define interface */
#include "port_io.h"





