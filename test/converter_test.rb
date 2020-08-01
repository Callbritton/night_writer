require "minitest/autorun"
require "minitest/pride"
require "./lib/converter"
require "./lib/dictionary"
require "./test/test_helper"

class ConverterTest < Minitest::Test

  def test_it_exists
    converter = Converter.new
    assert_instance_of Converter, converter
  end

  def test_it_has_access_to_dictionary_functionality
    converter = Converter.new
    assert_equal ["0.", "..", ".."], converter.letters_to_braille["a"]
  end

  def test_it_can_convert_rows_into_columns
    converter = Converter.new
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal expected, converter.convert_to_columns("hello world")
  end

end
