let prelude =
      https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in    prelude.default
    ⫽ { bin =
        [   prelude.bin
          ⫽ { src = "src/lz.dats", target = "${prelude.atsProject}/lz-file" }
        ]
      }
