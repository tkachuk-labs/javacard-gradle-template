{
  vimBackground ? "light",
  vimColorScheme ? "PaperColor"
}:
[
  (self: super:
    {
      haskell-ide = import (
        fetchTarball {
          url = "https://github.com/tim2CF/ultimate-haskell-ide/tarball/a3424a3100f9be4fa88603999db988bf87d91718";
          sha256 = "0md09q8a9kkbwfxw8mfn5lxii34k52rphc6g5kd5nnbd3rbpl4c4";
        }
      ) {inherit vimBackground vimColorScheme;};
    }
  )
]
