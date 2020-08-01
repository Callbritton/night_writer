require_relative "converter"
class NightWriter
  attr_reader :input_file,
              :output_file,
              :contents

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end


  def write_braille_to_file
    converter = Converter.new
    # stores string converted to braille in columns to variable
    text_to_braille = converter.convert_to_columns(@contents_string)
    # assigns file variable to ARGV[1] OR "braille.txt"
    file = ARGV[1]
    # opens the given file and writes the braille stored in
    # the text_to_braille variable
    File.open(file, "w") do |f|
      f.write text_to_braille
    end
  end

  def execute_conversion
    # sets file variable to ARGV[0]
    file = ARGV[0]
    # reads the given file and stores text in contents
    contents = File.readlines(file)
    # removes from array, removes \n, and ensures downcased
    @contents_string = contents.join.chomp.downcase
    write_braille_to_file
  end
end

# Had to create this due to all my tests erroring out
if __FILE__ == $0
input_file = ARGV[0]
output_file = ARGV[1]
NightWriter.new(input_file, output_file).execute_conversion
puts "Created #{output_file} containing #{File.read(output_file).chomp.length} characters"
end
