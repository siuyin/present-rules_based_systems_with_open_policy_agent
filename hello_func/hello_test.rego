package hello

test_greet {
  greet("SiuYin") == "hello, SiuYin"
}

test_greet_empty_arg {
  g := greet("")
  trace(sprintf("g := %q",[g]))
  g == "hello, "
}
