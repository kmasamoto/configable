require 'bundler'
Bundler::GemHelper.install_tasks

require "rspec/core/rake_task"

spec_prereq = "spec:setup"

desc "rake spec"
task :default => [:spec]

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec => spec_prereq) do |t|
  t.pattern = "spec/*_spec.rb"
end

namespace :spec do
  desc "Run all specs in spec directory with documentation format."
  RSpec::Core::RakeTask.new(:show => spec_prereq) do |t|
    t.rspec_opts = ["--color --format documentation --backtrace"]
    t.pattern = "./spec/**/*_spec.rb"
  end

  task :setup do
    require "./spec/spec_helper" if File.exist?("./spec/spec_helper")
  end
end