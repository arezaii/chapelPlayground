use unitTestSegFault;
use UnitTest;

/*  
*   If the first test listed is either the
*   unboundedRange test or the Int test, then 
*   compilation will fail with a segfault.
*   
$CHPL_HOME/modules/packages/UnitTest.chpl:1165: internal error: seg fault [util/misc.cpp:915]
Note: This source location is a guess.
*
*   Changing the order of these tests, such that the 
*   first test is the boundedRange test, will result
*   in successful compilation.
*   
*   Alternatively, if one of the following is done to change the code, it will
*   no longer segfault on compilation.
*   1. myProc method is changed to not throw
*   2. the generic defaultValue is changed to non-generic
*   3. the test that uses the bounded range assigns a value to defaultValue
*/


// a test for the lowbound range overload
proc testUnBoundRange(test: borrowed Test) throws {
  var myFoo = new foo();
  
  var result = myFoo.myProc(numArgs=1..);
}

// a test for the bounded range overload
proc testBoundRange(test: borrowed Test) throws {
  var myFoo = new foo();
  
  var result = myFoo.myProc(numArgs=1..10);
}

// a test for the integer overload
proc testInt(test: borrowed Test) throws {
  var myFoo = new foo();
  
  var result = myFoo.myProc(numArgs=1);
}

UnitTest.main();
