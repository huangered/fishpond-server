open Async.Std
open Core.Std

let rec header r w =
  Reader.read_line r 
  >>= function
  | `Eof -> return `Eof
  | `Ok line ->
    match String.lsplit2 line ~on:' ' with
    | Some (h, v) -> header r w
    | None -> return `Eof