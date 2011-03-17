include ../Makefile.common


####


MLS=raphael.ml
MLIS=$(MLS:ml=mli)
CMIS=$(MLS:ml=cmi)
CMOS=$(MLS:ml=cmo)

TARGET=raphael
DLL=dllraphael.so

CSOURCE=stubs.c
COBJ=stubs.o


####


all: $(TARGET)

$(TARGET): $(COBJ) $(CMOS)
	ocamlmklib -o $@ $^

$(DLL): $(CMA)

$(CMOS): $(CMIS)

%.cmo: %.ml
	$(OCAMLC) -g -c $<

%.cmi: %.mli
	$(OCAMLC) -g -c $<

#fake stubs generation, borrowed from js_of_ocaml's Makefiles
stubs.c:
	(echo "#include <stdlib.h>"; \
	echo "#include <stdio.h>"; \
	echo "#define D(f) void f () { fprintf(stderr, \"Unimplemented Javascript primitive %s!\\\\n\", #f); exit(1); }"; \
	(sed -n -e 's/.*external.*"\([^"%]*\)".*/D(\1)/p' \
	$(MLS) | \
	sort | uniq)) \
	> stubs.c

%.o: %.c
	ocamlfind ocamlc -package js_of_ocaml -c $<


clean:
	rm -f *.cm[ioa] *.so *.a $(CMOS) $(CMIS) $(DLL) $(CSOURCE) $(COBJ)

