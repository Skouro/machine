# Kamadorueda's development machine, as code

1.  Make sure your system has `curl` installed

1.  Install nix as explained in the
    [Nix's download page](https://nixos.org/download):

    ```bash
    curl -L nixos.org/nix/install | sh
    ```

1.  Execute:

    ```bash
    # Optional:
    # mkdir -p ~/Documents/github/kamadorueda
    # pushd    ~/Documents/github/kamadorueda
    git clone https://kamadorueda@github.com/kamadorueda/machine
    cd machine
    nix-env -if ./home-manager.nix
    home-manager -f ./home.nix switch
    ```

1.  Add the following line to your ~/.bashrc:

    `$ source ~/.nix-profile/etc/profile.d/bashrc`

1.  Install Timedoctor as explained in the
    [Timedoctor's download page](https://www.timedoctor.com/es/download.html)

    This step is required to be done in the host as timedoctor
    is not compatible with Nix at the moment

# Additional deployment steps for kamadorueda

Applies to myself only:

1.  Configure git:

    ```bash
    git config --global commit.gpgsign true
    git config --global init.defaultBranch main
    git config --global user.signingkey FFF341057F503148
    git config --global user.email kamadorueda@gmail.com
    git config --global user.name 'Kevin Amado'
    git config --global gpg.sign true
    git config --global gpg.progam gpg2
    ```

1.  Clone repositories:

    1.  Enhance your bashrc with your
        [base secrets](https://github.com/kamadorueda/secrets/blob/master/machine/bashrc)

    2.  ```bash
            mkdir -p ~/Documents/github/kamadorueda \
        &&  pushd    ~/Documents/github/kamadorueda \
        &&  git clone "https://kamadorueda:${GIHUB_API_TOKEN}@github.com/kamadorueda/secrets" \
        &&  pushd secrets/machine \
          &&  install.sh \
        &&  popd \
        &&  git clone git@github.com:kamadorueda/machine \
        &&  mkdir -p ~/Documents/gitlab/fluidattacks \
        &&  pushd    ~/Documents/gitlab/fluidattacks \
          &&  git clone git@gitlab.com:fluidattacks/product \
        &&  popd
        ```
