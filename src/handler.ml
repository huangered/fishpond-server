(* handler sig, support get, post, delete, put, etc method *)

module type Http_handler =
sig
  var name : string
  var url : string
end