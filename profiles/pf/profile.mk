
KERNCONF_MODULES_OVERRIDE+=	pf pflog pfsync

WORLD_SUBDIRS_SBIN+=	pfctl pflogd
# The pf packet filter consists of three devices:
#  The `pf' device provides /dev/pf and the firewall code itself.
#  The `pflog' device provides the pflog0 interface which logs packets.
#  The `pfsync' device provides the pfsync0 interface used for
#   synchronization of firewall state tables (over the net).

# Optional:
# For most NAT-configurations I think ftp-proxy is desired.
WORLD_SUBDIRS_USR_SBIN+= ftp-proxy
# ... which depends libprivateevent
WORLD_SUBDIRS_LIB+= libevent
