require "start/story_url"

module Start
  class Input < String
    def initialize(text)
      super text.to_s
    end

    def github_issue?
      return false unless story_url?

      story_url.host == "github.com" && story_url.path_segments.include?("issues")
    end

    def jira_issue?
      return false unless story_url?

      story_url.host.include?("atlassian.net")
    end

    def story_url
      @_story_url ||= StoryUrl.parse(self)
    end

    private

      def story_url?
        !!story_url
      end
  end
end
