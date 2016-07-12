open Async.Std
open Core.Std

type response = 
{
  http_ver: string;
  status_code: int;
  reason_phrase: string
}

let status_line resp =
  Printf.sprintf "%s %d %s\n" resp.http_ver resp.status_code (Code.get_reason resp.status_code)
  

let write_resp buffer r w =
  Writer.write w buffer ~len:(String.length buffer);
  Writer.flushed;
  return ()