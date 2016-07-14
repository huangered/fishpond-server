open Async.Std
open Core.Std

type response = 
{
  http_ver: string;
  status_code: int;
  reason_phrase: string;
  message: string
}

let status_line resp =
  Printf.sprintf "%s %d %s\n" resp.http_ver resp.status_code (Code.get_reason resp.status_code)
  

let write_resp resp r w =
  let line = (status_line resp) in
    Writer.write w line ~len:(String.length line); 
  Writer.write w resp.message ~len:(String.length resp.message);
  Writer.flushed;
  return ()