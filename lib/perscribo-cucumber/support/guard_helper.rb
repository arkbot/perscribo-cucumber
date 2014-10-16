DEFAULT_CUKE_RESULTS = "#{Dir.pwd}/tmp/perscribo_cucumber.log"
DEFAULT_CUKE_CLI = [
  '--color',
  '--strict',
  "--require #{File.dirname(__FILE__)}/../cucumber/perscribo_formatter.rb",
  '--format Cucumber::Formatter::PerscriboFormatter',
  "--out #{DEFAULT_CUKE_RESULTS}"
]
DEFAULT_CUKE_OPTS = {
  all_on_start: true,
  cli: DEFAULT_CUKE_CLI.join(' '),
  bundler: true,
  feature_sets: ['test/features'],
  notification: true
}
log_output('Cucumber', "#{DEFAULT_CUKE_RESULTS}", :info, :failure, :success)
