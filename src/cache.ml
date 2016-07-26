(* cache.ml *)
open Core.Std

open String_io

let cache = String.Table.create () ~size:256;;

let put file =
  let data = String_io.read_all_file ~f:file in
    match Hashtbl.add route_hash ~key:file ~data:data with
      | `Duplicate -> print_endline "dup"
      | `Ok        -> print_endline "ok"

let get =
  match Hashtbl.find cache file with
  | Some(h) -> (`Ok, h)
  | None    -> (`None)
 

