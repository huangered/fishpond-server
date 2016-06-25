open Core.Std
open Async.Std
open Server
let () =
  run 12345;
  never_returns (Scheduler.go())