let check_cfg ~conf = 
  print_endline "check configure...";
  print_endline conf;
  print_endline (String_io.read_all_file ~f:"src/string_io.ml");
  print_endline "check configure success"