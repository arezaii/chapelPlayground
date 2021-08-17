record rec { var x = 0; }

var gRec = new rec();

proc makeRec(): rec {
  writeln('proc makeRec(): rec');
  return new rec();
}

proc makeRec() ref: rec {
  writeln('proc makeRec() ref: rec');
  return gRec;
}

proc makeRec() const ref: rec {
  writeln('proc makeRec() const ref: rec');
  return gRec;
}

proc test() {
  writeln('T1: store in var');
  var x1 = makeRec();
  writeln();

  writeln('T2: store in ref');
  ref x2 = makeRec();
  writeln();

  writeln('T3: store in const ref');
  const ref x3 = makeRec();
  writeln();

  writeln('T4: store in const');
  const x4 = makeRec();
  writeln();

  writeln('T5: call without assignment');
  makeRec();
}
test();