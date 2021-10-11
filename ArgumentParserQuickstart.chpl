module M {
  use ArgumentParser;
  proc main(args:[]string) throws {
    var parser = new argumentParser();

    var simpleArg = parser.addArgument(name="positional", numArgs=0..1);
    var optionArg = parser.addOption(name="optional");
    var flagArg = parser.addFlag(name="debug", defaultValue=false);
    var helpFlag = parser.addFlag(name="help", defaultValue=false);

    try!{
      parser.parseArgs(args);
    } catch ex : ArgumentError {
      writeln(ex.message());
      printHelp();
      exit(1);
    }

    if helpFlag.valueAsBool() {
      printHelp();
      exit(0);
    }

    var debug = flagArg.valueAsBool();
    // we are assured a value here or else the parser would have thrown
    var foo = simpleArg.value();
    var bar:string;
    if optionArg.hasValue() then bar = optionArg.value();
  }

  proc printHelp() {
    writeln("Our Program's Help Message");
  }
}
