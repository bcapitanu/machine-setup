# machine-setup

**Step 0**: back up any files that you'll overwrite in Step 1

**Step 1**: copy all the files from this repo into $HOME

Then, 

1. Make sure you installed `sublime-text` to have an easy-to-use text editor available
```
brew install sublime-text
```

2. Use the newly-installed sublime-text to edit $HOME/.common_profile to set the missing keys
```
subl ~/.common_profile
```

- set `HOMEBREW_GITHUB_API_TOKEN` (line 6) to the token you generated from `github.com` for homebrew
```
export HOMEBREW_GITHUB_API_TOKEN=...token...
```
- set `CFTOOLS_API_KEY` to the token generated from Codefresh (create one at https://g.codefresh.io/user/settings - for simplicity, add all the scopes for the token)
```
export CFTOOLS_API_KEY=...token...
```
Save and close the file.

3. Run the following commands
- update Homebrew packages
```
brew update && brew upgrade && brew cleanup
```

- log in to github enterprise using "gh"
```
gh auth login --hostname github.asapp.dev
```

- log in to github.com using "gh"
```
gh auth login
```

- set up the appropriate version of kubectl to use
```
asdf plugin add kubectl
asdf set kubectl --home 1.33.6
```

- install multiple recent-ish python versions via "uv"
```
uv python install 3.10 3.12 3.13 3.14
```

- install other necessary tools
```
pipx install --python python3.12 cftools
pipx install --python python3.12 asapp-modelstash
pipx install --python python3.12 asapp-corpora
pipx install --python python3.12 graf
```

- set up corpora access
```
corpora doctor —-set-team mle
```

