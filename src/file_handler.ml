(* route.ml *)
open Handlersig
open Request
open Response
open String_io

open Core.Std

module File_handler = struct
  let name = "file handler"
  let get req = 
    let path = ("."^req.resource) in
      print_endline ("url:"^path);
      match Sys.is_file path with
        | `Yes ->
               let data = String_io.read_all_file ~f:path in
                 {http_ver="HTTP/1.1";status_code=200;reason_phrase="test";message=data}
        | _ -> print_endline ("Url:"^path^" not found");
	       {http_ver="HTTP/1.1";status_code=404;reason_phrase="test";message="\nNo found"}
     
end