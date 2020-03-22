require 'coveralls'
Coveralls.wear!
require 'fastlane_locale_map'
require 'LocaleProvider'
require 'helpers/LocaleProviders'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
