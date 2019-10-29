# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_reports/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_reports'
  s.version     = SolidusReports::VERSION
  s.summary     = 'Reports module from Solidus core'
  s.description = s.summary
  s.license     = 'BSD-3-Clause'

  s.author    = 'Jonathan Tapia'
  s.email     = 'jonathan.tapia@magmalabs.io'
  s.homepage  = 'http://github.com/jtapia/solidus_reports'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', ['>= 2.5', '< 3']
  s.add_dependency 'solidus_auth_devise', ['>= 1.0', '< 3']
  s.add_dependency 'solidus_support'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'rspec-rails', '~> 4.0.0.beta2'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'rubocop', '0.76.0'
  s.add_development_dependency 'rubocop-rspec', '1.16.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
