# $FreeBSD: tags/RELEASE_10_3_0/x11/pixman/Makefile 399873 2015-10-20 18:49:47Z jmmv $

PORTNAME=	pixman
PORTVERSION=	0.32.8
CATEGORIES=	x11
EXTRACT_SUFX=	.tar.bz2
MASTER_SITES=	http://distcache.FreeBSD.org/ports-distfiles/xorg/lib/

MAINTAINER=	x11@FreeBSD.org
COMMENT=	Low-level pixel manipulation library

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

#USES=		cpe perl5
#USE_PERL5=	build
#XORG_CAT=	lib
GNU_CONFIGURE=	yes

#CONFIGURE_ARGS=	--disable-gtk
CONFIGURE_ARGS+=--host=${ARCH}-portbld-freebsd

.if "${ZARCH}" == "arm.armv7"
CONFIGURE_ENV+= CCASFLAGS="${CFLAGS} -B${LOCALBASE}/bin -no-integrated-as"
LLD_UNSAFE=     yes
.endif

INSTALL_TARGET=	install-strip

# Build the library exclusively, thus disabling the demos and the tests (which
# do not get installed anyway).  This is to workaround a problem in powerpc64
# where the build of the tests crashes ld; see PR bin/202284.
MAKE_ARGS=      SUBDIRS=pixman

post-install:
	${INSTALL_LIB} ${STAGEDIR}${PREFIX}/lib/libpixman-1.so.32 ${ZPREFIX}/lib/
	cp -r ${STAGEDIR}${PREFIX}/include/pixman-1 ${ZPREFIX}/include/
	cd ${ZPREFIX}/lib;ln -s libpixman-1.so.32 libpixman-1.so

.include <bsd.port.mk>
