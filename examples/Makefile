include ../Makefile.common


####


MLS=self_contained_game.ml game.ml extended_game.ml
BYTES=$(MLS:ml=byte)
TARGETS=$(MLS:ml=js)
LIB=../src/raphael.cma


####


all: $(TARGETS)

%.js: %.byte
	$(JOO) -pretty $<

%.byte: %.ml $(LIB)
	$(OCAMLC) -linkpkg -o $@ -I ../src $(LIB) $<

clean:
	rm -f *.cm[io] $(BYTES) $(TARGETS)


