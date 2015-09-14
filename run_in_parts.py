import sys
import imp

assert len(sys.argv)==2

module_name = str(sys.argv[1])
# Strip module_name for .py extension if it has been mistakenly supplied.
if module_name[-3:] == '.py':
    module_name = module_name[:-3]
module_to_run = __import__(module_name, globals(), locals(), [], 0)

part1Cache = None
if __name__=='__main__':
    while True:
        if not part1Cache:
            part1Cache = module_to_run.part1()
        module_to_run.part2(part1Cache)
        print("Press enter to re-run the script, CTRL-C to exit")
        sys.stdin.readline()
        imp.reload(module_to_run)
