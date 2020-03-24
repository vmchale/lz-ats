abstype LZ_Errno

fn LZ_version() : string =
  "ext#"

fn LZ_sterror(LZ_Errno) : string =
  "ext#"

fn LZ_min_dictionary_size() : int =
  "ext#"

fn LZ_max_dictionary_size() : int =
  "ext#"

absvt@ype LZ_encoder

vtypedef lzencoderptr = [l:addr] (LZ_encoder @ l | ptr(l))

fn LZ_compress_open(int, int, ullint) : lzencoderptr =
  "ext#"

// TODO: mmap sats 
fn LZ_compress_close(lzencoderptr) : int =
  "ext#"

fn LZ_compress_finish(lzptr : !lzencoderptr) : int =
  "ext#"

fn LZ_compress_read {l:addr}{sz:nat}(pf : !bytes_v(l, sz) | lzptr : !lzencoderptr, ptr(l), int(sz)) : intLte(sz) =
  "ext#"

fn LZ_compress_write {l:addr}{sz:nat}(pf : !bytes_v(l, sz) | lzptr : !lzencoderptr, ptr(l), int(sz)) : int =
  "ext#"

fn LZ_compress_write_size(lzptr : !lzencoderptr) : int =
  "ext#"

fn LZ_compress_finished(lzptr : !lzencoderptr) : int =
  "ext#"

absvt@ype LZ_decoder

vtypedef lzdecoderptr = [l:addr] (LZ_decoder @ l | ptr(l))

fn LZ_decompress_open() : lzdecoderptr =
  "ext#"

fn LZ_decompress_close(lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_finish(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_read {l:addr}{sz:nat}(pf : !bytes_v(l, sz) | lzptr : !lzdecoderptr, ptr(l), int(sz)) : intLte(sz) =
  "ext#"

fn LZ_decompress_write {l:addr}{sz:nat}(pf : !bytes_v(l, sz) | lzptr : !lzdecoderptr, ptr(l), int(sz)) : int =
  "ext#"

fn LZ_decompress_write_size(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_errno(lzptr : !lzdecoderptr) : LZ_Errno =
  "ext#"

fn LZ_decompress_finished(lzptr : !lzdecoderptr) : int =
  "ext#"
