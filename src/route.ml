(* route.ml *)
open Handlersig
open Request
open Response

let route_hash = Hashtbl.create 256;;

module File_handler = struct
  let name = "file handler"
  let get req resp  = 
    {http_ver="HTTP/1.1";status_code=200;reason_phrase="test";message="\ntest"}
end


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

