include ../Makefile.common


####


MLS=attr.ml raphael.ml raffaello.ml
MLIS=$(MLS:ml=mli)
CMIS=$(MLS:ml=cmi)
CMOS=$(MLS:ml=cmo)

TARGET=raphael.cma


####


all: $(TARGET)

$(TARGET): $(CMOS)
	$(OCAMLC) -a -o $@ $^

$(CMOS): $(CMIS)

%.cmo: %.ml
	$(OCAMLC) -g -c $<

%.cmi: %.mli
	$(OCAMLC) -g -c $<



clean:
	rm -f *.cm[ioa] *.so *.a a.out $(CMOS) $(CMIS)

