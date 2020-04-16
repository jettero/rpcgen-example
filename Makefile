
include global.mk
include map.mk

default: $(SERVERS) $(CLIENTS)

%_server: %_server.c %_xdr.o %_svc.o Makefile
	$(CC) $(CFLAGS) $< -o $@ $*_svc.o $*_xdr.o $(LDFLAGS)

%_client: %_client.c %_xdr.o %_clnt.o Makefile
	$(CC) $(CFLAGS) $< -o $@ $*_clnt.o $*_xdr.o $(LDFLAGS)

include rpcgen.mk
include obj.mk

notrack-%: %
	@ if ! grep -qs $* .gitignore; then echo 'echo $* >> .gitignore'; echo $* >> .gitignore; fi

clean:
	git clean -dfx
