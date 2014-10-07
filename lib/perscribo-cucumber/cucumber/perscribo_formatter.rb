module Cucumber
  module Formatter
    require 'perscribo'
    require 'cucumber/formatter/progress'

    class PerscriboFormatter < Progress
      def initialize(*args)
        @delayed_messages = []
        super(*args)
        @io.singleton_class.send(:prepend, ::Perscribo::IO)
        reset_label
      end

      def progress(status)
        update_label?(status)
        super
      end

      private

      def reset_label(label = :info)
        @io.label = label
      end

      def update_label?(status)
        reset_label(:failure) if status =~ /fail/
        reset_label(:success) if status =~ /pass/
      end
    end
  end
end
