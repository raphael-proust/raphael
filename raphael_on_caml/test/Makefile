include ../Makefile.common


####


MLS=test.ml drawing.ml
BYTES=$(MLS:ml=byte)
TARGETS=$(MLS:ml=js)

DLL=../src/dllraphael.so


####


all: $(TARGETS)

%.js: %.byte
	$(JOO) -pretty $<

%.byte: %.ml $(DLL)
	$(OCAMLC) -linkpkg -o $@ -I ../src $(DLL) $<

clean:
	rm -f *.cm[io] $(BYTES) $(TARGETS)


