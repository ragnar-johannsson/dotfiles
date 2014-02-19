function ql() {
      (( $# > 0 )) && qlmanage -p $* >/dev/null &
}
