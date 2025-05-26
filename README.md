# Dotfiles

This repository contains my personal [dotfiles](https://wiki.archlinux.org/title/Dotfiles) configuration, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
git clone https://github.com/thrasosc/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

- If something new *should* be tracked, update `.gitignore` accordingly.
- If something *should not* be tracked, update `.stow-local-ignore` accordingly.
