.include <src.opts.mk>

TAP_TESTS_C=	grp_test

.if ${MK_CASPER} != "no"
LIBADD+=	casper
LIBADD+=	cap_grp
CFLAGS+=-DWITH_CASPER
.endif
LIBADD+=	nv

.include <bsd.test.mk>
