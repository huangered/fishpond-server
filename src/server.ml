open Core.Std
open Async.Std

let send channel message =
  let line = channel ^ ":"  ^ message in
    print_endline line

let rec copy_blocks buffer r w =
  Reader.read r buffer
  >>= function
  |`Eof -> return()
  |`Ok bytes_read ->
    print_endline buffer;
    Writer.write w buffer ~len:bytes_read;
    Writer.flushed w
    >>= fun() ->
    copy_blocks buffer r w

let run ()=
  print_endline "start server on port: 8765...";
  let host_and_port = 
    Tcp.Server.create
      ~on_handler_error:`Raise
      (Tcp.on_port 8765)
      (fun _addr r w ->
         let buffer = String.create (16 * 1024) in
         copy_blocks buffer r w)
   in
   ignore (host_and_port : (Socket.Address.Inet.t, int) Tcp.Server.t Deferred.t)