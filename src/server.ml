let send channel message =
  let line = channel ^ ":"  ^ message in
    print_endline line
