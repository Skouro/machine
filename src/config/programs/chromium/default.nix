_: with _; {
  enable = true;
  extensions = [
    "glnpjglilkicbckjpbgcfkogebgllemb" # okta
    "hdokiejnpimakedhajhdlcegeplioahd" # lastpass
  ];
  # https://chromeenterprise.google/policies/
  extraOpts = {
    BookmarkBarEnabled = true;
    BrowserSignin = 1;
    DefaultBrowserSettingEnabled = false;
    ManagedBookmarks = [
      { toplevel_name = "Go"; }
      {
        name = "okta";
        url = "https://fluidattacks.okta.com";
      }
      {
        name = "diff";
        url = "https://gitlab.com/fluidattacks/product/-/compare/master...drestrepoatfluid";
      }
      {
        name = "pipelines";
        url = "https://gitlab.com/fluidattacks/product/-/pipelines?page=1&scope=all&ref=drestrepoatfluid";
      }
      {
        name = "makes-pr";
        url = "https://github.com/fluidattacks/makes/compare/main...drestreporueda:main";
      }
      {
        name = "nixos-options";
        url = "https://search.nixos.org/options";
      }
      {
        name = "home-manager-manual";
        url = "https://nix-community.github.io/home-manager";
      }
      {
        name = "home-manager-options";
        url = "https://nix-community.github.io/home-manager/options.html";
      }
      {
        name = "timedoctor";
        url = "https://login.timedoctor.com";
      }
    ];
    PasswordManagerEnabled = false;
    ShowAppsShortcutInBookmarkBar = false;
  };
}
