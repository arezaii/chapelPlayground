param s = "chapel";
param i = 1;
param ss = s[i];   // this is not a compile time operation
compilerWarning(ss);