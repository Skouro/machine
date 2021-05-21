with import ./packages.nix;
with import ./sources.nix;
with import ./utils.nix;
{
  # Home manager configuration:
  # https://nix-community.github.io/home-manager/options.html

  home.packages = [
    (packages.nixpkgs.awscli)
    (packages.nixpkgs.black)
    (packages.nixpkgs.burpsuite)
    (packages.nixpkgs.cabal-install)
    (packages.nixpkgs.cargo)
    (packages.nixpkgs.curl)
    (packages.nixpkgs.diction)
    (packages.nixpkgs.diffoscope)
    (packages.nixpkgs.direnv)
    (packages.nixpkgs.gcc)
    (packages.nixpkgs.ghc)
    (packages.nixpkgs.gnumake)
    (packages.nixpkgs.gnupg)
    (packages.nixpkgs.google-chrome)
    (packages.nixpkgs.hugo)
    (packages.nixpkgs.jq)
    (packages.nixpkgs.kubectl)
    (packages.nixpkgs.libreoffice)
    (packages.nixpkgs.maven)
    (packages.nixpkgs.mypy)
    (packages.nixpkgs.ngrok)
    (packages.nixpkgs.nixpkgs-fmt)
    (packages.nixpkgs.nodejs)
    (packages.nixpkgs.optipng)
    (packages.nixpkgs.parallel)
    (packages.nixpkgs.pcre)
    (packages.nixpkgs.peek)
    (packages.nixpkgs.python38)
    (packages.nixpkgs.sops)
    (packages.nixpkgs.terraform)
    (packages.nixpkgs.tokei)
    (packages.nixpkgs.tree)
    (packages.nixpkgs.vim)
    (packages.nixpkgs.vlc)
    (packages.nixpkgs.writeTextDir "etc/profile.d/bashrc" (builtins.readFile ./bashrc.sh))
    (packages.nixpkgs.xclip)
    (packages.nixpkgs.yq)
    (packages.product.makes-dev-vscode)
    (utils.directory "product" sources.product)
  ];
  programs.git.enable = true;
  programs.git.extraConfig.commit.gpgsign = true;
  programs.git.extraConfig.gpg.progam = "gpg2";
  programs.git.extraConfig.gpg.sign = true;
  programs.git.extraConfig.init.defaultBranch = "main";
  programs.git.extraConfig.user.email = "kamadorueda@gmail.com";
  programs.git.extraConfig.user.name = "Kevin Amado";
  programs.git.extraConfig.user.signingkey = "FFF341057F503148";
  programs.git.package = packages.nixpkgs.git;
}
