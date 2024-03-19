require "start/story"
require "start/github/api"

module Start
  module Github
    class Issue < Story
      def initialize(story_url)
        @story_url = story_url
      end

      def title
        @_title ||= Github::Api.find_issue_title(owner: owner, name: name, number: number)
      end

      def description
        "Closes #{story_url}"
      end

      def start
        Github::Api.assign_self(owner: owner, name: name, number: number)
      end

      private

        attr_reader :story_url

        def owner
          story_url.path_segments[1]
        end

        def name
          story_url.path_segments[2]
        end

        def number
          story_url.path_segments.last
        end
    end
  end
end
