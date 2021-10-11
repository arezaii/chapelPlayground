module M {

  config var myConfigList:string;
  config var myConfigVar:int;
  config var myDebug=true;

  proc main(args:[]string) {
    writeln("ConfigVars:");
    writeln(myConfigList);
    writeln(myConfigVar);
    if myDebug then writeln("Debugging Output ON");
    for arg in args do writeln(arg);
    // for item in myConfigList do writeln(item);
    // for num in myConfigVar do writenl(num:string);
  }

}