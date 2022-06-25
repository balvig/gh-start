require "json"
require "start/story"
require "start/github/api"

module Start
  module Github
    class Issue < Story
      def self.build_from_url(url)
        owner = url.path_segments[1]
        name = url.path_segments[2]
        number = url.path_segments.last
        title = Github::Api.find_issue_title(owner: owner, name: name, number: number)

        new(title: title, url: url)
      end

      def description
        "Closes #{url}"
      end

      private

        def assign
          # client.add_assignees repo, number, [user.github_login]
        end
    end
  end
end
