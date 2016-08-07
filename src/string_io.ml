open Core.Std
(* read file *)
let read_all_file ~f =
  let lines = In_channel.read_lines f in
    String.concat ~sep:"\r\n" lines


let test f =
  match Sys.is_file f with
    | `Yes -> print_endline (f^" is file")
    | `No  -> print_endline (f^" is dir")

(* read all file in the folder *)
let rec read_fold ~f = 
  let route_hash = String.Table.create () ~size:256 in
    let files = Sys.ls_dir f in 
      List.iter files ~f:test
