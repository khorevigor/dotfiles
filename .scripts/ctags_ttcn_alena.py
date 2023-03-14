#!/app/vbuild/SLED11-x86_64/python/3.6.6/bin/python3


"""
ctags generator - script is a wrapper for original ctags tool developed by TCC

provides ability to generate ctags for all files or only created by puma
"""

import argparse
import collections
import os
import subprocess
import sys

sys.path.append(os.path.join(os.environ['FT_TOOLS'], 'tiger/src/puma/'))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--work-dir")
    parser.add_argument("--full", action="store_true")
    parser.add_argument("-d", "--debug", action="store_true")
    args = parser.parse_args()

    if not args.work_dir:
        args.work_dir = "/local/scratch/zihakho/ft/bin/.build"
    os.chdir(args.work_dir)

    ctags_cmd = '/app/TITAN/4_R2A/LMWP3.3/bin/ctags --line-directives=yes '
    if args.full:
        # all ttcn3 / asn files from TPD project will be included

        DummyArgs = collections.namedtuple(
            "DummyArgs",
            ['memory_build', 'tpd_strict_mode', 'tpd_create_all_links'])

        arguments = DummyArgs(memory_build=False, tpd_strict_mode=False,
            tpd_create_all_links=False)
        dr = TpdDependencyResolver(arguments)

        dr.parse_project_file()

        with open("/tmp/ctags.list", "w") as f:
            for _, ttcn_file in dr.modules.items():
                if ttcn_file.path.endswith((".ttcn", ".ttcnpp", ".asn1")):
                    f.write("{}\n".format(ttcn_file.path))

        ctags_cmd += '-L /tmp/ctags.list'

    else:
        # only files in .build directory will be added
        ctags_cmd += '*.ttcn *.asn'

    if args.debug:
        output = None  # i.e. display all info on screen
    else:
        output = open(os.devnull)

    subprocess.check_call(
        ctags_cmd, shell=True, stdout=output, stderr=output)

if __name__ == '__main__':
    main()
