Gem::Specification.new do |s|
  s.name              = 'integrity-irc'
  s.version           = '0.0.3'
  s.date              = '2009-03-03'
  s.summary           = 'IRC notifier for the Integrity continuous integration server'
  s.summary           = 'IRC notifier for the Integrity continuous integration server'
  s.homepage          = 'http://integrityapp.com'
  s.email             = 'simon@rozet.name'
  s.authors           = ['Simon Rozet']
  s.has_rdoc          = false
  s.files             = %w[README.markdown lib/notifier/config.haml lib/notifier/irc.rb]
  s.test_files        = %w[spec/irc_spec.rb]
  s.add_dependency 'foca-integrity'
  s.add_dependency 'ichverstehe-shout-bot'
end
