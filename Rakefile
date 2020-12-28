task :ring
task :cucumber_test_top_250
task :run_bot => :cucumber_test_top_250


desc 'Enter home'
task :enter => :ring do
  puts "Entering home!"
end

desc 'Exit home'
task :exitw => :enter do
  puts "Exiting home!"
end

desc 'Exit home'
task :exit  do
  puts "Exiting home!"
end

desc 'Lock the door'
task :lock => :exit do
  puts "Locking the door"
end

