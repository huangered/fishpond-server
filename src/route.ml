(* route.ml *)
open File_handler
open Handlersig

open Core.Std

let route_hash = String.Table.create () ~size:256;;

let register_route url h =
  match Hashtbl.add route_hash ~key:url ~data:h with
    | `Duplicate -> print_endline "dup"
    | `Ok        -> print_endline "ok"

(* method recevie url and ?meth return a handler *)  
let route url meth =
  match Hashtbl.find route_hash url with
  | Some(h) -> (`Ok, h)
  | None    -> let h = (module File_handler : Handler_sig) in (`Ok, h)
 

