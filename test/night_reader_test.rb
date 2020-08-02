require "./test/test_helper"
class ConverterTest < Minitest::Test

  def test_it_exists
    night_reader = NightReader.new("would_be_input", "would_be_output")
    assert_instance_of NightReader, night_reader
  end

end
