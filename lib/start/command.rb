require "colored"
require "forwardable"
require "highline"
require "tty-prompt"

module Start
  class Command
    class << self
      attr_accessor :client
      extend Forwardable
      def_delegators :client, :say, :success, :ask, :title, :error, :run, :read
    end

    self.client = new

    def title(message)
      highline.say(message.bold)
    end

    def say(*args)
      highline.say(*args)
    end

    def success(message)
      highline.say(message.green.bold)
    end

    def ask(question, default: nil)
      tty.ask(question, required: true, default: default)
    end

    def error(message)
      say(message.red.bold)
      exit(false)
    end

    def run(command, title: nil)
      title(title) if title
      say(command)
      system(command) || error("Error running: #{command}")
    end

    def read(command)
      `#{command}`.strip.presence
    end

    private

      def highline
        @_highline ||= HighLine.new
      end

      def tty
        @_tty ||= TTY::Prompt.new
      end
  end
end

