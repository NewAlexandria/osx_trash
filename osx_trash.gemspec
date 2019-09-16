
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "osx_trash/version"

Gem::Specification.new do |spec|
  spec.name          = "osx_trash"
  spec.version       = OsxTrash::VERSION
  spec.authors       = ["Zachary Jones"]
  spec.email         = ["zak@newalexandria.org"]

  spec.summary       = %q{Ruby class and CLI app for moving files to the OSX Trash}
  spec.description   = %q{The OSX Trash gem will take a filepath containing paths to files that should be moved to the OSX trash.  The list can be a little noisy, with things that will go away with `strip`. When instantiatin the class, you can pass a hash of file: with the pathname, or paths: with an array. }
  spec.homepage      = "https://github.com/NewAlexandria/osx_trash"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/NewAlexandria/osx_trash"
    spec.metadata["changelog_uri"] = "https://github.com/NewAlexandria/osx_trash/commits/master"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
