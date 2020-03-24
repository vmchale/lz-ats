abstype LZ_Errno

fn LZ_version() : string =
  "ext#"

fn LZ_sterror(LZ_Errno) : string =
  "ext#"

fn LZ_min_dictionary_size() : int =
  "ext#"

fn LZ_min_dictionary_bits() : int =
  "ext#"

fn LZ_max_dictionary_size() : int =
  "ext#"

fn LZ_max_dictionary_bits() : int =
  "ext#"

fn LZ_min_match_len_limit() : int =
  "ext#"

fn LZ_max_match_len_limit() : int =
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

fn LZ_compress_restart_member(lzptr : !lzencoderptr, ullint) : int =
  "ext#"

fn LZ_compress_sync_flush(lzptr : !lzencoderptr) : int =
  "ext#"

fn LZ_compress_read {l:addr}{sz:nat}{ m : nat | m <= sz }(pf : !bytes_v(l, sz) | lzptr : !lzencoderptr, ptr(l), int(m)) :
  intLte(m) =
  "ext#"

fn LZ_compress_write {l:addr}{sz:nat}(pf : !bytes_v(l, sz) | lzptr : !lzencoderptr, ptr(l), intLte(sz)) : int =
  "ext#"

fn LZ_compress_write_size(lzptr : !lzencoderptr) : int =
  "ext#"

fn LZ_compress_errno(lzptr : !lzencoderptr) : LZ_Errno =
  "ext#"

fn LZ_compress_finished(lzptr : !lzencoderptr) : int =
  "ext#"

fn LZ_compress_member_finished(lzptr : !lzencoderptr) : int =
  "ext#"

absvt@ype LZ_decoder

vtypedef lzdecoderptr = [l:addr] (LZ_decoder @ l | ptr(l))

fn LZ_decompress_open() : lzdecoderptr =
  "ext#"

fn LZ_decompress_close(lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_finish(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_reset(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_sync_to_member(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_read {l:addr}{sz:nat}{ m : nat | m <= sz }(pf : !bytes_v(l, sz) | lzptr : !lzdecoderptr, ptr(l), int(m)) :
  intLte(m) =
  "ext#"

fn LZ_decompress_write {l:addr}{sz:nat}(pf : !bytes_v(l, sz) | lzptr : !lzdecoderptr, ptr(l), intLte(sz)) : int =
  "ext#"

fn LZ_decompress_write_size(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_errno(lzptr : !lzdecoderptr) : LZ_Errno =
  "ext#"

fn LZ_decompress_finished(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_member_finished(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_member_version(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_dictionary_size(lzptr : !lzdecoderptr) : int =
  "ext#"

fn LZ_decompress_data_crc(lzptr : !lzdecoderptr) : uint =
  "ext#"

fn LZ_decompress_data_position(lzptr : !lzdecoderptr) : ullint =
  "ext#"

fn LZ_decompress_member_position(lzptr : !lzdecoderptr) : ullint =
  "ext#"

fn LZ_decompress_total_in_size(lzptr : !lzdecoderptr) : ullint =
  "ext#"

fn LZ_decompress_total_out_size(lzptr : !lzdecoderptr) : ullint =
  "ext#"
