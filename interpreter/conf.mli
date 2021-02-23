val trace : bool
val traceend : bool
val tracearg_from : int
val tracecur : int ref
val tracedepth : int ref
val debug : bool
val stdlib_path : unit -> string
val compiler_source_path : unit -> string
type command = Ocamlc | Ocamlopt | Files
val command : unit -> command option