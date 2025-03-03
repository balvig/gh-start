module Start
  class CurrentUser
    def initials
      Command.error("Please configure your git user.name using git config user.name Jane Doe") unless git_user_name

      git_user_name.parameterize(separator: " ").split.map(&:first).join.downcase
    end

    private

      def git_user_name
        @_git_user_name ||= Command.read("git config user.name")
      end
  end
end
