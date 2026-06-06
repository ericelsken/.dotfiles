# .dotfiles
Where all my dotfiles live :)

# Stow
These dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Quick setup (one-liner)
- After cloning this repo to `~/.dotfiles`, run:
  - `sh ~/.dotfiles/.local/share/e2/plugins/dotfiles-stow`
  - This stows the `home` package.

## Installation / Bootstrapping
- Clone the repo (manually or via the e2 installer):
  - `git clone https://github.com/ericelsken/.dotfiles ~/.dotfiles`
  - Or: `e2 dotfiles-install` (if `e2` is already available)
- Then run the quick setup one-liner above.

## Stow Packages
- `home`

## Notes
- Preferred XDG layout: primary Git config is `~/.config/git/gitconfig`; `./home/.gitconfig` includes it.
