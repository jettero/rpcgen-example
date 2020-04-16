
%.h: %.x rpcgen.mk global.mk
	$(RPCGEN) -h $< | $(EXPAND) > $@
	@+$(REMAKE) notrack-$@

%_xdr.c: %.x rpcgen.mk global.mk
	$(RPCGEN) -c $< | $(EXPAND) > $@
	@+$(REMAKE) notrack-$@

%_clnt.c: %.x rpcgen.mk global.mk
	$(RPCGEN) -l $< | $(EXPAND) > $@
	@+$(REMAKE) notrack-$@


# start dumb
%_svc.c: dumb/%.x rpcgen.mk
	(cd dumb && rpcgen -a -C $*.x && $(EXPAND) < $@ > ../$@)
	@+$(REMAKE) notrack-$@ notrack-dumb

dumb/%.x: %.x rpcgen.mk
	mkdir -vp dumb/; cp $< dumb/

# rpcgen doesn't generate main() when -m is used… so we have to use -a (all)
# mode to get it.  if it wasn't for this nonsense, we could do the below
# instead of the above.
#
# %_svc.c: %.x rpcgen.mk
#     $(RPCGEN) -m $< | $(EXPAND) > $@
#     @+$(REMAKE) notrack-$@
#
# end dumb

%_server.c: %.x rpcgen.mk
	$(RPCGEN) -Ss $< | $(EXPAND) > $@
	@+$(REMAKE) notrack-$@

%_client.c: %.x rpcgen.mk
	$(RPCGEN) -Sc $< | $(EXPAND) > $@
	@+$(REMAKE) notrack-$@
