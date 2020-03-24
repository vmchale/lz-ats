staload "SATS/lzlib.sats"
staload "libats/libc/SATS/stdio.sats"
staload UN = "prelude/SATS/unsafe.sats"

#include "share/atspre_staload.hats"

#define BUFSZ 32768

fn freadc { l : addr | l != null }{ sz : nat | sz >= 1 }(pf : !bytes_v(l, sz)
                                                        | inp : !FILEptr1, bufsize : size_t(sz), p : ptr(l)) : [ m : nat | m <= sz ] size_t(m) =
  let
    extern
    castfn as_fileref(x : !FILEptr1) :<> FILEref
    
    var n = $extfcall(size_t, "fread", p, sizeof<byte>, bufsize, as_fileref(inp))
  in
    $UN.cast(n)
  end

extern
fn fclose_silent(FILEptr1) : void =
  "mac#fclose"

fn floop { l : addr | l != null }(pf : !bytes_v(l, BUFSZ) | p : ptr(l), inp : !FILEptr1) : void =
  let
    val dptr = LZ_decompress_open()
    
    fun read_loop { l : addr | l != null }(pf : !bytes_v(l, BUFSZ) | inp : !FILEptr1, dptr : !lzdecoderptr, p : ptr(l)) : void =
      let
        val _ = LZ_decompress_read(pf | dptr, p, BUFSZ)
        var ret = LZ_decompress_finished(dptr)
      in
        if ret = 1 then
          ()
        else
          read_loop(pf | inp, dptr, p)
      end
    
    fun loop { l : addr | l != null }(pf : !bytes_v(l, BUFSZ) | inp : !FILEptr1, dptr : !lzdecoderptr, p : ptr(l)) : void =
      let
        var file_bytes = freadc(pf | inp, i2sz(BUFSZ), p)
      in
        if file_bytes = 0 then
          ()
        else
          let
            val max_sz = LZ_decompress_write_size(dptr)
            val () = if BUFSZ > max_sz then
              prerr!("WARNING!")
            val _ = LZ_decompress_write(pf | dptr, p, sz2i(file_bytes))
            val _ = LZ_decompress_read(pf | dptr, p, BUFSZ)
          in
            loop(pf | inp, dptr, p)
          end
      end
    
    val () = loop(pf | inp, dptr, p)
    val _ = LZ_decompress_close(dptr)
  in end

fn fbuf(inp : !FILEptr1) : void =
  let
    val (pfat, pfgc | p) = malloc_gc(g1i2u(BUFSZ))
    prval () = pfat := b0ytes2bytes_v(pfat)
    val () = floop(pfat | p, inp)
    val () = mfree_gc(pfat, pfgc | p)
  in
    ()
  end

fn fpath(fp : string) : void =
  let
    var inp = fopen(fp, file_mode_r)
  in
    if FILEptr_is_null(inp) then
      let
        extern
        castfn fp_is_null { l : addr | l == null }{m:fm} (FILEptr(l,m)) :<> void
      in
        fp_is_null(inp)
      end
    else
      let
        val () = fbuf(inp)
        val () = fclose_silent(inp)
      in end
  end

// var inp = fopen(fp, file_mode_r)
// FILEptr_is_null(inp)
// TODO: file decoder
implement main0 () =
  { val () = fpath("test/data/ulysses.txt.lz") }
