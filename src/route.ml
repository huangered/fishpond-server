(* route.ml *)
open File_handler
open Handlersig
open Request
open Response
open String_io

open Sys

let route_hash = Hashtbl.create 256;;

let register_route_dir url folder =
  let line =  "register folder: " ^ folder ^ " -> " ^ url in
    Hashtbl.add route_hash url folder;
    print_endline line

let unregister_route_dir url folder =
  Hashtbl.remove route_hash url;
  print_endline "unregister folder"

let register_route url handler =
  print_endline "register route"
  
let unregister_route url handler = 
  print_endline "unregister route"

(* method recevie url and ?meth return a handler *)  
let route url meth =
  try
    let handler = Hashtbl.find route_hash url in
      let h = (module File_handler : Handler_sig) in 
        (`Ok, h)
  with
    Not_found -> (`Ok, (module File_handler : Handler_sig))

