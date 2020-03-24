staload "SATS/lzlib.sats"

// TODO: file decoder
implement main0 () =
  {
    val dptr = LZ_decompress_open()
    var _ = LZ_decompress_close(dptr)
  }
