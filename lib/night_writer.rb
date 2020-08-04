require "./lib/dictionary"
class NightWriter
  include Dictionary
  attr_reader :input_file,
              :output_file,
              :contents

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @sliced_contents = nil
  end

  def execute_conversion_to_braille
    contents = input_file_contents
    @sliced_contents = create_sliced_contents(contents)
    write_braille_to_file
  end

  def convert_to_columns(input)
    by_character = input.split("")
    arrays_of_braille = by_character.map do |each_letter|
      letters_to_braille[each_letter]
    end
    transposed = arrays_of_braille.transpose
    "#{transposed[0].join}\n" + "#{transposed[1].join}\n" + "#{transposed[2].join}\n"
  end

  def write_braille_to_file
    wrapped_braille = ""
    @sliced_contents.each do |content|
      wrapped_braille << convert_to_columns(content)
    end
    File.open(@output_file, "w") do |f|
      f.write wrapped_braille
    end
  end

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

if __FILE__ == $0
input_file = ARGV[0]
output_file = ARGV[1]
NightWriter.new(input_file, output_file).execute_conversion_to_braille
puts "Created #{output_file} containing #{File.read(output_file).chomp.length} characters"
end
