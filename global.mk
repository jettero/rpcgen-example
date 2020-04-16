RPCGEN = rpcgen -C
REMAKE = make --no-print-directory
EXPAND = astyle -y -c -A2
# EXPAND = expand -tr

CFLAGS = -I/usr/include/tirpc
LDFLAGS = -ltirpc
