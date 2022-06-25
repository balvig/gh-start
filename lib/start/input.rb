require "start/url"

module Start
  class Input < String
    def initialize(text)
      super text.to_s
    end

    def github_issue?
      return unless url?

      url.host == "github.com" && url.path_segments.include?("issues")
    end

    def url
      @_url ||= Url.parse(self)
    end

    private

      def url?
        !!url
      end
  end
end
