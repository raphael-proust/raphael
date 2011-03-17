include ../Makefile.common


####


MLS=camltest.ml
BYTES=$(MLS:ml=byte)
TARGETS=$(MLS:ml=js)

DLL=../src/dllraphael.so


####


all: $(TARGETS)

%.js: %.byte
	$(JOO) $<

%.byte: %.ml
	$(OCAMLC) -linkpkg -o $@ -I ../src $(DLL) $<

clean:
	rm -f *.cm[io] $(BYTES) $(TARGETS)


