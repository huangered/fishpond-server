(* route.ml *)

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
  
let run url meth = 
  print_endline "run"
