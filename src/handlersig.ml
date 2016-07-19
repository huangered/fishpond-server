(* handler sig, support get, post, delete, put, etc method *)

module type Handler_sig =
sig
  val name : string
end