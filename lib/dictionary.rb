class Dictionary

  def convert_to_braille
    {
      "a" => ["0.", "..", ".."]
    }
  end

  def convert_to_english
    convert_to_braille.invert
  end

end
