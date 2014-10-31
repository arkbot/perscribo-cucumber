require 'perscribo/support/core/io'

require 'cucumber/formatter/progress'

module Perscribo
  module Cucumber
    class Formatter < ::Cucumber::Formatter::Progress
      def initialize(*args)
        @delayed_messages = []
        super(*args)
        @io = Support::Core::IO.hook!(@io, :info)
      end

      def progress(status)
        update_level?(status)
        super
      end

      private

      def reset_level(level = :info)
        @io.level = level
      end

      def update_level?(status)
        reset_level(:failure) if status =~ /fail/
        reset_level(:success) if status =~ /pass/
      end
    end
  end
end
