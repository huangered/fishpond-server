open Core.Std
open Async.Std

let go r w=
  Request.read r w >>=
  function
  | `Ok (m, u, v, header_map) -> Response.write_resp "\ntest" r w

let run ~port =
  let line = "start server on port:"^(string_of_int port)^"..." in
    print_endline line;
  let host_and_port = 
    Tcp.Server.create
      ~on_handler_error:`Raise
      (Tcp.on_port port)
      (fun _addr r w ->
         go r w)
   in
   ignore (host_and_port : (Socket.Address.Inet.t, int) Tcp.Server.t Deferred.t)