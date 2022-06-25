def stub_shell
  Start::Command.client = Minitest::Mock.new
end

def shell
  Start::Command.client
end

def stub_github_user(name)
  shell.expect :read, name, ["git config user.name"]
end

def stub_branch(branch)
  shell.expect :read, branch, ["git rev-parse --abbrev-ref HEAD"]
end

def expect_read(command, return_value)
  shell.expect :read, return_value, [command]
end

def expect_checkout(branch)
  shell.expect :run, nil, ["git checkout #{branch} >/dev/null 2>&1 || git checkout -b #{branch}", { title: "Checking out new branch" }]
end

def expect_commit(message)
  expected_command = "git commit --allow-empty -m#{Shellwords.escape(message)}"
  shell.expect :run, nil, [expected_command, { title: "Creating initial commit" }]
end

def expect_push(branch)
  shell.expect :run, nil, ["git push origin #{branch} -u", { title: "Pushing to origin" }]
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
  shell.expect :run, nil, ["gh pr create --draft --fill"]
end
