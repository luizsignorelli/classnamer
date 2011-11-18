$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
gem 'minitest'
require 'minitest/unit'
require 'minitest/autorun'
require 'classnamer'

class ClassnamerTest < MiniTest::Unit::TestCase
  def test_all_parts_should_be_strings
    assert Classnamer::PARTS.flatten(1).all? { |part| part.is_a?(String) }
  end

  def test_classnamer_should_respond_to_generate
    assert_respond_to Classnamer, :generate
  end

  def test_generate_should_return_a_string
    assert_kind_of String, Classnamer.generate
  end

  def test_generated_name_should_not_be_empty
    refute_empty Classnamer.generate
  end

  def test_generated_name_should_start_with_an_initial_part
    name = Classnamer.generate
    assert Classnamer::PARTS[0].any? { |part| name =~ /^#{part}/ }
  end

  def test_generated_name_should_contain_a_middle_part
    name = Classnamer.generate
    assert Classnamer::PARTS[1].any? { |part| name =~ /#{part}/ }
  end

  def test_generated_name_should_end_with_a_final_part
    name = Classnamer.generate
    assert Classnamer::PARTS[2].any? { |part| name =~ /#{part}$/ }
  end
end
