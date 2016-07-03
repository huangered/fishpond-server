open Core.Std
open Async.Std
open Server
let () =
  let port = 12345 in 
    run port;
  never_returns (Scheduler.go())