require "./test/test_helper"

class ConverterTest < Minitest::Test

  def test_it_exists
    converter = Converter.new
    assert_instance_of Converter, converter
  end

  def test_it_has_access_to_braille_dictionary
    converter = Converter.new
    assert_equal ["0.", "..", ".."], converter.letters_to_braille["a"]
  end

  def test_it_can_convert_a_row_of_braille_arrays_into_columns
    converter = Converter.new
    expected = "0.\n..\n..\n"
    assert_equal expected, converter.convert_to_columns("a")
  end

  def test_it_can_convert_multiple_rows_into_columns
    converter = Converter.new
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal expected, converter.convert_to_columns("hello world")
  end

  def test_it_has_access_to_letters_dictionary
    converter = Converter.new
    braille = ["0.", "..", ".."]
    assert_equal "a", converter.braille_to_letters[braille]
  end
end
