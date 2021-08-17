use UnitTest;


proc test1(test: borrowed Test) throws {
  var parser = new M.argumentParser();
  var argList = ["progName","badArg1","--BadFlag","-n=twenty"];
  parser.parseArgs(argList);
}

proc test2(test: borrowed Test) throws {
  var parser = new M.argumentParser();
  var argList = ["progName","badArg1","--BadFlag","-n=twenty"];
  parser.parseArgs(argList);
}

proc test3(test: borrowed Test) throws {
  var parser = new M.argumentParser();
  var argList = ["progName","badArg1","--BadFlag","-n=twenty"];
  parser.parseArgs(argList);
}

proc test4(test: borrowed Test) throws {
  var parser = new M.argumentParser();
  var argList = ["progName","badArg1","--BadFlag","-n=twenty"];
  parser.parseArgs(argList);
}

UnitTest.main();

module M {

  use List;
  use Map;

  var parser = new argumentParser();
  var argList = ["progName","badArg1","--BadFlag","-n=twenty"];
  parser.parseArgs(argList);

  parser.parseArgs(argList);
  parser.parseArgs(argList);
  parser.parseArgs(argList);

  record argumentParser {

      proc parseArgs(in arguments:[?argsD] string) {
        compilerAssert(argsD.rank==1, "parseArgs requires 1D array");
        writeln("Begin parsing args...");
        writeln("args: " + arguments:string +" argsD = " + argsD:string);
        var k = 0;
        // identify optionIndices where opts start
        var optionIndices : map(int, string);
        var argsList = new list(arguments[argsD.low+1..]);
        var rest = new list(string);
        var endPos = 0;

        for i in argsD.low+1..argsD.high {
          writeln("i = " + i:string +" argsD = " + argsD:string);
          const arrElt = arguments[i];
          //if _subcommands.contains(arrElt) then break;
          // look for = sign after opt, split into two elements
          if arrElt.startsWith("-") && arrElt.find("=") > 0 {
            var elems = new list(arrElt.split("=", 1));
            // replace this opt=val with opt val
            var idx = argsList.indexOf(arrElt);
            argsList.pop(idx);
            argsList.insert(idx, elems.toArray());
          }
        }
      }
  }
}