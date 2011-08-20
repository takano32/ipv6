%.bc:  %.ll
	llvm-as $< -o $@

all:	v6hack

hello:	hello.bc
	lli hello.bc

v6hack:	v6hack.rst
	landslide -i $<

