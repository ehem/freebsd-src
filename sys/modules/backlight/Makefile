.PATH:	${SRCTOP}/sys/dev/backlight
KMOD=	backlight
SRCS=	backlight.c

SRCS+=	bus_if.h \
	device_if.h \
	opt_platform.h \
	backlight_if.h \
	backlight_if.c

EXPORT_SYMS=	YES

.include <bsd.kmod.mk>
