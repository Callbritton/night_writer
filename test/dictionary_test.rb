require "minitest/autorun"
require "minitest/pride"
require "./lib/dictionary"

class ClassTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_it_can_convert_the_letter_a
    dictionary = Dictionary.new
    assert_equal ["0.", "..", ".."], dictionary.convert_to_braille["a"]
  end

end
