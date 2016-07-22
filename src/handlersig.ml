(* handler sig, support get, post, delete, put, etc method *)

open Request
open Response

module type Handler_sig =
sig
  val name : string
  val get : request -> response
end