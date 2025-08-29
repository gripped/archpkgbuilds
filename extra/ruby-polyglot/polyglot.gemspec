# frozen_string_literal: true

require './lib/polyglot/version'

Gem::Specification.new do |s|
  s.name = "polyglot"
  s.version = Polyglot::VERSION::STRING
  s.require_paths = ["lib"]
  s.authors = ["Clifford Heath"]
  s.description = "The Polyglot library allows a Ruby module to register a loader\nfor the file type associated with a filename extension, and it\naugments 'require' to find and load matching files."
  s.email = ["clifford.heath@gmail.com"]
  s.extra_rdoc_files = [
    "README.txt"
  ]
  s.files =  Dir['lib/**/*'] + [
    "History.txt",
    "License.txt",
    "README.txt",
    "Rakefile"
  ]
  s.homepage = "http://github.com/cjheath/polyglot"
  s.licenses = ["MIT"]
  s.summary = "Augment 'require' to load non-Ruby file types"
end

