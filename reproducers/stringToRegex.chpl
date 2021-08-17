use Regex;

var s = "contains";
var rs = compile(s);

writeln("contains regular expression".search(rs));    // matches
writeln("doesn't contain regular expression".search(rs));   // doesn't match