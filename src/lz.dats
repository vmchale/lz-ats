staload "SATS/lzlib.sats"

implement main0 () =
  {
    val lzptr = LZ_decompress_open()
    var ret = LZ_decompress_close(lzptr)
    val () = println!(ret)
  }
