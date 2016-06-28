open Core.Std
(* read file *)
let read_all_file ~f =
  let lines = In_channel.read_lines f in
    String.concat ~sep:"\r\n" lines