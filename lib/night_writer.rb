require_relative "converter"
class NightWriter
  attr_reader :input_file,
              :output_file,
              :contents

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @sliced_contents = nil
    @converter = Converter.new
  end


  def write_braille_to_file
    # stores string converted to braille in columns to variable
    wrapped_braille = ""
    @sliced_contents.each do |content|
      wrapped_braille << @converter.convert_to_columns(content)
    end
    # opens the given file and writes the braille stored in
    # the text_to_braille variable
    File.open(@output_file, "w") do |f|
      f.write wrapped_braille
    end
  end
  # This takes text from the input_file_contents (ARGV[0])
  # and, with the processing complete from the helper methods,
  # executes the conversion and writes braille to ARGV[1]
  def execute_conversion
    contents = input_file_contents
    @sliced_contents = create_sliced_contents(contents)
    write_braille_to_file
  end
  # this will take the array held in contents and
  # seperate the array into elements dictated by the
  # size given in paramater (default 40 characters or 80 dots)
  def create_sliced_contents(contents, size = 40)
    @contents_string = contents.join.chomp.downcase
    @contents_string.chars.each_slice(size).to_a.map do |sliced|
      sliced.join
    end
  end

  def input_file_contents
    File.readlines(@input_file)
  end
end

# Had to create this due to all my tests erroring out
if __FILE__ == $0
input_file = ARGV[0]
output_file = ARGV[1]
NightWriter.new(input_file, output_file).execute_conversion
puts "Created #{output_file} containing #{File.read(input_file).chomp.length} characters"
end
