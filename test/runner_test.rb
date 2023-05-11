require "test_helper"

module Start
  class RunnerTest < Minitest::Test
    def setup
      stub_shell
    end

    def test_start_adhoc_story
      stub_github_user("John Bobson")
      expect_question("Branch name: jb/", default: "story-title", answer: "story-title")
      expect_checkout("jb/story-title")
      expect_commit("Story title")
      expect_push("jb/story-title")
      expect_pull_request
      expect_title(/Created PR/)

      start "Story title"

      shell.verify
    end

    def test_start_with_blank_name
      expect_error("No title/url provided")

      start nil
    end

    def test_start_github_issue
      stub_github_user("John Bobson")
      expect_read(/gh api graphql -F owner='balvig' -F name='gh-start' -F number=1/, 'ISSUE TITLE')
      expect_question("Branch name: jb/", default: "issue-title", answer: "issue-title")
      expect_checkout("jb/issue-title")
      expect_commit("ISSUE TITLE\n\nCloses https://github.com/balvig/gh-start/issues/1")
      expect_push("jb/issue-title")
      expect_assign('balvig/gh-start', 1)
      expect_pull_request
      expect_title(/Created PR/)

      start "https://github.com/balvig/gh-start/issues/1"

      shell.verify
    end

    private

      def start(input)
        Start::Runner.new(input).run
      end
  end
end
