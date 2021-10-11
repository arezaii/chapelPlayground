use Help;

proc main(args: [] string) throws {
  for arg in args do writeln(arg);
}


/* Trying to determine how mason is getting a `--` passed to it
*  when all my testing seems to indicate that the `--` is consumed
*  by the chapel runtime
*
*  An example:
*  $./passThrough build -- --myPass=true
*
*  should result in:
*  ./passThrough
*  build
*  --
*  --myPass=true
*
*  Actual output is:
*  ./passThrough
*  build
*  --myPass=true
*
*/