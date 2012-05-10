# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "classnamer/version"

Gem::Specification.new do |s|
  s.name = "classnamer"
  s.version = Classnamer::VERSION
  s.authors = ["Aaron Beckerman"]
  s.email = ["aaron@aaronbeckerman.com"]
  s.homepage = "https://github.com/ab9/classnamer"
  s.summary = %q{A random class name generator.}
  s.description = %q{Classnamer randomly generates tongue-in-cheek class names suitable for enterprise-friendly object-oriented programming languages like C++ and Java. It includes a library and a command-line program.}
  s.license = "MIT"
  s.required_ruby_version = ">= 1.8.7"
  s.bindir = "bin"
  s.files = ["Gemfile", "LICENSE", "README.rdoc", "Rakefile", "bin/classnamer", "classnamer.gemspec", "lib/classnamer.rb", "lib/classnamer/version.rb", "test/classnamer_library_test.rb", "test/test_helper.rb"]
  s.test_files = ["test/classnamer_library_test.rb", "test/test_helper.rb"]
  s.executables = ["classnamer"]
  s.require_paths = ["lib"]
  s.add_development_dependency("rake", "0.9.2.2")
  s.add_development_dependency("minitest", "3.0.0")
end
