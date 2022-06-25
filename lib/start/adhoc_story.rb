require "start/story"

module Start
  class AdhocStory < Story
    attr_reader :title

    def description
      # noop
    end

    private

      def assign
        # noop
      end
  end
end
