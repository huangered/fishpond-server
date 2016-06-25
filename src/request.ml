open Async.Std
open Core.Std

type request = 
{
	meth: string;
	url: string;
	http_version: string;
}
(* method, url, http_version*)
let parse_fst_line r = 
  Reader.read_line r >>= function
  | `Ok line ->
    begin
    match String.split line ~on:' ' with
    | [] -> return `Eof
    | [meth_raw; url_raw; version] -> return (`Ok (meth_raw, url_raw, version)) 
    end
  | `Eof -> 
    return `Eof
    