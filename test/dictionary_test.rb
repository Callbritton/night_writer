require "./test/test_helper"

class DictionaryTest < Minitest::Test

  def setup
    @test_obj = Object.new
    @test_obj.extend(Dictionary)
  end

  def test_it_exists

    assert_instance_of Object, @test_obj
  end

  def test_it_can_convert_letters_to_braille

    assert_equal ["0.", "..", ".."], @test_obj.letters_to_braille["a"]
  end

  def test_if_it_can_be_inverted_to_convert_braille_to_letters
    braille = ["0.", "..", ".."]
    assert_equal "a", @test_obj.braille_to_letters[braille]
  end

  def test_it_can_convert_another_letter
    assert_equal [".0", "0.", "0."], @test_obj.letters_to_braille["s"]
  end

  def test_it_can_convert_empty_space
    assert_equal ["..", "..", ".."], @test_obj.letters_to_braille[" "]
  end
end
