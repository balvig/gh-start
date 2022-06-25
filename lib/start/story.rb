module Start
  class Story
    attr_reader :title, :url

    def initialize(title:, url: nil)
      @title = title
      @url = url
    end

    def description
      raise "Implement in child"
    end

    def assign
      raise "Implement in child"
    end
  end
end
