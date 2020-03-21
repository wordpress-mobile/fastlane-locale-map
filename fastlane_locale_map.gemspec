Gem::Specification.new do |s|
  s.name = 'fastlane_locale_map'
  s.version = '0.0.1'
  s.date = '2020-03-21'
  s.summary = 'Provides a list of locales for use in other Fastlane plugins'
  s.files = [
    'lib/fastlane_locale_map.rb'
  ]
  s.require_paths = ['lib']
  s.authors = ['jkmassel']
  s.homepage = 'https://github.com/wordpress-mobile/fastlane-locale-map'
  s.license = 'MIT'

  s.add_development_dependency 'coveralls', '~> 0.8'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'rubocop-rspec', '~> 1.38'
end
