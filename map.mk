PROTO.x := $(wildcard *.x)
PROTO.h := $(PROTO.x:%.x=%.h)
XDR.c   := $(PROTO.x:%.x=%_xdr.c)
CLNT.c  := $(PROTO.x:%.x=%_clnt.c)
SVC.c   := $(PROTO.x:%.x=%_svc.c)

SERVER.c := $(PROTO.x:%.x=%_server.c)
CLIENT.c := $(PROTO.x:%.x=%_client.c)

SERVERS := $(PROTO.x:%.x=%_server)
CLIENTS := $(PROTO.x:%.x=%_client)
