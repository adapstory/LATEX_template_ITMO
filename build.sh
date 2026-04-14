#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

if [[ -d /Library/TeX/texbin ]]; then
  export PATH="/Library/TeX/texbin:$PATH"
fi

ARTIFACTS=(
  main.aux
  main.bbl
  main.bcf
  main.blg
  main.fdb_latexmk
  main.fls
  main.log
  main.out
  main.run.xml
  main.synctex.gz
  main.toc
  main.xdv
)

usage() {
  cat <<'EOF'
Usage:
  ./build.sh         Build main.pdf
  ./build.sh clean   Remove LaTeX temporary files
EOF
}

clean() {
  rm -f "${ARTIFACTS[@]}"
}

require_bin() {
  local bin="$1"
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Missing required binary: $bin" >&2
    exit 1
  fi
}

run_xelatex() {
  local step="$1"
  local tmp_log
  tmp_log="$(mktemp -t "diploma-xelatex-${step}")"

  set +e
  xelatex -interaction=nonstopmode -file-line-error -synctex=1 main.tex \
    >"$tmp_log" 2>&1
  local status=$?
  set -e

  cat "$tmp_log"

  if grep -Eq '^!' "$tmp_log"; then
    echo "XeLaTeX reported a fatal TeX error during step ${step}." >&2
    exit 1
  fi

  if [[ $status -ne 0 ]]; then
    echo "XeLaTeX returned code ${status} on step ${step}, but no fatal TeX errors were found." >&2
  fi
}

build() {
  require_bin xelatex
  require_bin biber

  clean

  run_xelatex 1
  biber main
  run_xelatex 2
  run_xelatex 3

  if [[ ! -f main.pdf ]]; then
    echo "Build failed: main.pdf was not produced." >&2
    exit 1
  fi

  echo
  echo "Build completed: $ROOT_DIR/main.pdf"
}

case "${1:-build}" in
  build)
    build
    ;;
  clean)
    clean
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    usage >&2
    exit 1
    ;;
esac
