require "minitest/autorun"
require "minitest/pride"
require "./lib/converter"
require "./lib/dictionary"
require "./test/test_helper"

class ClassTest < Minitest::Test

  def test_it_exists
    converter = Converter.new
    assert_instance_of Converter, converter
  end

  def test_it_has_access_to_dictionary_functionality
    converter = Converter.new
    assert_equal ["0.", "..", ".."], converter.letters_to_braille["a"]
  end

  

end
