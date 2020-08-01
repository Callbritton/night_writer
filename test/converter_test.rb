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

end
