#!/usr/bin/env bash
files=( buffer.ml lexing.ml parsing.ml misc.ml clflags.ml location.ml asttypes.mli warnings.ml syntaxerr.ml longident.ml parsetree.mli docstrings.ml ast_helper.ml parser.ml lexer.ml ../../conf.ml ../../data.ml ../../envir.ml ../../runtime_lib.ml ../../runtime_base.ml ../../eval.ml ../../runtime_stdlib.ml ../../runtime_compiler.ml ../../primitives.ml ../../interp.ml )
modules=( Buffer Lexing Parsing Misc Clflags Location Asttypes Warnings Syntaxerr Longident Parsetree Docstrings Ast_helper Parser Lexer Conf Data Envir Runtime_lib Runtime_base Eval Runtime_stdlib Runtime_compiler Primitives Interp )
out=out.ml
cat std.ml > $out
for i in "${!files[@]}"; do
  f=${files[$i]}
  m=${modules[$i]}
  echo "module $m = struct" >> $out
  echo "# 1 \"$f\"" >> $out
  cat $f >> $out
  echo "# $(($(wc -l < $out) + 2)) \"$out\"" >> $out
  echo "end" >> $out
  echo >> $out
  camlboot_path_esc=$(realpath "$(dirname "$0")"/../.. | sed 's_/_\\/_g')
  sed -i "s#%CAMLBOOT_PATH%#$camlboot_path_esc#" $out
done