# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)
require 'solidus_reports/version'

Gem::Specification.new do |s|
  s.name = 'solidus_reports'
  s.version = SolidusReports::VERSION
  s.summary = 'Reports module from Solidus core'
  s.description = s.summary
  s.license = 'BSD-3-Clause'

  s.author = 'Jonathan Tapia'
  s.email = 'jonathan.tapia@magmalabs.io'
  s.homepage = 'http://github.com/solidusio-contrib/solidus_reports'

  if s.respond_to?(:metadata)
    s.metadata['homepage_uri'] = s.homepage
    s.metadata['source_code_uri'] = s.homepage
  end

  s.required_ruby_version = '>= 2.5'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  s.files = files.grep_v(%r{^(test|spec|features)/})
  s.test_files = files.grep(%r{^(test|spec|features)/})
  s.bindir = 'exe'
  s.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'solidus_core', ['>= 2.0.0', '< 5']
  s.add_dependency 'solidus_support', '~> 0.8'

  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'solidus_dev_support', '~> 2.7'
end
