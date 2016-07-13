
type level =
  | Info
  | Warn
  | Error

let log level message =
  print_endline message
  