#-
# Copyright © 2024 Elliott Mitchell
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#

#include <sys/_cpuset.h>
#include <sys/bus.h>

#include <machine/interrupt.h>

INTERFACE pic;

HEADER {
	/* Flags for pic_disable_source() */
	enum {
		PIC_EOI,
		PIC_NO_EOI,
	};
};

CODE {
	static void
	null_pic_register_sources(x86pic_t pic)
	{
	}

	static int
	false_pic_source_pending(x86pic_t pic, struct intsrc *isrc)
	{
		return (0);
	}

	static void
	null_pic_suspend(x86pic_t pic)
	{
	}

	static void
	null_pic_resume(x86pic_t pic, bool suspend_cancelled)
	{
	}

	static void
	null_pic_reprogram_pin(x86pic_t pic, struct intsrc *isrc)
	{
	}
}

METHOD void register_sources {
	x86pic_t	pic;
} DEFAULT null_pic_register_sources;

METHOD void enable_source {
	x86pic_t	pic;
	struct intsrc	*isrc;
};

METHOD void disable_source {
	x86pic_t	pic;
	struct intsrc	*isrc;
	int		eoi;
};

METHOD void eoi_source {
	x86pic_t	pic;
	struct intsrc	*isrc;
};

METHOD void enable_intr {
	x86pic_t	pic;
	struct intsrc	*isrc;
};

METHOD void disable_intr {
	x86pic_t	pic;
	struct intsrc	*isrc;
};

METHOD int source_pending {
	x86pic_t	pic;
	struct intsrc	*isrc;
} DEFAULT false_pic_source_pending;

METHOD void suspend {
	x86pic_t	pic;
} DEFAULT null_pic_suspend;

METHOD void resume {
	x86pic_t	pic;
	bool suspend_cancelled;
} DEFAULT null_pic_resume;

METHOD int config_intr {
	x86pic_t	pic;
	struct intsrc	*isrc;
	enum intr_trigger	trigger;
	enum intr_polarity	polarity;
};

METHOD int assign_cpu {
	x86pic_t	pic;
	struct intsrc	*isrc;
	u_int		apic_id;
};

METHOD void reprogram_pin {
	x86pic_t	pic;
	struct intsrc	*isrc;
} DEFAULT null_pic_reprogram_pin;
