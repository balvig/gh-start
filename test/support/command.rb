def stub_shell
  Start::Command.client = Minitest::Mock.new
end

def shell
  Start::Command.client
end

def expect_read(command, return_value)
  shell.expect :read, return_value, [command]
end

def expect_run(command, options = nil)
  shell.expect :run, nil, [command, options].compact
end

def stub_github_user(name)
  expect_read "git config user.name", name
end

def stub_branch(branch)
  expect_read "git rev-parse --abbrev-ref HEAD", branch
end

def expect_checkout(branch)
  expect_run "git checkout #{branch} >/dev/null 2>&1 || git checkout -b #{branch}", title: "Checking out new branch"
end

def expect_commit(message)
  expect_run "git commit --allow-empty -m#{Shellwords.escape(message)}", title: "Creating initial commit"
end

def expect_push(branch)
  expect_run "git push origin #{branch} -u", title: "Pushing to origin"
end

def expect_error(error)
  shell.expect :error, nil, [error]
end

def expect_question(question, answer: nil,  **options)
  shell.expect :ask, answer, [question, options]
end

def expect_title(message)
  shell.expect :title, nil, [message]
end

def expect_pull_request
  expect_run "gh pr create --fill"
end

def expect_assign(repo, number)
  expect_run "gh issue edit #{number} --add-assignee \"@me\" --repo #{repo}"
end
