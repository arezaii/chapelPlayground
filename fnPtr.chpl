// proc myfunc(x:int) { return x + 1; }
// var f = myfunc;
// writeln(f(3));

class HelpMessage {
  var msg:string;

  proc setMsg(message:string) {
    msg = message;
  }

  proc help() {
    writeln(msg);
  }
}

record Help {

  var _help = new HelpMessage();

  proc init () {
    this.complete();
    this.genHelp();
  }

  proc setCustomHelpMessage(msg:string) {
    this._help.setMsg(msg);
  }

  proc setHelp(in help: HelpMessage) {
    this._help = help;
  }

  proc printHelp() {
    _help.help();
  }

  proc genHelp() {
    _help.setMsg("internal generated message");
  }

}

var demo = new Help();

demo.printHelp();

demo.setCustomHelpMessage("This is my custom string message");
demo.printHelp();

class MyHelpMessage : HelpMessage {
  override proc help() {
    writeHelp();
  }
}

proc writeHelp() {
  writeln("my custom help function or whatever");
}

demo.setHelp(new MyHelpMessage());
demo.printHelp();



/****************************************/

  //var helpMethod;
  //var helpMsg:string;
  // proc init (help) {
  //   this.helpMethod = help;
  // }


  // proc setHelpMethod(f=_defaultHelp) {
  //   this.helpMethod = f;
  // }

  // proc _defaultHelp() {
  //   writeln(helpMsg);
  // }

// proc _defaultMessage() {
//   writeln("default");
// }

// proc writeHelp() {
//   writeln("here is my help message");
// }

//demo.setHelpMethod(writeHelp);
//demo.setHelpMethod();


/****************************************/



// proc placeHolder() {
//    writeln("placeholder");
// }

// var func = placeHolder;

// proc doHelp(f=func) {
//   writeln(f.type:string);
// }

// doHelp(writeHelp);