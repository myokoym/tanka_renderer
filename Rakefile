require "bundler/gem_tasks"

desc "Run test"
task :test do
  Bundler::GemHelper.install_tasks
  system("bundle", "exec", "test/run-test.rb")
end

task :default => :test
