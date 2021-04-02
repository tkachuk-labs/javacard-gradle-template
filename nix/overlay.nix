{
  vimBackground ? "light",
  vimColorScheme ? "PaperColor"
}:
[
  (self: super:
    {
      haskell-ide = import (
        fetchTarball {
          url = "https://github.com/tim2CF/ultimate-haskell-ide/tarball/d455f6a3c7f7c363efa65da2ff003dbf3b4228d2";
          sha256 = "0c95wr7c4q2jsn6sy33xqwarrs1qdbmvr5b6nsgpfazvzflc9h7p";
        }
      ) {inherit vimBackground vimColorScheme;};
    }
  )
]
