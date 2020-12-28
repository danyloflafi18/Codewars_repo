require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber_test_top_250) do |o|
  o.profile = 'top_250_cucumber'
end