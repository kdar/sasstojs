require './lib/sasstojs'

Gem::Specification.new do |s|
  s.version = Sasstojs::VERSION
  s.date = Sasstojs::DATE

  s.name = "sasstojs"
  s.rubyforge_project = "sasstojs"
  s.description = %q{Provides a way to output settings to a javascript file from SASS}
  s.summary = %q{Allows your javascript to access settings defined in your SASS files.}
  s.authors = ["Kevin Darlington"]
  s.email = ["kevin@outroot.com"]
  s.homepage = "http://outroot.com"

  # Gem Files
  # These are the files to be included in your Compass extension.
  # Uncomment those that you use.

  # README file
  # s.files = ["README.md"]

  # CHANGELOG
  # s.files += ["CHANGELOG.md"]

  # Library Files
  s.files += Dir.glob("lib/**/*.*")

  # Sass Files
  # s.files += Dir.glob("stylesheets/**/*.*")

  # Template Files
  # s.files += Dir.glob("templates/**/*.*")

  # Gem Bookkeeping
  # Versions of Ruby and Rubygems you require
  s.required_rubygems_version = ">= 1.3.6"
  s.rubygems_version = %q{1.3.6}

  # Gems Dependencies
  # Gem names and versions that are required for your Compass extension.
  # These are Gem dependencies, not Compass dependencies. Including gems
  #  here will make sure the relevant gem and version are installed on the
  #  user's system when installing your gem.
  s.add_dependency("sass",      [">= 3.3.0.rc.2"])
  s.add_dependency("compass",   [">= 1.0.0.alpha.17"])
end
