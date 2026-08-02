# Panarch Homebrew Tap

Official Homebrew tap for Panarch macOS applications and command-line tools.

## Install

Install a macOS application directly from this tap:

```sh
brew install --cask panarch/tap/<cask>
```

Install a command-line tool directly from this tap:

```sh
brew install panarch/tap/<formula>
```

Using the fully qualified name automatically adds the tap and trusts only the
requested package. A separate `brew tap panarch/tap` command is not required.

## Layout

- `Casks/` contains macOS application casks.
- `Formula/` contains command-line tool formulae.

Package-specific installation instructions belong in the upstream project's
release documentation. This repository contains only Homebrew metadata.
