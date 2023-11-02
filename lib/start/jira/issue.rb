require "start/story"

module Start
  module Jira
    class Issue < Story
      def initialize(story_url)
        @story_url = story_url
      end

      def title
        @_title ||= fetch_title
      end

      def description
        "Closes #{story_url}"
      end

      def start
        assign
        set_status_to_in_progress
      end

      private

        attr_reader :story_url

        def fetch_title
          issue_details = Command.read "jira issue view #{id} --plain"
          issue_details.split("\n")[2].strip.sub("# ","")
        end

        def id
          story_url.path_segments.last
        end

        def assign
          Command.run "jira issue assign #{id} $(jira me)"
        end

        def set_status_to_in_progress
          Command.run "jira issue move #{id} \"In Progress\""
        end
    end
  end
end
