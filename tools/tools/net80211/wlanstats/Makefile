.include <bsd.compiler.mk>

PROG=	wlanstats
BINDIR=	/usr/local/bin
MAN=
LIBADD=	bsdstat
CFLAGS+=-I${.CURDIR}/../../../../lib/libbsdstat/

SRCS=	wlanstats.c main.c

CFLAGS.clang+= -fbracket-depth=512 -Wno-cast-align

.include <bsd.prog.mk>
