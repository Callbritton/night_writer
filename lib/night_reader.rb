require "./lib/dictionary"
class NightReader
  include Dictionary
  attr_reader :input_file,
              :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end
  # this is my "runner method" this method
  # stores information from input file in contents
  # then ensures that the info is no longer than 3 lines long
  # and then writes it.
  def execute_conversion_to_letters
    contents = input_file_contents
    output = ""
    contents.each_slice(3) do |content|
      output << convert_into_letters(content)
    end
    File.open(@output_file, "w") do |f|
      f.write output
    end
  end

  def convert_braille(processed_braille)
    collected_strings = []
    processed_braille.each do |braille|
      collected_strings << braille_to_letters[braille]
    end
    collected_strings = collected_strings.flatten.join
  end

  def convert_into_letters(prepared_braille)
    # number of letters divided by
    braille_to_letters_ratio = 2
    number_of_letters = prepared_braille.first.length / braille_to_letters_ratio
    split_braille = []
    number_of_letters.times do
      sliced_braille(split_braille, prepared_braille)
    end
    # this splits the input array into multiple
    # arrays of 3 # elements
    processed_braille = split_braille.each_slice(3).to_a
    # this converts the multiple arrays into letters!
    convert_braille(processed_braille)
  end
  # pulls off the first 2 characters of each line
  def sliced_braille(split_braille, prepared_braille)
    prepared_braille.each do |string|
      split_braille << string[0..1]
      string.slice!(0..1)
    end
  end

  def input_file_contents
    File.readlines(@input_file)
  end
end

if __FILE__ == $0
input_file = ARGV[0]
output_file = ARGV[1]
NightReader.new(input_file, output_file).execute_conversion_to_letters
puts "Created #{output_file} containing #{File.read(input_file).chomp.length} characters"
end
