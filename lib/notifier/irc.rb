require 'rubygems'
require 'integrity'
require 'shout-bot'

module Integrity
  class Notifier
    class IRC < Notifier::Base
      attr_reader :uri
      
      def self.to_haml
        File.read File.dirname(__FILE__) / "config.haml"
      end

      def initialize(build, config={})
        @uri = config.delete(:uri)
        super
      end

      def deliver!
        # do the ShoutBot dance here
      end
    end
  end
end
