module M {
  
  config var myConfigList:string;
  config var myConfigVar:int;

  proc main(args:[]string) {
    writeln("ConfigVars:");
    writeln(myConfigList);
    writeln(myConfigVar);
    // for item in myConfigList do writeln(item);
    // for num in myConfigVar do writenl(num:string);
  }

}