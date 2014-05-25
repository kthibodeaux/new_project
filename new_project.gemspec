# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'new_project'

Gem::Specification.new do |spec|
  spec.name          = 'new_project'
  spec.version       = NewProject::VERSION
  spec.authors       = ["Keith Thibodeaux"]
  spec.email         = ["keith@railscoder.net"]
  spec.summary       = 'A quick and easy way to start a Ruby app'
  spec.description   = 'Creates bin/run.rb lib/project/ lib/project.rb spec/spec_helper.rb spec/project/ .gitignore Gemfile'
  spec.homepage      = 'https://github.com/kthibodeaux/new_project'
  spec.licenses      = ['MIT']

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib", "templates"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
end
