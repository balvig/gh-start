require "shellwords"
require "start/input"
require "start/branch_name"
require "start/command"
require "start/current_user"
require "start/adhoc_story"
require "start/github/issue"

module Start
  class Runner
    def initialize(text)
      @input = Input.new(text)
    end

    def run
      return Command.error "No title/url provided" if input.blank?

      checkout_branch
      create_empty_commit
      push_branch
      create_draft_pull_request
      story.assign
    end

    private

      attr_reader :input

      def checkout_branch
        Command.run "git checkout #{branch_name} >/dev/null 2>&1 || git checkout -b #{branch_name}", title: "Checking out new branch"
      end

      def create_empty_commit
        Command.run "git commit --allow-empty -m#{commit_message}", title: "Creating initial commit"
      end

      def push_branch
        Command.run "git push origin #{branch_name} -u", title: "Pushing to origin"
      end

      def create_draft_pull_request
        Github::Api.create_draft_pull_request
      end

      def branch_name
        @_branch_name ||= BranchName.new(user: user, story: story).to_s
      end

      def commit_message
        Shellwords.escape(
          [story.title, story.description].compact.join("\n\n")
        )
      end

      def user
        @_user ||= CurrentUser.new
      end

      def story
        @_story ||= find_story
      end

      def find_story
        if input.github_issue?
          Github::Issue.new(input.story_url)
        else
          AdhocStory.new(input)
        end
      end
  end
end
