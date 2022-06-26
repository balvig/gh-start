require "start/command"

module Start
  module Github
    class Api
      def self.find_issue_title(owner:, name:, number:)
        query = <<~GRAPHQL
        query($name: String!, $owner: String!, $number: Int!) {
          repository(name: $name, owner: $owner){
            issue(number: $number) {
              title
            }
          }
        }
        GRAPHQL

        Command.read "gh api graphql -F owner='#{owner}' -F name='#{name}' -F number=#{number} -f query='#{query}' --jq '.data.repository.issue.title'"
      end

      def self.assign_self(owner:, name:, number:)
        Command.run "gh issue edit #{number} --add-assignee \"@me\" --repo #{owner}/#{name}"
      end

      def self.create_draft_pull_request
        Command.run "gh pr create --draft --fill"
      end
    end
  end
end
