%.bc:  %.ll
	llvm-as $< -o $@

hello:	hello.bc
	lli hello.bc

