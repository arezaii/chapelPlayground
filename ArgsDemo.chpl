module M {
  use MasonArgParse;
  use List;

  proc main(args:[?argsD]string) throws {
    // create a parser for the main entry point
    var parser = new argumentParser();

    // add a string option that accepts 1 or more values
    var typArg = parser.addOption(name="strArg2",
                                  opts=["-t","--types"],
                                  numArgs=1..);

    // add a bool flag that can be turned on (--flagOn) or off (--no-flagOn)
    // but has no value by default
    var boolArg = parser.addFlag(name="boolArg1",
                                  opts=["--flagOn"]);

    // add a positional argument that expects 1 value
    var posArg = parser.addPositional(name="positionalArg");

    // add a subcommand that has its own parser (defined later)
    var subCmd1 = parser.addSubCommand(cmd="subCmd1");

    // setup the passthrough indicator
    var runPassThrough = parser.setPassThrough("++");

    // parse the args
    parser.parseArgs(args);

    // output the args
    writeln("Values received for main:");

    if boolArg.hasValue() then writeln("boolArg: " + boolArg.value());
    if posArg.hasValue() then writeln("positional value: " + posArg.value());
    for item in typArg.values() do writeln(item);

    writeln("\tPassthrough args");
    var passThroughVals = runPassThrough.values();
    for val in passThroughVals[1..] do writeln("\t" + val);

    if subCmd1.hasValue() {
      mySubCmd1((new list(subCmd1.values())).toArray());
    }

  }

  proc mySubCmd1(args:[?argsD]string) throws {
    writeln("SubCommand1 was called");
    // create a parser object for this subcommand
    var parser = new argumentParser();

    // add a positional argument to the subcommand that expects 0 or 1 values
    var subPosArg = parser.addPositional(name="subItem",
                                          numArgs=0..1,
                                          defaultValue=none);


    // parse the subcommand args
    parser.parseArgs(args);


    // output the args
    writeln("\targs parsed in subcommand:");

    for item in subPosArg.values() do writeln("\t" + item);




  }
}