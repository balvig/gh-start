require "test_helper"

module Start
  class BranchNameTest < Minitest::Test
    def setup
      stub_shell
    end

    def test_to_s
      stub_github_user("Doug Adams")
      user = CurrentUser.new
      story = Minitest::Mock.new
      story.expect :title, "Fix Bug"

      expect_question "Branch name: da/", default: "fix-bug"

      assert "da/fix-bug", BranchName.new(user: user, story: story).to_s
    end
  end
end
