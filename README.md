# .dotfilesv2
Where all my dotfiles live :)

# Stow
These dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Quick setup (one-liner)
- After cloning this repo to `~/.dotfiles`, run:
  - `sh ~/.dotfiles/.local/share/e2/plugins/dotfiles-stow`
  - This stows `.config` into `$HOME/.config`, `.local` into `$HOME/.local`, and links top-level files: `.bashrc`, `.bash_profile`, `.gitconfig`.

## Installation / Bootstrapping
- Clone the repo (manually or via the e2 installer):
  - `git clone https://github.com/ericelsken/.dotfilesv2 ~/.dotfiles`
  - Or: `e2 dotfiles-install` (if `e2` is already available)
- Then run the quick setup one-liner above.

## Stow Packages
- `.config` (alacritty, aws, bash, git, nvim, tmux, ...)
- `.local` (bin, share/e2, ...)

## Notes
- Preferred XDG layout: primary Git config is `~/.config/git/gitconfig`; `~/.gitconfig` includes it.
