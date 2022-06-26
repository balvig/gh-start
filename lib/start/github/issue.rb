require "start/story"
require "start/github/api"

module Start
  module Github
    class Issue < Story
      def initialize(url)
        @url = url
      end

      def title
        @_title ||= Github::Api.find_issue_title(owner: owner, name: name, number: number)
      end

      def description
        "Closes #{url}"
      end

      def assign
        Github::Api.assign_self(owner: owner, name: name, number: number)
      end

      private

        attr_reader :url

        def owner
          url.path_segments[1]
        end

        def name
          url.path_segments[2]
        end

        def number
          url.path_segments.last
        end
    end
  end
end
