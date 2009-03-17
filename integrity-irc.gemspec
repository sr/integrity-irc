Gem::Specification.new do |s|
  s.name              = "integrity-irc"
  s.rubyforge_project = "integrity"
  s.version           = "0.0.6"
  s.date              = "2009-03-18"
  s.summary           = "IRC notifier for the Integrity continuous integration server"
  s.summary           = "IRC notifier for the Integrity continuous integration server"
  s.homepage          = "http://integrityapp.com"
  s.email             = "simon@rozet.name"
  s.authors           = ["Simon Rozet", "Harry Vangberg"]
  s.has_rdoc          = false
  s.files             = %w[
README.markdown
Rakefile
integrity-irc.gemspec
lib/integrity/notifier/irc.rb
test/irc_test.rb
]
  s.test_files        = %w[test/irc_test.rb]
  s.add_dependency "integrity"
  s.add_dependency "shout-bot"
end
