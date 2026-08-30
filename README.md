# Dotfiles

Personal system configuration to bootstrap a new macOS (and, partially, Linux)
development environment: shell, editor, Git, terminal apps, and GUI
applications. Built around [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
and [Homebrew](https://brew.sh).

## Quickstart

```sh
git clone git@github.com:ryanmcdowell/dotfiles.git ~/Developer/Projects/dotfiles
cd ~/Developer/Projects/dotfiles
./bootstrap.sh
```

`bootstrap.sh` is the entry point. It's safe to re-run on a machine that's
already set up since it skips finished work instead of failing. Running it
will:

1. Pull the latest version of this repo.
2. Run `shell.sh`, which installs Homebrew and CLI tools, sets up SSH access
   to GitHub, installs Oh My Zsh and its plugins, installs iTerm2 and fonts
   (macOS only), and symlinks the dotfiles below into `$HOME`.
3. Run `app.sh` on macOS to install GUI applications via Homebrew Cask.
4. Register a nightly cron job that runs `synch.sh` to pull local app
   settings back into this repo (see [Keeping settings in sync](#keeping-settings-in-sync)).

## Layout

| Path | Purpose |
|---|---|
| `bootstrap.sh` | Entry point; orchestrates everything below |
| `shell.sh` | Installs Homebrew, CLI tools, Oh My Zsh + plugins; sets up GitHub SSH access; symlinks the dotfiles into `$HOME` |
| `app.sh` | macOS only. Installs GUI apps via Homebrew Cask; comment out any `brew install --cask` line to skip it |
| `vim.sh` | Installs Vundle and vim plugins, symlinks `vimrc` |
| `macOs.sh` | Optional macOS system-preference tweaks (Dock, Finder, trackpad, etc.). Not run automatically; see [Manual / opt-in steps](#manual--opt-in-steps) |
| `synch.sh` | Backs up local app settings into this repo; run nightly via cron, or manually |
| `aliases`, `environment`, `functions`, `gitconfig`, `motd`, `screenrc`, `vimrc`, `zshrc` | The actual dotfiles, symlinked into `$HOME` (e.g. `zshrc` → `~/.zshrc`) by `shell.sh` |
| `p10k.zsh` | Powerlevel10k prompt configuration, symlinked to `~/.p10k.zsh` |
| `config/` | App-specific config: `archey4` is symlinked in by `shell.sh`, `sublime-text3` is kept up to date by `synch.sh`, and `iTerm2` is a one-off manual export that no script currently syncs |
| `ticker.yaml` | Watchlist for the [`ticker`](https://github.com/achannarasappa/ticker) CLI. Not yet linked automatically; see below |

## Customizing without forking

Two override points exist so machine- or employer-specific config never has
to live in this (public) repo:

- `~/.local/aliases`, sourced at the end of `aliases` if it exists. Put
  anything here you don't want to publish.
- `~/.gitconfig.local`, included at the end of `gitconfig` via `[include]`.
  Git skips this silently if the file doesn't exist, so it's fine to leave
  absent on machines that don't need it, like a work-specific
  `core.hooksPath`.

Neither file is created by `bootstrap.sh`; create them yourself on the
machines that need them.

## Manual / opt-in steps

A couple of things intentionally aren't wired into `bootstrap.sh`.

`macOs.sh` changes system-wide preferences (Dock, Finder, trackpad,
Spotlight, and so on). Review it before running, then apply it yourself:

```sh
sh macOs.sh
```

`ticker.yaml` isn't symlinked by `shell.sh` yet. If you use the `ticker`
CLI, link it in yourself:

```sh
mkdir -p ~/.config/ticker
ln -sf "$(pwd)/ticker.yaml" ~/.config/ticker/config.yaml
```

## Keeping settings in sync

`bootstrap.sh` installs a nightly cron job that runs `synch.sh`, which
`rsync`s your local Sublime Text 3 user settings into `config/sublime-text3/`.
It only runs one way, from the local machine to the repo, so you still need
to commit and push the result yourself.

## Platform support

macOS (`Darwin`) is the primary target and fully supported. Linux support in
`shell.sh` covers the base shell and CLI tools, but `app.sh` and `macOs.sh`
are macOS-only and won't run there.

### Installing fonts on Linux

Homebrew Cask handles fonts automatically on macOS. On Linux, clone the
following repo and install the `.ttf` files manually:

```sh
git clone https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy
```

## License

[MIT](LICENSE)
