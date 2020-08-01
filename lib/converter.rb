require './lib/dictionary'
class Converter < Dictionary
  #convert array of letters into columns of braille:
  def convert_to_columns(info)
    # takes info (hello world) and splits it
    # into each character ("h", "e", "l", etc)
    by_character = info.split("")
    # this takes the given paramater and converts it
    # to the braille equivalent - resulting in multiple arrays
    arrays_of_braille = by_character.map do |each_letter|
      letters_to_braille[each_letter]
    end
    # transposes the rows and columns (change place with one another)
    transposed = arrays_of_braille.transpose
    # pulls each index back together and combines them with interpolation
    "#{transposed[0].join}\n" + "#{transposed[1].join}\n" + "#{transposed[2].join}"
  end

end
