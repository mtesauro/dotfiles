## Command examples

Setup bashrc with GNU stow:
```
$ stow -t /home/mtesauro/ bash
```
where the bash subdirectory looks like:
```
$ tree -a bash/
bash/
└── .bashrc

0 directories, 1 file
```
And the result of the stow command is:
```
$ ls -lah ~ | grep bashrc
lrwxrwxrwx  1 mtesauro mtesauro   26 Aug 27 19:28 .bashrc -> sink/dotfiles/bash/.bashrc
```
Command for nvim
```
$ stow -t /home/mtesauro/.config/ nvim
```

