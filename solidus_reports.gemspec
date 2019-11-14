# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
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

  s.add_dependency 'solidus_auth_devise', ['>= 1.0', '< 3']
  s.add_dependency 'solidus_core', ['>= 2.5', '< 3']
  s.add_dependency 'solidus_support'

  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'solidus_extension_dev_tools'
end
