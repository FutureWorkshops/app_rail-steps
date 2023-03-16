# frozen_string_literal: true

require_relative "lib/app_rail/steps/version"

Gem::Specification.new do |spec|
  spec.name = "app_rail-steps"
  spec.version = AppRail::Steps::VERSION
  spec.authors = ["Matt Brooke-Smith"]
  spec.email = ["matt@futureworkshops.com"]

  spec.summary = "Utilities to generate JSON for expected step responses."
  spec.homepage = "https://github.com/FutureWorkshops/app_rail-steps"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/FutureWorkshops/app_rail-steps"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
