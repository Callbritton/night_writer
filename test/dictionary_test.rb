require "minitest/autorun"
require "minitest/pride"
require "./lib/dictionary"

class ClassTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new 
    assert_instance_of Dictionary, dictionary
  end

  #def test_it_has_attributes
  #end

end
