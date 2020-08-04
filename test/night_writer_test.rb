require "./test/test_helper"
class ConverterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")
    assert_instance_of NightWriter, night_writer
  end

  def test_it_has_access_to_braille_dictionary
    night_writer = NightWriter.new("would_be_input", "would_be_output")
    assert_equal ["0.", "..", ".."], night_writer.letters_to_braille["a"]
  end

  def test_it_can_convert_a_row_of_braille_arrays_into_columns
    night_writer = NightWriter.new("would_be_input", "would_be_output")
    expected = "0.\n..\n..\n"
    assert_equal expected, night_writer.convert_to_columns("a")
  end

  def test_it_can_convert_multiple_rows_into_columns
    night_writer = NightWriter.new("would_be_input", "would_be_output")
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal expected, night_writer.convert_to_columns("hello world")
  end

  def test_it_can_create_sliced_contents
    night_writer = NightWriter.new("would_be_input", "would_be_output")
    contents = ["aeiou"]
    assert_equal %w(a e i o u), night_writer.create_sliced_contents(contents, 1)
  end

  def test_input_file_contents
    File.expects(:readlines).with("message.txt").returns("Testing mocks")
    night_writer = NightWriter.new("message.txt", "braille.txt")
    assert_equal "Testing mocks", night_writer.input_file_contents
  end
end
