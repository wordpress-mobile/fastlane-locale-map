require 'coveralls'
Coveralls.wear!
require 'locale_map'
require 'locale_provider'
require 'helpers/LocaleProviders'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
  config.filter_run_when_matching :focus
end
