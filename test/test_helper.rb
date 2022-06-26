Bundler.require(:default, :test)

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "start/runner"
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "pry"

# Require support files
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

# Pretty colors
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
