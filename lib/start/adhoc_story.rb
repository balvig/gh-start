require "start/story"

module Start
  class AdhocStory < Story
    def initialize(title)
      @title = title
    end

    def title
      @title
    end

    def description
      # noop
    end

    def assign
      # noop
    end
  end
end
