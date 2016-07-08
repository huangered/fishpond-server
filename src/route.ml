(* route.ml *)
let register_route_dir url folder =
  let line =  "register folder: " ^ folder ^ " -> " ^ url in
    print_endline line

let unregister_route_dir url folder =
  print_endline "unregister folder"

let register_route url handler =
  print_endline "register route"
  
let unregister_route url handler = 
  print_endline "unregister route"
  
let run url meth = 
  print_endline "run"