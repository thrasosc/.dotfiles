# Dotfiles

This repository contains my personal [dotfiles](https://wiki.archlinux.org/title/Dotfiles) configuration, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
git clone https://github.com/thrasosc/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```
> **Note:**
> - If something new *should* be **tracked**, update `.gitignore` accordingly.
> - If something new *should not* be **stowed**, update `.stow-local-ignore` accordingly.
