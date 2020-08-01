require "minitest/autorun"
require "minitest/pride"

require "./test/test_helper"

class ClassTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_it_can_convert_letters_to_braille
    dictionary = Dictionary.new
    assert_equal ["0.", "..", ".."], dictionary.letters_to_braille["a"]
  end

  def test_if_it_can_be_inverted_to_convert_braille_to_letters
    dictionary = Dictionary.new
    braille = ["0.", "..", ".."]
    assert_equal "a", dictionary.braille_to_letters[braille]
  end

  def test_it_can_convert_another_letter
    dictionary = Dictionary.new
    assert_equal [".0", "0.", "0."], dictionary.letters_to_braille["s"]
  end

  def test_it_can_convert_rows_into_columns
    dictionary = Dictionary.new

    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."

    assert_equal expected, dictionary.convert_to_columns("hello world")
  end

end
