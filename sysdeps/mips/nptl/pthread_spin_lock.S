/* Copyright (C) 2005 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library.  If not, see
   <http://www.gnu.org/licenses/>.  */

#include <sys/asm.h>
#include <sysdep.h>
#include <sgidefs.h>

ENTRY (pthread_spin_lock)
	.set	push
#if _MIPS_SIM == _ABIO32
	.set	mips2
#endif
1:	ll	a2, 0(a0)
	li	a1, 1
	bnez	a2, 1b
	sc	a1, 0(a0)
	beqz	a1, 1b
	MIPS_SYNC
	.set	pop
	li	v0, 0
	ret
PSEUDO_END (pthread_spin_lock)
