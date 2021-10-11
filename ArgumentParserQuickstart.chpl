module M {
  use ArgumentParser;
  proc main(args:[]string) throws {
    var parser = new argumentParser();

    var simpleArg = parser.addArgument(name="positional", numArgs=0..1);
    var optionArg = parser.addOption(name="optional");
    var flagArg = parser.addFlag(name="debug", defaultValue=false);

    // add help flag handling
    var helpFlag = parser.addFlag(name="help", opts=["-h","--help"], defaultValue=false);

    try!{
      parser.parseArgs(args);
    } catch ex : ArgumentError {
      writeln(ex.message());
      printHelp();
      exit(1);
    }
    // check for help flag
    if helpFlag.valueAsBool() {
      printHelp();
      exit(0);
    }

    var debug = flagArg.valueAsBool();
    var bar:string, foo:string;
    if simpleArg.hasValue() then foo = simpleArg.value();

    if optionArg.hasValue() then bar = optionArg.value();
  }

  proc printHelp() {
    writeln("Our Program's Help Message");
  }
}
