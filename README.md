# Picardas Personal

This is my personal Homebrew tap. It currently only has a cask for installing `git-credential-manager` without using root privileges.

## Installing a Cask

`brew install --cask picardas/personal/<cask>`

Or `brew tap picardas/personal` and then `brew install --cask <cask>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "picardas/personal"
cask "<cask>"
```

For `git-credential-manager` use `picardas-git-credential-manager` as the `<cask>`.

## Installing a formulae?

`brew install picardas/personal/<formula>`

Or `brew tap picardas/personal` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "picardas/personal"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
