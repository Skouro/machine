_: with _; utils.script {
  env = {
    argExtensions = packages.nixpkgs.symlinkJoin {
      name = "extensions";
      paths = [
        packages.nixpkgs.vscode-extensions._4ops.terraform
        packages.nixpkgs.vscode-extensions.coenraads.bracket-pair-colorizer-2
        packages.nixpkgs.vscode-extensions.coolbear.systemd-unit-file
        packages.nixpkgs.vscode-extensions.jkillian.custom-local-formatters
        packages.nixpkgs.vscode-extensions.redhat.vscode-yaml
        packages.nixpkgs.vscode-extensions.haskell.haskell
        packages.nixpkgs.vscode-extensions.mads-hartmann.bash-ide-vscode
        packages.nixpkgs.vscode-extensions.shardulm94.trailing-spaces
        packages.nixpkgs.vscode-extensions.streetsidesoftware.code-spell-checker
        packages.nixpkgs.vscode-extensions.tamasfe.even-better-toml
      ] ++ packages.nixpkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "remote-ssh-edit";
          publisher = "ms-vscode-remote";
          version = "0.47.2";
          sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        }
        {
          name = "terminal";
          publisher = "formulahendry";
          version = "0.0.10";
          sha256 = "0gj71xy7r82n1pic00xsi04dg7zg0dsxx000s03iq6lnz47s84gn";
        }
        {
          name = "haskell";
          publisher = "haskell";
          version = "1.6.1";
          sha256 = "1l6nrbqkq1p62dkmzs4sy0rxbid3qa1104s3fd9fzkmc1sldzgsn";
        }
        {
          name = "language-haskell";
          publisher = "justusadam";
          version = "3.4.0";
          sha256 = "0ab7m5jzxakjxaiwmg0jcck53vnn183589bbxh3iiylkpicrv67y";
        }
        {
          name = "rust";
          publisher = "rust-lang";
          version = "0.7.8";
          sha256 = "039ns854v1k4jb9xqknrjkj8lf62nfcpfn0716ancmjc4f0xlzb3";
        }
        {
          name = "vscodeintellicode";
          publisher = "visualstudioexptteam";
          version = "1.2.14";
          sha256 = "1j72v6grwasqk34m1jy3d6w3fgrw0dnsv7v17wca8baxrvgqsm6g";
        }
        {
          name = "vscode-pylance";
          publisher = "ms-python";
          version = "2021.11.2";
          sha256 = "0di2skybp8jw3apyd74ifsrsp02hr84j92jpgkipdqyqmis4bbmm";
        }
        {
          name = "python";
          publisher = "ms-python";
          version = "2021.11.1422169775";
          sha256 = "1ax0lr0r9ip8pb3fzg462c00q98rlnpq5al5fkgaywcyx2k9pib3";
        }
        {
          name = "rest-client";
          publisher = "humao";
          version = "0.24.5";
          sha256 = "1hj294nsmlzvhbvwv4wyf7mgfw64q4pgkjzzgyjfc26pzyaxb4bn";
        }
        {
          name = "beautify";
          publisher = "hookyqr";
          version = "1.5.0";
          sha256 = "1c0kfavdwgwham92xrh0gnyxkrl9qlkpv39l1yhrldn8vd10fj5i";
        }
        {
          name = "gitlens";
          publisher = "eamodio";
          version = "11.7.0";
          sha256 = "0apjjlfdwljqih394ggz2d8m599pyyjrb0b4cfcz83601b7hk3x6";
        }
        {
          name = "vscode-icons";
          publisher = "vscode-icons-team";
          version = "11.7.0";
          sha256 = "06a0br8szsf3i72hhq233p08b5zp7wdb8nn29h1gblhgzmv1p830";
        }
        {
          name = "magicpython";
          publisher = "magicstack";
          version = "1.1.0";
          sha256 = "08zwzjw2j2ilisasryd73x63ypmfv7pcap66fcpmkmnyb7jgs6nv";
        }
        {
          name = "prettify-json";
          publisher = "mohsen1";
          version = "0.0.3";
          sha256 = "1spj01dpfggfchwly3iyfm2ak618q2wqd90qx5ndvkj3a7x6rxwn";
        }
        {
          name = "jupyter";
          publisher = "ms-toolsai";
          version = "2021.9.1001220611";
          sha256 = "0yzmqyzh3c0vwxl4w5i5cvi1vc5y37szjllk1rfg5hivh6d0py54";
        }
        {
          name = "gitlens";
          publisher = "eamodio";
          version = "11.6.0";
          sha256 = "0lhrw24ilncdczh90jnjx71ld3b626xpk8b9qmwgzzhby89qs417";
        }
        {
          name = "Nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
        }
        {
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "1.0.7";
          sha256 = "0mralimyzhyp4x9q98x3ck64ifbjqdp8cxcami7clvdvkmf8hxhf";
        }
        {
          name = "vscode-java-pack";
          publisher = "vscjava";
          version = "0.18.7";
          sha256 = "0klivkkhp7xb1s6nqkl3r1gac21mdpdgz9f381lk1321rzvnr0gm";
        }
      ];
    };
    argSettings = builtins.toJSON {
      "[html]" = {
        "editor.formatOnSave" = false;
      };
      "[python]" = { "editor.tabSize" = 4; };
      "customLocalFormatters.formatters" = [
        {
          command = "${packages.nixpkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
          languages = [ "nix" ];
        }
        {
          command =
            (packages.nixpkgs.writeScript "python-fmt" ''
              #! ${packages.nixpkgs.bash}/bin/bash

              PYTHONPATH=/pythonpath/not/set

              ${packages.pythonOnNix.projects.black.latest.pythonLatest.bin}/bin/black \
                --config \
                ${sources.product}/makes/utils/python-format/settings-black.toml \
                - \
                | \
              ${packages.pythonOnNix.projects.isort.latest.pythonLatest.bin}/bin/isort \
                --settings-path \
                ${sources.product}/makes/utils/python-format/settings-isort.toml \
                -
            '').outPath;
          languages = [ "python" ];
        }
        {
          command = "${packages.nixpkgs.shfmt}/bin/shfmt -bn -ci -i 2 -s -sr -";
          languages = [ "shellscript" ];
        }
        {
          command = "${packages.nixpkgs.terraform}/bin/terraform fmt -";
          languages = [ "tf" ];
        }
      ];
      "diffEditor.ignoreTrimWhitespace" = false;
      "diffEditor.maxComputationTime" = 0;
      "diffEditor.renderSideBySide" = true;
      "diffEditor.wordWrap" = "on";
      "editor.cursorStyle" = "line";
      "editor.defaultFormatter" = "jkillian.custom-local-formatters";
      "editor.formatOnPaste" = false;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = false;
      "editor.fontFamily" = "'${abs.font}'";
      "editor.fontSize" = 16.5;
      "editor.minimap.maxColumn" = 80;
      "editor.minimap.renderCharacters" = false;
      "editor.minimap.showSlider" = "always";
      "editor.minimap.side" = "rigth";
      "editor.minimap.size" = "fill";
      "editor.rulers" = [ 80 ];
      "editor.tabSize" = 2;
      "editor.wordWrap" = "on";
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "extensions.autoUpdate" = false;
      "files.eol" = "\n";
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "python.analysis.autoSearchPaths" = true;
      "python.analysis.diagnosticMode" = "workspace";
      "python.formatting.provider" = "none";
      "python.languageServer" = "Pylance";
      "python.linting.enabled" = true;
      "python.linting.lintOnSave" = true;
      "python.linting.mypyArgs" = [
        "--config-file"
        "${sources.product}/makes/utils/lint-python/settings-mypy.cfg"
      ];
      "python.linting.mypyEnabled" = true;
      "python.linting.mypyPath" = "${packages.pythonOnNix.projects.mypy.latest.pythonLatest.bin}/bin/mypy";
      "python.linting.prospectorArgs" = [
        "--profile"
        "${sources.product}/makes/utils/lint-python/settings-prospector.yaml"
      ];
      "python.defaultInterpreterPath" = "/run/current-system/sw/bin/python3.8";
      "python.linting.prospectorEnabled" = true;
      "python.linting.prospectorPath" = "${packages.pythonOnNix.projects.prospector.latest.pythonLatest.bin}/bin/prospector";
      "python.linting.pylintEnabled" = false;
      "python.pythonPath" = "${packages.nixpkgs.python38}/bin/python";
      "security.workspace.trust.enabled" = false;
      "telemetry.enableCrashReporter" = false;
      "telemetry.enableTelemetry" = false;
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "window.zoomLevel" = 0;
      "workbench.colorTheme" = "Default Dark";
      "workbench.editor.enablePreview" = true;
      "workbench.editor.focusRecentEditorAfterClose" = false;
      "workbench.editor.openPositioning" = "last";
      "workbench.settings.editor" = "json";
      "workbench.startupEditor" = "none";
      "workbench.iconTheme" = "vscode-icons";
    };
    argsKeyBindings = builtins.toJSON [
      {
        key = "ctrl+d";
        command = "editor.action.copyLinesDownAction";
        when = "editorTextFocus && !editorReadonly";
      }
    ];
  };
  src = ./activate.sh;
}
