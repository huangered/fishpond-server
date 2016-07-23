(* route.ml *)
open Handlersig
open Request
open Response
open String_io

open Sys

module File_handler = struct
  let name = "file handler"
  let get req = 
    let path = ("."^req.resource) in
      print_endline ("url:"^path);
      match Sys.file_exists path && not (Sys.is_directory path) with
      | false -> {http_ver="HTTP/1.1";status_code=200;reason_phrase="test";message="\nNo found"}
      | true ->
               let data = String_io.read_all_file ~f:path in
                 {http_ver="HTTP/1.1";status_code=200;reason_phrase="test";message=data}
end