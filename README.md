# SwagOS

A [Void](https://voidlinux.org)-based operating system inspired by Nix, Arco linux, Antix and Puppy linux.
For novices to learn linux and powerusers to customize it and make it replicable.

! SwagOS is NOT an immutable OS !


### Main features:

- OS configuration tools
- OS replication tools (scripts that detects current configurations and installed packages)
- Preset/Profile manager (Manage modular presets)
- ISO builder (generate ISOs from selected profiles and presets)

The purpose of SwagOS is to give you the ability to make your own custom linux distribution on top of Void linux
Like in [AntiX](https://antixlinux.com) or [Arco](https://arcolinux.com), we also aim to provide system configuration tools that don't
depend from a destop environement. Not only it allows users to build their own lightweight desktop experience, this also provide better educational
content than the usual GUI apps that just does all the magic without showing any of the underlying system operations.


---

## Tools

### Preset manager

An interface to manage the OS configration presets.

A single preset can consist of:
- **cutom directories**
inside the 'custom-dirs' directory, files can be placed from '/' in 'rootdir' or from '/home/$USER' in 'homedir'
- **a package list**
in 'packages', a list of xbps packages can be provided


---

## Preset template

The typical preset filetree:
```
presets/<your-preset>
├── post-install
│   └── <scripts to run after install>
├── homedir
│   └── <files to put in $HOME>
├── rootdir
│   └── <files to put in "/">
└── pkgs
```


### homedir

The content of "homedir" will be placed in $HOME "/home/<user>" (if a non-root user was created).

```homedir
# In your preset directory
homedir/<a-directory>
homedir/.config/<your-config-file>

# In the created ISO
$HOME/<a-directory>
$HOME/.config/<your-config-file>
```


### rootdir

The content of "rootdir" will be placed in the root "/" of the ISO's filesystem.

example:
```rootdir
# In your preset directory
rootdir/etc/default/<your-file>
rootdir/bin/<another-file>

# In the created ISO
/etc/default/<your-file>
/bin/<another-file>
```


### pkgs

The pkgs file contains xbps packages to be installed.

The synthax is very simple, it only take one package per line and ignore lines starting with "#".
If more flexibility is required to check conditions, use post-install scripts instead.

example content of a pkgs file:
```pkgs
# My text editor
neovim
## deps
lua51
luarocks
tree-sitter-cli
ripgrep

# Applications
xterm
alacritty
firefox
pcmanfm
qbittorrent

# CLI utilities
bat
ncdu
eza
git
htop
curl
wget
```


### post-install

The post-install directory can contain shell scripts that will run after the packages are installed
and the homedir and rootdir content replicated.

If a script name starts with digits and a "-" character (i.e "2-script.sh", "135-script.sh"),
the first digits will be considered a single number (so unlike in alpha-num order, "1-script.sh"
will be executed before "099-script.sh")

("00-a-script.sh" runs before "01-another-script.sh")
