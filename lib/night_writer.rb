input_file = ARGV[0]
output_file = ARGV[1]
contents = File.read(input_file)

File.open(output_file, "w") do |f|
  f.write contents
end

puts "Created #{output_file} containing #{File.read(output_file).chomp.length} characters"
#ruby night_writer.rb test.txt (ARGV[0]) log.txt(ARGV[1])
#text typed in test.txt will be written into log.txt

# Working base file to wrap up Iteration 1. This now needs to be refactored into
# functional class with tests, etc. 
