Bundler.require(:default)

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require "start/runner"

Start::Runner.new(ARGV.first).run
