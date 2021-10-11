use FileSystem;
use MasonModify;
use MasonUtils;
use MasonHelp;
use MasonDoc;
use MasonEnv;
use MasonNew;
use MasonBuild;
use MasonUpdate;
use MasonSearch;
use MasonTest;
use MasonRun;
use MasonSystem;
use MasonExternal;
use MasonPublish;
use MasonInit;

proc main(args: [] string) throws {

  for arg in args {
    writeln(arg);
    select (arg){
      when 'new' do masonNew(args);
      when 'init' do masonInit(args);
      when 'add' do masonModify(args);
      when 'rm' do masonModify(args);
      when 'build' do masonBuild(args);
      when 'update' do masonUpdate(args);
      when 'run' do masonRun(args);
      when 'search' do masonSearch(args);
      when 'system' do masonSystem(args);
      when 'external' do masonExternal(args);
      when 'test' do masonTest(args);
      when 'env' do masonEnv(args);
      when 'doc' do masonDoc(args);
      when 'publish' do masonPublish(args);
      when 'clean' do masonClean(args);
      when 'help' do masonHelp();
      when 'version' do printVersion();
      when '-h' do masonHelp();
      when '--help' do masonHelp();
      when '-V' do printVersion();
      when '--version' do printVersion();
    }
  }
}


proc masonClean(args) {
  try! {
    if args.size == 3 {
      masonCleanHelp();
      exit(0);
    }
    const cwd = here.cwd();

    const projectHome = getProjectHome(cwd);
    runCommand('rm -rf ' + projectHome + '/target');
  }
  catch e: MasonError {
    stderr.writeln(e.message());
  }
}


proc printVersion() {
  writeln('mason 0.1.2');
}
