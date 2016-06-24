# name - the gem’s name
# authors - an Array of author(s)
# files - an Array of files included in the gem
# summary - summary of gem’s description
# version - the gem’s version
# platform - platform the gem runs on. Some gems include C code and others are pure Ruby code. This will be set automatically for us, so we don’t need to include it.
# require_paths - specifies what paths should be loaded. The default value is lib, so we don’t need to include it either. This means that all your files should be inside a lib directory for your gem to work properly.
# We can also add in other properties like:
# date
# description
# email
# homepage

Gem::Specification.new do |s|
  s.name        = 'colorizr'
  s.version     = '0.0.2'
  s.date        = '2016-06-14'
  s.summary     = "Colors for Teams!"
  s.description = "A simple gem to colorize terminal output"
  s.authors     = ["Laurie Gloge"]
  s.email       = 'laurie@friendlyroad.com'
  s.files       = ["lib/colorizr.rb"]
  s.homepage 		= 'http://udacity.com'
  s.license       = 'MIT'
  s.require_paths = ['lib']
end