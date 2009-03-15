require "test/unit"
require "rr"
require "integrity/notifier/test"

begin
  require "redgreen"
rescue LoadError
end

require File.dirname(__FILE__) + "/../lib/integrity/notifier/irc"

class IRCTest < Test::Unit::TestCase
  include RR::Adapters::TestUnit
  include Integrity::Notifier::Test

  def setup
    setup_database
  end

  def notifier
    "IRC"
  end

  def test_configuration_form
    assert_form_have_option "uri", "irc://irc.freenode.net/test"
  end

  def test_send_notification
    config = { "uri" => "irc://foo:bar@irc.freenode.net/test" }
    stub(ShoutBot).shout("irc://foo:bar@irc.freenode.net/test") { nil }
    Integrity::Notifier::IRC.new(Integrity::Commit.gen, config).deliver!
  end

  def test_notification_full_message
    assert notification_successful.include?("successful")
    assert notification_failed.include?("failed")
  end
end
