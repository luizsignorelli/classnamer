# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "classnamer/version"

Gem::Specification.new do |s|
  s.name        = "classnamer"
  s.version     = Classnamer::VERSION
  s.authors     = ["Aaron Beckerman"]
  s.email       = ["aaron@aaronbeckerman.com"]
  s.homepage    = "https://github.com/ab9/classnamer"
  s.summary     = %q{Randomly generates object-oriented class names}
  s.description = %q{This gem randomly generates tongue-in-cheek class names suitable for enterprise-friendly object-oriented programming languages like C++ and Java.}

  s.rubyforge_project = "classnamer"

  s.files         = ["Gemfile", "LICENSE", "README", "Rakefile", "bin/classnamer", "classnamer.gemspec", "lib/classnamer.rb", "lib/classnamer/version.rb", "test/classnamer_test.rb", "test/test_helper.rb"]
  s.test_files    = ["test/classnamer_test.rb", "test/test_helper.rb"]
  s.executables   = ["classnamer"]
  s.require_paths = ["lib"]
  s.add_development_dependency "bundler", "1.0.21"
  s.add_development_dependency "rake", "0.9.2.2"
  s.add_development_dependency "minitest", "2.10.0"
end
