module M {
  var alphaTrue = "true";
  var numOne = 1;  
  var alphaOne = "1";
 try!{
  writeln("'1' is bool: " + isBool(alphaOne):string);
  writeln("'true' is bool: " + isBool(alphaTrue):string);
  writeln("1 is bool: " + isBool(numOne):string);
  //writeln("cast 1 to bool: " + alphaOne:bool:string);
  writeln("cast 'true' to bool: " + alphaTrue:bool:string);

  writeln("'1' is bool: " + isBool("1"):string);
  writeln("'true' is bool: " + isBool("true"):string);
  writeln("1 is bool: " + isBool(1):string);
  //writeln("cast 1 to bool: " + "1":bool:string);
  writeln("cast `true` to bool: " + "true":bool:string);
 }
}