open Async.Std
open Core.Std

type request = 
{
	meth: string;
	resource: string;
	http_version: string;
}

let rec findPair pairs paraMap =
  match pairs with
  | [] -> paraMap
  | fl :: ll ->
    let [k; v] = String.split fl ~on:'=' in 
      let newMap = Map.add paraMap ~key:k ~data:v in 
        findPair ll newMap

(* analysis the url parameter into map*)
let combine paras =
  let pairs = String.split paras ~on:'&' in
    findPair pairs String.Map.empty

(* parse the parameters in the url *)
let parse_parameter url =
  match String.lsplit2 url ~on:'?' with
  | None -> (url, String.Map.empty)
  | Some (path, "") -> (url, String.Map.empty)
  | Some (path, paras) -> let parasMap = combine paras in (path, parasMap)

(* method, url, http_version, parameters *)
let parse_request_line r = 
  Reader.read_line r >>= function
  | `Ok line ->
    print_endline line;
    begin
    match String.split line ~on:' ' with
    | [] -> return `Eof
    | [meth_raw; resource_raw; version] -> 
      let (path, parameters) = parse_parameter resource_raw in
        Map.iteri parameters Util.display_map ;
        return (`Ok (meth_raw, path, version, parameters)) 
    end
  | `Eof -> 
    return `Eof
    
let read r w =
  parse_request_line r >>= function
  | `Eof -> return (`Wrong)
  | `Ok (m, u, v, p) -> 
    Header.parse_header String.Map.empty r w >>= function 
    | `Ok (headers) -> return (`Ok (m, u, v, p, headers))
    