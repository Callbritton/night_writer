require "minitest/autorun"
require "minitest/pride"
require "./lib/converter"
require "./lib/night_writer"
require "./test/test_helper"

class ConverterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new
    assert_instance_of NightWriter, night_writer
  end

end 
