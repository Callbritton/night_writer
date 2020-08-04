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
    # file.readlines had to be added back due to SimpleCov
    contents = File.readlines(@input_file)
    output = ""
    contents.each_slice(3) do |content|
      output << convert_into_strings(content)
    end
    File.open(@output_file, "w") do |f|
      f.write output
    end
  end
  # This takes the braille that has been reformatted
  # back into the necessary arrays to compare with the
  # dictionary (braille_to_letters) to convert the
  # braille to letters
  def convert_braille(processed_braille)
    collected_strings = []
    processed_braille.each do |braille|
      collected_strings << braille_to_letters[braille]
    end
    collected_strings = collected_strings.flatten.join

  end

  def convert_into_strings(prepared_braille)
    # number of letters divided by 2
    braille_to_letters_ratio = 2
    number_of_letters = prepared_braille.first.length / braille_to_letters_ratio
    # sets the accumulator and prepares the arrays to be split
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
  # to allocate the 2 characters of braille Per element
  # into their array
  def sliced_braille(split_braille, prepared_braille)
    prepared_braille.each do |string|
      split_braille << string[0..1]
      string.slice!(0..1)
    end
  end

  # def input_file_contents
  #   File.readlines(@input_file)
  # end
end
# structuring this this way enables me to run tests
# without having to provide ARGV as it runs a check
# that evaluates if the file is being executed directly
 if __FILE__ == $0
input_file = ARGV[0]
output_file = ARGV[1]
NightReader.new(input_file, output_file).execute_conversion_to_letters
puts "Created #{output_file} containing #{File.read(output_file).chomp.length} characters"
 end
