require "minitest/autorun"
require "minitest/pride"
require "./lib/converter"
require "./lib/night_writer"
require "./test/test_helper"

class ConverterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new("message.txt", "braille.txt")
    assert_instance_of NightWriter, night_writer
  end

  def test_it_can_write_braille_to_file
    File.write("message.txt", "a")
    night_writer = NightWriter.new("message.txt", "braille.txt")
    night_writer.execute_conversion
    expected = "0.\n..\n.."

    assert_equal expected, File.read("braille.txt")
  end

end
