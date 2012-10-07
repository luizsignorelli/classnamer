# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
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
  s.files = ["LICENSE.txt", "README.rdoc", "bin/classnamer", "classnamer.gemspec", "lib/classnamer.rb", "lib/classnamer/version.rb", "test/classnamer_library_test.rb"]
  s.test_files = ["test/classnamer_library_test.rb"]
  s.executables = ["classnamer"]
  s.require_paths = ["lib"]
end
