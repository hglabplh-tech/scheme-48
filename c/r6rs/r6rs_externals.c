/*
 * Part of Scheme 48 1.9.  See file COPYING for notices and license.
 *
 * Authors: Harald Glab-Plhak, Mike Sperber
 */

extern void s48_init_ieee_bytevect(void);
extern void s48_init_files(void);
extern void s48_init_port_io(void);

void s48_on_load(void)
{
  s48_init_ieee_bytevect();
  s48_init_files();
  s48_init_port_io();
}
