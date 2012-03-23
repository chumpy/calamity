# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','calamity_version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'calamity'
  s.version = Calamity::VERSION
  s.author = 'Kevin Beddingfield'
  s.email = 'kevin.beddingfield@gmail.com'
  s.homepage = 'http://github.com/chumpy/calamity'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A life hacking tool'
# Add your other files here if you make them
  s.files = %w(
bin/calamity
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['calamity.rdoc']
  s.rdoc_options << '--title' << 'calamity' << '--main' << '-ri'
  s.bindir = 'bin'
  s.executables << 'calamity'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_runtime_dependency('gli')
  s.add_runtime_dependency('sqlite3')
end
