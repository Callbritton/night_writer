require "./test/test_helper"
class ConverterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")
    assert_instance_of NightWriter, night_writer
  end

  # def test_it_can_write_braille_to_file
  #   File.expects(:readlines).with("message.txt").returns("a")
  #   night_writer = NightWriter.new("message.txt", "braille.txt")
  #   # night_writer.execute_conversion
  #   expected = "0.\n..\n.."
  #
  #   assert_equal expected, File.read("braille.txt")
  # end
  def test_it_has_access_to_braille_dictionary
    night_writer = NightWriter.new("would_be_input", "would_be_output")
    assert_equal ["0.", "..", ".."], night_writer.letters_to_braille["a"]
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
