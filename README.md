# gh-start

A quick workflow for starting new stories:

- Automatically generates branch name.
- Creates and checks out the new branch.
- Opens a draft pull request.
- (When given a GitHub issue) assigns user to issue.

Extracted from https://github.com/cookpad/cp8_cli to work with the
GitHub Cli.

## Usage

```bash
gh start "My new story" # checks out jb/my-new-story
gh start https://github.com/balvig/gh-start/issues/1 # checks out jb/issue-title
```

## Installation

Requires Ruby and Bundler to be installed.

```bash
gh extension install https://github.com/balvig/gh-start
```

## License

The code is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
