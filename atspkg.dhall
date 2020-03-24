let prelude =
      https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in    prelude.default
    ⫽ { bin =
        [   prelude.bin
          ⫽ { src = "src/lz.dats", target = "${prelude.atsProject}/lz-file" }
        ]
      , compiler = [ 0, 4, 0 ]
      , version = [ 0, 3, 13 ]
      , atsLib = False
      , cflags = [ "-O2", "-flto", "-llz" ]
      }
