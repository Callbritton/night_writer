input_file = ARGV[0]
output_file = ARGV[1]
contents = File.read(input_file)
# now just convert to brail.
File.open(output_file, "w") do |f|
  f.write contents
end

#ruby night_writer.rb test.txt (ARGV[0]) log.txt(ARGV[1])
#text typed in test.txt will be written into log.txt
