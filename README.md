# Picardas' Homebrew Tap

This is my personal Homebrew tap.

|Package|Description|Install
|-|-|-|
|`picardas-git-credential-manager`|Rootless install of GCM|`brew install --cask picardas/homebrew-personal/picardas-git-credential-manager`|

## Installing a Cask

`brew install --cask picardas/homebrew-personal/<cask>`

Or `brew tap picardas/homebrew-personal` and then `brew install --cask <cask>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "picardas/homebrew-personal"
cask "<cask>"
```

## Installing a formulae?

`brew install picardas/homebrew-personal/<formula>`

Or `brew tap picardas/homebrew-personal` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "picardas/personal"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

