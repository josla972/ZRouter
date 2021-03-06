
fstype=cd9660
TDIR=/tmp/makefs_${fstype}_test
FBSD_MK=${FREEBSD_SRC_TREE}/share/mk

#makefs_${fstype}:
#	# Test if makefs accept ${fstype} filesystem
#	STATUS=`mkdir -p ${TDIR}/fsroot \ #
#	touch ${TDIR}/fsroot/test.file \ #
#	makefs -t ${fstype} ${TDIR}/fsroot.${fstype} ${TDIR}/fsroot || echo MAKEFS_FAIL=${fstype} \ #
#	rm -rf ${TDIR}`
#	echo ${STATUS}

makefs_ffs:	${ZTOOLS_PATH}/makefs

makefs_cd9660:	${ZTOOLS_PATH}/makefs

${ZTOOLS_PATH}/makefs:
	mkdir -p ${ZTOOLS_PATH}
	cd ${FREEBSD_SRC_TREE}/usr.sbin/makefs; \
	make -m${FBSD_MK} MAKEOBJDIRPREFIX=${MAKEOBJDIRPREFIX} DESTDIR=${ZTOOLS_PATH}; \
	make -m${FBSD_MK} MAKEOBJDIRPREFIX=${MAKEOBJDIRPREFIX} DESTDIR=${ZTOOLS_PATH} BINDIR= BINOWN=${OWN} BINGRP=${GRP} WITHOUT_MAN=yes WITHOUT_INFO=yes WITHOUT_NLS=yes install

${ZTOOLS_PATH}/mkuzip:
	mkdir -p ${ZTOOLS_PATH}
	cd ${FREEBSD_SRC_TREE}/usr.bin/mkuzip; \
	make -m${FBSD_MK} MAKEOBJDIRPREFIX=${MAKEOBJDIRPREFIX} DESTDIR=${ZTOOLS_PATH}; \
	make -m${FBSD_MK} MAKEOBJDIRPREFIX=${MAKEOBJDIRPREFIX} DESTDIR=${ZTOOLS_PATH} BINDIR= BINOWN=${OWN} BINGRP=${GRP} WITHOUT_MAN=yes WITHOUT_INFO=yes WITHOUT_NLS=yes install


