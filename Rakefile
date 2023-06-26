require 'minitest/test_task'

Minitest::TestTask.create(:test) do |t|
  t.libs << 'test'
  t.test_globs << './test/tests.rb'
end

task :default => :test