module Start
  class BranchName
    def initialize(user:, story:)
      @user = user
      @story = story
    end

    def to_s
      "#{prefix}#{user_input}"
    end

    private

      SEPARATOR = "/"

      attr_reader :user, :story

      def user_input
        Command.ask("Branch name: #{prefix}", default: default)
      end

      def prefix
        user.initials + SEPARATOR
      end

      def default
        story.title.parameterize[0..50]
      end
  end
end
