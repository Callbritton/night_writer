class Dictionary

  def letters_to_braille
    {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", ".0"],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."]
    }
  end

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

  def braille_to_letters
    letters_to_braille.invert
  end
end
