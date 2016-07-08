open Async.Std
open Core.Std

type response = 
{
  http_ver: string;
  status_code: string;
  reason_phrase: string
}

let status_line resp =
  resp.http_ver ^ " " ^ resp.status_code ^ " " ^ resp.reason_phrase ^ "\n"

let write_resp buffer r w =
  Writer.write w buffer ~len:(String.length buffer);
  Writer.flushed;
  return ()