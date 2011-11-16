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

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
