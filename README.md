# gh-start

A quick workflow for starting new stories:

- Automatically generates branch name from story description.
- Creates and checks out the new branch.
- Opens a draft pull request with title based on story description.
- (When given a GitHub issue) assigns user to issue and populates PR title/description.

Extracted from https://github.com/cookpad/cp8_cli to work with the
[GitHub Cli](https://github.com/cli/cli).

## Usage

```bash
gh start "My new story" # creates jb/my-new-story branch and opens PR
gh start https://github.com/balvig/gh-start/issues/1 # creates jb/issue-title branch and opens PR
```

## Demo

<img src="demo.gif" alt="Demo Animation" width="700" />

## Installation

- [Install GitHub CLI](https://github.com/cli/cli#installation)
- Requires Ruby and Bundler to be installed.

```bash
gh extension install https://github.com/balvig/gh-start
```

To upgrade to the lastest version:

```bash
gh extension upgrade start
```

## License

The code is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
