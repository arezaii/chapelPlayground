module pi {
  use Random;
  use Time;

  config const iterCount = 1000;

  const dom: domain(1) = {0..iterCount};
  var Xs: [dom] real;
  var Ys: [dom] real;


  proc generatePoints() {
    const xSeed = 20;
    const ySeed = 10;

    fillRandom(Xs, xSeed);
    fillRandom(Ys, ySeed);
  }

  proc leibniz() : real {
    var sum = 0.0;
    for k in dom.these() {
      sum += ((-1.0) ** k) / ((2.0 * k) + 1.0);
    }
    return 4.0 * sum;
  }

  proc leibnizPar() : real {
    var sum = + reduce forall k in dom.these() do
                         ((-1.0) ** k) / ((2.0 * k) + 1.0);
    // TODO: Why par version produce slightly different value than serial?
    return 4.0 * sum;
  }

  proc monteCarlo() : real {
    var innerPts = 0;

    for i in dom.these() {
      if (Xs[i] ** 2 + Ys[i] ** 2 <= 1) {
        innerPts += 1;
      }
    }

    return  (4.0 * innerPts) / dom.size;
  }


  proc monteCarloPar() : real {
    var res = + reduce forall i in dom.these() do if Xs[i] ** 2 + Ys[i] ** 2 <=1 then 1;

    return  (4.0 * res) / dom.size;
  }

  proc main() {
    var timer = new Timer();
    timer.start();
    writeln("Generating random points...");
    generatePoints();
    writeln("Generated ", iterCount, " points in ", timer.elapsed(), " seconds.");
    writeln("Performing ", iterCount, " iterations...");
    writeln("SERIAL APPROACH:");
    timer.clear();
    writef("Leibniz Pi estimate: %{##.#################} in %{###.##########} seconds.\n",
           leibniz(), timer.elapsed());
    timer.clear();
    writef("MonteCarlo Pi estimate: %{##.#################} in %{###.##########} seconds.\n",
           monteCarlo(), timer.elapsed());

    writeln("PARALLEL APPROACH:");
    timer.clear();
    writef("Leibniz Pi estimate: %{##.#################} in %{###.##########} seconds.\n",
            leibnizPar(), timer.elapsed());
    timer.clear();
    writef("MonteCarlo Pi estimate: %{##.#################} in %{###.##########} seconds.\n",
            monteCarloPar(), timer.elapsed());
  }

}