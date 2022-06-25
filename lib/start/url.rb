require "active_support/core_ext/module/delegation"
require "uri"

module Start
  class Url
    delegate :host, :to_s, to: :uri

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
