(* code.ml the server const variable, http_code, etc *)

(* page 18 *)
type http_version = 
  | `HTTP_1_0
  | `HTTP_1_1

(* page 36 *)
type meth = 
  | `OPTIONS
  | `GET
  | `HEAD
  | `POST
  | `PUT
  | `DELETE
  | `TRACE
  | `CONNECT

type status_code =
  | 100
  | 101
  | 200
  | 201
  | 202
  | 203
  | 204
  | 205
  | 206
  | 300
  | 301
  | 302
  | 303
  | 304
  | 305
  | 307
  | 400
  | 401
  | 402
  | 403
  | 404

let get_basic_rules = function
  | `CR -> '\r'
  | `LF -> '\n'
  | `SP -> ' '

let get_http_version = function
  | `HTTP_1_0 -> "HTTP/1.0"
  | `HTTP_1_1 -> "HTTP/1.1"

let get_method = function
  | `OPTIONS -> "OPTIONS"
  | `GET     -> "GET"
  | `HEAD    -> "HEAD"
  | `POST    -> "POST"
  | `PUT     -> "PUT"
  | `DELETE  -> "DELETE"
  | `TRACE   -> "TRACE"
  | `CONNECT -> "CONNECT"

let get_reason = function
  | 100 -> "Continue"
  | 101 -> "Switching Protocols"
  | 200 -> "OK"
  | 201 -> "Created"
  | 202 -> "Accepted"
  | 203 -> "Non-Authoritative Information"
  | 204 -> "No Content"
  | 205 -> "Reset Content"
  | 206 -> "Partial Content"
  | 300 -> "Multiple Choices"
  | 301 -> "Moved Permanently"
  | 302 -> "Found"
  | 303 -> "See Other"
  | 304 -> "Not Modified"
  | 305 -> "Use Proxy"
  | 307 -> "Temporary Redirect"
  | 400 -> "Bad Request"
  | 401 -> "Unauthorized"
  | 402 -> "Payment Required"
  | 403 -> "Forbidden"
  | 404 -> "Not Found"
  | 405 -> "Method Not Allowed"
  | 406 -> "Not Acceptable"
  | 407 -> "Section 10.4.8: Proxy Authentication Required"
  | 408 -> "Request Time-out"
  | 409 -> "Conflict"
  | 410 -> "Gone"
  | 411 -> "Length Required"
  | 412- > "Precondition Failed"
  | 413 -> "Request Entity Too Large"
  | 414 -> "Request-URI Too Large"
  | 415 -> "Unsupported Media Type"
  | 416 -> "Requested range not satisfiable"
  | 417 ->"Expectation Failed"
  | 500- > "Internal Server Error"
  | 501 -> "Not Implemented"
  | 502 -> "Bad Gateway"
  | 503 -> "Service Unavailable"
  | 504 -> "Gateway Time-out"
  | 505 -> "HTTP Version not supported"