# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_menu/version"

Gem::Specification.new do |s|
  s.name        = "rails_menu"
  s.version     = RailsMenu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bernard Potocki"]
  s.email       = ["bernard.potocki@imanel.org"]
  s.homepage    = ""
  s.summary     = %q{Simple menu generator for Ruby on Rails}
  s.description = %q{Simple menu generator for Ruby on Rails}

  s.add_dependency 'action_pack'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
