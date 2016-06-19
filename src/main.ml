open Core.Std
open Async.Std
open Server
let () =
  send "channel 1" "message";
  send "channel 2" "message";
  send "channel 3" "message";
  run 12345;
  never_returns (Scheduler.go())