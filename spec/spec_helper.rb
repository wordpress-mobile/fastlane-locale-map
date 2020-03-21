require 'coveralls'
Coveralls.wear!
require 'fastlane_locale_map'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
