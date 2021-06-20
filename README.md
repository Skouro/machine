# My development machine, as code

1. (optional) if you want to dual-boot with Windows,
    install Windows first and then continue this tutorial

1. Download _NixOS minimal ISO image_ from the
    [NixOS's download page](https://nixos.org/download).

1. Burn NixOS into a USB stick:

    ```bash
    lsblk
    blk=/dev/xxx
    sudo umount "${blk}"
    sudo dd conv=fdatasync if=nixos.iso of="${blk}" status=progress
    ```

1. Boot from the USB stick, start the installation and then login as root.

1. Now you need to create an empty partition
    where we will place NixOS,
    use the following commands as needed:

    - List block devices: `lsblk -fr`
    - Create a partition table: `parted "${blk}" -- mktable gpt`
    - Remove a partition: `parted "${blk}" -- rm "${number}"`

1. We will now setup the NixOS file system
    in the space allocated in the previous step

    ```bash
    # Print the current partitioning state
    parted "${blk}" -- unit MiB print

    # Prepare boot device
    if in_dual_boot; then
      # Remove the Windows-managed boot partition
      parted "${blk}" -- rm "${number}"
    fi
    parted "${blk}" -- mkpart ESP fat32 "${start:-1MiB}" "${end:-512MiB}"
    parted "${blk}" -- set "${number}" esp on
    mkfs.fat -F 32 -n boot /dev/disk/by-partlabel/ESP

    # Prepare root device
    parted "${blk}" -- mkpart primary "${start}" "${end:-100%}"
    cryptsetup luksFormat /dev/disk/by-partlabel/primary
    cryptsetup luksOpen /dev/disk/by-partlabel/primary cryptroot
    mkfs.ext4 -L nixos /dev/mapper/cryptroot

    # Mount stuff
    mount /dev/disk/by-label/nixos /mnt
    mkdir /mnt/boot
    mount /dev/disk/by-partlabel/ESP /mnt/boot
    ```

1. Get your GitHub API token from the
    [secrets file](https://github.com/kamadorueda/secrets/blob/master/machine/secrets.sh)
    and export it into the terminal.

1. Install git with `nix-env -i git`.

1. Clone this repository:

    ```bash
          mkdir -p /home/kamadorueda/Documents/github/kamadorueda \
      &&  pushd /home/kamadorueda/Documents/github/kamadorueda \
        &&  git clone "https://kamadorueda:${GIHUB_API_TOKEN}@github.com/kamadorueda/machine" \
      &&  popd
    ```

1. Update your hardware configuration at `src/hardware/default.nix`
    with the results of: `nixos-generate-config --show-hardware-config`.

1. Rebuild with:

    ```bash
    NIX_PATH="nixos-config=/home/kamadorueda/Documents/github/kamadorueda/machine/configuration.nix:${NIX_PATH}" \
    nixos-rebuild switch
    ```

1. Logout and login as the new user.

1. Setup the state:

    - github/kamadorueda/secrets:

      ```bash
          mkdir -p ~/Documents/github/kamadorueda \
      &&  pushd ~/Documents/github/kamadorueda \
        &&  git clone "https://kamadorueda:${GIHUB_API_TOKEN}@github.com/kamadorueda/secrets" \
        &&  cd secrets/machine \
          &&  ./install.sh \
      &&  popd
      ```

    - gitlab/fluidattacks:

      ```bash
          mkdir -p ~/Documents/gitlab/fluidattacks \
      &&  pushd ~/Documents/gitlab/fluidattacks \
        &&  git clone git@gitlab.com:fluidattacks/product \
        &&  git clone git@gitlab.com:fluidattacks/services \
      &&  popd
      ```

# Timedoctor

You may find useful to install [Timedoctor](https://www.timedoctor.com/)
via [Nix](https://nixos.org).

1. `$ nix-build -A packages.timedoctor https://github.com/kamadorueda/machine/archive/main.tar.gz`

2. `$ ./result/bin/timedoctor`

Source: [a8547c04](https://github.com/kamadorueda/machine/commit/a8547c048cfe34bc78475a8c8621b226426b81ab)

# Useful links

- [NixOS options](https://nixos.org/manual/nixos/stable/options.html)
- [NixOS options search](https://search.nixos.org/options)
- [Home Manager options](https://nix-community.github.io/home-manager/options.html)
