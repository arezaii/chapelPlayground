// try reproduce error when passing unbounded range stops compilation

record foo {   

  proc addOpt(myArg:int) { }
  proc addOpt(myArg:range)  { }
  
  proc addOpt(myArg:range(boundedType=BoundedRangeType.boundedLow)) {}
}

var myFoo = new foo();

myFoo.addOpt(myArg=1..);
