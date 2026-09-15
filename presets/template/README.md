# Preset template

The typical preset filetree:
```
presets/template
├── post-install
│   └── <scripts to run after install>
├── homedir
│   └── <files to put in $HOME>
├── rootdir
│   └── <files to put in "/">
└── pkgs
```

## homedir

The content of "homedir" will be placed in $HOME "/home/<user>" (if a non-root user was created).

```homedir
# In your preset directory
homedir/<a-directory>
homedir/.config/<your-config-file>

#In the created ISO
$HOME/<a-directory>
$HOME/.config/<your-config-file>
```
## rootdir

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


