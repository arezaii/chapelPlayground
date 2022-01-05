module pi {
  use Random;

  config const iterCount = 1000;

  proc leibniz(iters=iterCount) : real {
    var sum = 0.0;
    var k = 0;
    while k < iters {
      sum += ((-1.0) ** k) / ((2.0 * k) + 1.0);
      k += 1;
    }
    return 4.0 * sum;
  }

  proc monteCarlo(iters=iterCount) : real {
    // generate random points (x,y) 0<x<1 && 0<y<1
    const xSeed = 20;
    const ySeed = 10;
    var pi = 0.0;
    const dom: domain(1) = {0..iters};
    var totalPts = 0;
    var innerPts = 0;

    var Xs: [dom] real;
    var Ys: [dom] real;
    fillRandom(Xs, xSeed);
    fillRandom(Ys, ySeed);

    for i in dom {
      totalPts += 1;
      if (Xs[i] ** 2 + Ys[i] ** 2 <= 1) {
        innerPts += 1;
      }
    }

    return  (4.0 * innerPts) / totalPts;

  }

  proc main() {
    writeln("Leibniz Pi: ", leibniz());
    writeln("MonteCarlo Pi: ", monteCarlo());
  }

}