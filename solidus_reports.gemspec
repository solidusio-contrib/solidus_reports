# frozen_string_literal: true

require_relative 'lib/solidus_reports/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_reports'
  spec.version = SolidusReports::VERSION
  spec.authors = ['Jonathan Tapia']
  spec.email = 'jonathan.tapia@magmalabs.io'

  spec.summary = 'Reports module from Solidus core'
  spec.description = 'Reports module from Solidus core'
  spec.homepage = 'http://github.com/solidusio-contrib/solidus_reports'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://github.com/solidusio-contrib/solidus_reports'
  spec.metadata['changelog_uri'] = 'https://github.com/DanielePalombo/solidus_reports/blob/master/CHANGELOG.md'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.5', '< 4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 5']
  spec.add_dependency 'solidus_support', '~> 0.5'

  spec.add_development_dependency 'solidus_dev_support', '~> 2.7'
end
