open Async.Std
open Core.Std


let rec parse_header headers r w =
  Reader.read_line r 
  >>= function
  | `Eof -> return `Eof
  | `Ok line ->
    match String.lsplit2 line ~on:' ' with
    | Some (h, v) -> parse_header (Map.add headers ~key:h ~data:v) r w
    | None -> return (`Ok (headers))