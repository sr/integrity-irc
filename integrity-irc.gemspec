Gem::Specification.new do |s|
  s.name              = 'integrity-irc'
  s.version           = '0.0.5'
  s.date              = '2009-03-04'
  s.summary           = 'IRC notifier for the Integrity continuous integration server'
  s.summary           = 'IRC notifier for the Integrity continuous integration server'
  s.homepage          = 'http://integrityapp.com'
  s.email             = 'simon@rozet.name'
  s.authors           = ['Simon Rozet', 'Harry Vangberg']
  s.has_rdoc          = false
  s.files             = %w[README.markdown lib/notifier/irc.rb]
  s.test_files        = %w[test/irc_test.rb]
  s.add_dependency 'integrity'
  s.add_dependency 'shout-bot'
end
