(* read configure *)
open Core.Std

(* the conf dictionary *)
let conf_hash = Hashtbl.create 256;;

let put_conf_hash line =
  let [k;v] = String.split line ~on:'=' in
    Map.add conf_hash ~key:k ~data:v

let check_cfg ~f = 
  print_endline ("check configure in "^f);
  let lines = In_channel.read_lines f in
    List.iter lines ~f:put_conf_hash
  print_endline "check configure success"