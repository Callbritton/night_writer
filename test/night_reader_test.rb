require "./test/test_helper"
class ConverterTest < Minitest::Test

  def test_it_exists
    night_reader = NightReader.new("would_be_input", "would_be_output")
    assert_instance_of NightReader, night_reader
  end

  def test_it_can_convert_into_letters
    night_reader = NightReader.new("would_be_input", "would_be_output")
    assert_equal "here is another really long string ", night_reader.convert_into_strings([
      "0.0.0.0....0.0..0.000..00.0.0...0.0.0.0.0.00..0.0.0000...0.00..00000..\n",
      "00.000.0..0.0......0.00000.000..00.0..0.0..0..0..0.000..0.00000..000..\n",
      "....0.......0.....0.0.0.....0...0.....0.0.00..0.0.0.....0.0.0...0.....\n"
    ])
  end

  def test_it_can_split_into_more_letters
    night_reader = NightReader.new("would_be_input", "would_be_output")
    assert_equal " testing and then some", night_reader.convert_into_strings([
      "...00..0.0.00000..0.0000...00.0.00...00.000.\n",
      "..00.00.000..000.....0.0..0000.0.0..0..0...0\n",
      "..0...0.0...0.......0.....0.....0...0.0.0...\n"
    ])
  end

  def test_it_can_slice_braille
    night_reader = NightReader.new("would_be_input", "would_be_output")
    assert_equal ["00.."], night_reader.sliced_braille("", ["0.00.."])
  end

  def test_it_can_convert_braille
    night_reader = NightReader.new("would_be_input", "would_be_output")
    assert_equal "h", night_reader.convert_braille([["0.", "00", ".."]])
  end

  def test_it_can_convert_braille_into_letters
    night_reader = NightReader.new("would_be_input", "would_be_output")
    assert_equal "hey hey", night_reader.convert_into_strings(["0.00..0..0..00.000......0.00..0..0..00.000"])
  end
end
