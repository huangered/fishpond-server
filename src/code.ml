(* code.ml the server const variable, http_code, etc *)

type status_code =
  |100
  |200

let get_status_code: status_code -> int = function
  | `Continue -> 100
  | `Switching_Protocols -> 101