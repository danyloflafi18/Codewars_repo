desc 'Ring the bell'
task :ring do
  puts "Bell is ringing."
end

desc 'Enter home'
task :enter => :ring do
  puts "Entering home!"
end

desc 'Exit home'
task :exit  do
  puts "Exiting home!"
end

desc 'Lock the door'
task :lock => :exit do
  puts "Locking the door"
end

