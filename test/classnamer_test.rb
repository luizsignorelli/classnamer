require "minitest/unit"
require "minitest/autorun"
require "classnamer"

class ClassnamerTest < MiniTest::Unit::TestCase
  def test_all_parts_should_be_strings
    assert Classnamer::PARTS.flatten(1).all? { |part| part.kind_of?(String) }
  end

  def test_all_parts_should_start_with_an_uppercase_letter
    assert Classnamer::PARTS.flatten(1).all? { |part| part =~ /^[A-Z]/ }
  end

  def test_classnamer_should_respond_to_generate
    assert_respond_to Classnamer, :generate
  end

  def test_generate_should_return_a_string
    assert_kind_of String, Classnamer.generate
  end

  def test_generated_name_should_be_in_correct_format
    name = Classnamer.generate
    refute_empty name, "generated name should not be empty"
    assert Classnamer::PARTS[0].any? { |part| name =~ /^#{part}/ },
      "generated name should start with an initial part"
    assert Classnamer::PARTS[1].any? { |part| name =~ /#{part}/ },
      "generated name should contain a middle part"
    assert Classnamer::PARTS[2].any? { |part| name =~ /#{part}$/ },
      "generated name should end with a final part"
  end
end
