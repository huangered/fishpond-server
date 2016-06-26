open Async.Std
open Core.Std


let rec parse_header header_map r w =
  Reader.read_line r 
  >>= function
  | `Eof -> return `Eof
  | `Ok line ->
    match String.lsplit2 line ~on:' ' with
    | Some (h, v) -> parse_header (Map.add header_map ~key:h ~data:v) r w
    | None -> return (`Ok (header_map))