# Check every definition, and every record's round trip within it.
#
#   make            check everything
#   make clean      remove what a check left behind
#
# The work is in check.sh: spin writes its verifier under one fixed name, so each model is
# checked in a directory of its own rather than in this one.

all: check

check:
	sh ./check.sh

clean:
	rm -f pan.* _spin_nvr.tmp

.PHONY: all check clean
