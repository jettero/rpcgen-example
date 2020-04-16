%_xdr.o: %_xdr.c %.h obj.mk global.mk
	$(CC) $(CFLAGS) -c -o $@ $<

%_clnt.o: %_clnt.c %.h obj.mk global.mk
	$(CC) $(CFLAGS) -c -o $@ $<

%_svc.o: %_svc.c %.h obj.mk global.mk
	$(CC) $(CFLAGS) -c -o $@ $<

