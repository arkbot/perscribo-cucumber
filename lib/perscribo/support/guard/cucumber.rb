require 'perscribo/guard'

module Perscribo
  module Support
    module Guard
      module Cucumber
        REQ_PATH = File.expand_path('/../../cucumber/formatter.rb', __FILE__)
        OUT_PATH = "#{Dir.pwd}/tmp/perscribo_cucumber_#{ENV['RACK_ENV']}.log"
        DEFAULTS = {
          labels: [:info, :failure, :success],
          guard_opts: {
            all_on_start: true,
            cli: [
              '--color',
              '--strict',
              "--require #{REQ_PATH}",
              '--format Perscribo::Cucumber::Formatter',
              "--out #{OUT_PATH}"
            ].join(' '),
            bundler: true,
            feature_sets: ['test/features'],
            notification: true
          },
          path: OUT_PATH,
          watcher_opts: { }
        }

        ::Perscribo::Guard.capture!(self)
      end
    end
  end
end
