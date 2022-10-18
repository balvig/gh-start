require "forwardable"
require "uri"

module Start
  class StoryUrl
    extend Forwardable
    def_delegators :uri, :host, :to_s

    def self.parse(text)
      new(URI(text))

    rescue URI::InvalidURIError
    end

    def initialize(uri)
      @uri = uri
    end

    def path_segments
      @_path_segments ||= uri.path.split("/")
    end

    private

      attr_reader :uri
  end
end
