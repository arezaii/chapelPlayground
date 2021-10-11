//use Help;

// config const help=false;

// proc main(args: [] string ) {
//   for arg in args do writeln(arg);
//   if help {
//     writeln("Help Message to User");
//   }
// }
use Help;
config const help = false;
if help then printUsage();

proc printUsage() {
  writeln("This is my custom usage message!");
  exit(0);
}