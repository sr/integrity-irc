require 'rubygems'
require 'integrity' unless defined?(Integrity)
require 'shout-bot'

module Integrity
  class Notifier
    class IRC < Notifier::Base
      attr_reader :uri
      
      def self.to_haml
        <<-HAML
%p.normal
  %label{ :for => 'irc_notifier_uri' } Send to
  %input.text#irc_notifier_uri{ :name => 'notifiers[IRC][uri]', :type => 'text', :value => config['uri'] || 'irc://IntegrityBot@irc.freenode.net:6667/#test' }
        HAML
      end

      def initialize(build, config={})
        @uri = config.delete("uri")
        super
      end

      def deliver!
        ShoutBot.shout(uri) do |channel|
          channel.say "#{build.project.name}: #{short_message}"
          channel.say commit_url
        end
      end
    end
  end
end
