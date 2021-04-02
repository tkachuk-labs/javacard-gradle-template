let nixpkgs = import ./nixpkgs.nix;
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
      inherit vimBackground vimColorScheme;
    };
  },
  vimBackground ? "light",
  vimColorScheme ? "PaperColor",
  gitAuthorName,
  gitAuthorEmail
}:
with pkgs;


stdenv.mkDerivation {
  name = "workspace";
  buildInputs = [
    /* IDE */
    haskell-ide
    /* Utils */
    git
    cacert
  ];

  TERM="xterm-256color";
  GIT_SSL_CAINFO="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_PATH="/nix/var/nix/profiles/per-user/root/channels";
  GIT_AUTHOR_NAME = gitAuthorName;
  GIT_AUTHOR_EMAIL = gitAuthorEmail;
  EMAIL = gitAuthorEmail;
  shellHook = ''
  '';
}
