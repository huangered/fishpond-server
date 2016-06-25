
open Async.Std
open Core.Std

let write_resp buffer r w =
	Writer.write w buffer ~len:(String.length buffer);
	Writer.flushed;
	return ()