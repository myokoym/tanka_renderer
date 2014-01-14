# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fontpix/version'

Gem::Specification.new do |spec|
  spec.name          = "fontpix"
  spec.version       = Fontpix::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.summary       = %q{Font drawing tool}
  spec.description   = %q{A drawing tool for fonts.}
  spec.homepage      = "https://github.com/myokoym/fontpix"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("cairo")
  spec.add_runtime_dependency("pango")
  spec.add_runtime_dependency("fontdock", ">= 0.0.2")

  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("test-unit-notify")
  spec.add_development_dependency("test-unit-rr")
  spec.add_development_dependency("bundler", "~> 1.5")
  spec.add_development_dependency("rake")
end
