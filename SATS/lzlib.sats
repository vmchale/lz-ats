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
