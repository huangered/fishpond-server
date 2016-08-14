open Core.Std
(* read file *)
let read_all_file ~f =
  let lines = In_channel.read_lines f in
    String.concat ~sep:"\r\n" lines
    
(* the file content cache *)
let file_hash = String.Table.create() ~size:256;;

(* read all file in the folder *)
let rec read_fold ~f = 
  let files = Sys.ls_dir f in 
     List.iter files ~f:(fun x ->
       match Sys.is_file (f^"/"^x) with 
         | `Yes -> Hashtbl.add file_hash ~key:(f^"/"^x) ~data:(f^"/"^x); ()
         | `No  -> read_fold ~f:(f^"/"^x)
         | `Unknown -> print_endline ("unknown:"^x))