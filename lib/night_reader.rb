require "./lib/dictionary"
class NightReader
  include Dictionary
  attr_reader :input_file,
              :output_file

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  
  def convert_braille(processed_braille)
    collected_strings = []
    processed_braille.each do |braille_char|
      collected_strings << braille_to_letters[braille_char]
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
end
