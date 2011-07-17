; hello.ll

@hello = internal constant [18 x i8] c"Hello, LL Planets\00"

declare i32 @puts(i8*)

define i32 @main() {
start:
  %0 = call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @hello, i32 0, i32 0))
  ret i32 0
}

