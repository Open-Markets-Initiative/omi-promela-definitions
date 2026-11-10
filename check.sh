#!/bin/sh
#
# Check every definition in this repository.
#
#   ./check.sh              check all of them
#   ./check.sh nasdaq       check the ones under a directory
#   ./check.sh path/to.pml  check one
#
# For each model spin writes a verifier in C, the compiler builds it, and the verifier
# explores every record at every pattern it is checked at. A model whose encoder and
# decoder disagree fails an assertion, and the trail names the field and the byte.
#
# Spin writes its verifier as pan.c whatever the model is called, so each is checked in a
# directory of its own - otherwise two checked at once overwrite each other.

set -u

root=$(pwd)
target=${1:-.}

if [ -f "$target" ]; then
  models=$target
else
  models=$(find "$target" -name '*.pml' | sort)
fi

if [ -z "$models" ]; then
  echo "no definitions under $target"
  exit 1
fi

check_one() {
  model=$1
  root=$2
  work=$(mktemp -d)

  if ! ( cd "$work" && spin -a "$root/$model" ) > "$work/spin.log" 2>&1; then
    echo "FAIL $model (spin)"
    sed 's/^/      /' "$work/spin.log"
    rm -rf "$work"
    return 1
  fi

  if ! ( cd "$work" && cc -O0 -DSAFETY -DVECTORSZ=16384 -Wno-format-overflow -o pan pan.c ) > "$work/cc.log" 2>&1; then
    echo "FAIL $model (compile)"
    sed 's/^/      /' "$work/cc.log"
    rm -rf "$work"
    return 1
  fi

  if ! ( cd "$work" && ./pan -m100000 ) > "$work/pan.log" 2>&1; then
    echo "FAIL $model (verifier)"
    sed 's/^/      /' "$work/pan.log"
    rm -rf "$work"
    return 1
  fi

  # the verifier reports a violated assertion in its output and still exits zero, so the
  # count it states is what is read rather than its status
  if ! grep -q 'errors: 0' "$work/pan.log"; then
    echo "FAIL $model (assertion)"
    sed 's/^/      /' "$work/pan.log"
    rm -rf "$work"
    return 1
  fi

  rm -rf "$work"
  return 0
}

failed=0
count=0

for model in $models; do
  count=$((count + 1))
  if ! check_one "$model" "$root"; then
    failed=$((failed + 1))
  fi
done

echo "checked $count definitions, $failed failed"
[ "$failed" -eq 0 ]
