require "rubygems"
require "integrity"
require Integrity.root / "spec" / "spec_helper"

require File.dirname(__FILE__) / ".." / "lib" / "notifier" / "irc"

describe Integrity::Notifier::IRC do
  include AppSpecHelper
  include NotifierSpecHelper
  
  it_should_behave_like "A notifier"

  def klass
    Integrity::Notifier::IRC
  end

  describe "notifying the world of a build" do
    before { klass.stub!(:new).and_return(notifier) }
    
    it "should instantiate a notifier with the given build and config" do
      klass.should_receive(:new).with(mock_build, {}).and_return(notifier)
      klass.notify_of_build(mock_build, notifier_config)
    end
  
    it "should pass the notifier options to the notifier" do
      klass.should_receive(:new).with(anything, notifier_config).and_return(notifier)
      klass.notify_of_build(mock_build, notifier_config)
    end
    
    it "should deliver the notification" do
      notifier.should_receive(:deliver!)
      klass.notify_of_build(mock_build, notifier_config)
    end
  end
  
  describe "generating a form for configuration" do
    describe "with a field for the IRC URI" do
      it "should have the proper name, id and label and a default value" do
        the_form.should have_textfield("irc_notifier_uri").
          named("notifiers[IRC][uri]").
          with_label("Send to").
          with_value("irc://irc.freenode.net:6667/integrity")
      end
      
      it "should use the config's 'uri' value if available" do
        the_form(:config => { "uri" => "irc://irc.freenode.net/integrity" }).
          should have_textfield("irc_notifier_uri").with_value("irc://irc.freenode.net/integrity")
      end
    end
  end
end
