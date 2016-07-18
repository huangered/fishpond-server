open Core.Std
open Async.Std

open Response

let go r w=
  Request.read r w >>=
  function
  | `Ok (meth, url, http_ver, parameters, headers)
    -> match Route.route url meth with
         | (`Ok, handler) ->
	    begin
	      print_endline ("Handler: " ^ handler);
              Response.write_resp {http_ver="HTTP/1.1";status_code=200;reason_phrase="test";message="\ntest"} r w
	    end

let run ~port =
  Conf.check_cfg "src/string_io.ml";
  print_endline "register route......";
  Route.register_route_dir "/" "resource";
  print_endline "request action......";
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
