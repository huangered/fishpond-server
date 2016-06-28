(* middleware.ml *)
type period = | pre of string
              | post of string
              
let period_to_string = function
  | pre -> "pre"
  | post -> "post"
  
(* middleware register method *)
let register_middleware url meth period =
  print_endline "register middleware"
