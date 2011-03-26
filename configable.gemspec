# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "configable/version"

Gem::Specification.new do |s|
  s.name        = "configable"
  s.version     = Configable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["kmasamoto"]
  s.email       = ["masamoto@104.net"]
  s.homepage    = ""
  s.summary     = %q{add easy config file access to your class}
  s.description = %q{add easy config file access to your class}

  s.rubyforge_project = "configable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
