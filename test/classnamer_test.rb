require File.expand_path("test_helper", File.dirname(__FILE__))

class ClassnamerTest < MiniTest::Unit::TestCase
  def test_all_parts_should_be_strings
    assert Classnamer::PARTS.flatten(1).all? { |part| part.is_a?(String) }, 'all parts should be strings'
  end

  def test_classnamer_should_respond_to_generate
    assert_respond_to Classnamer, :generate, 'Classnamer should respond to :generate'
  end

  def test_generate_should_return_a_string
    assert Classnamer.generate.is_a?(String), 'Classnamer.generate should return a string'
  end

  def test_generated_name_should_not_be_empty
    refute_empty Classnamer.generate, 'generated name should not be empty'
  end

  def test_generated_name_should_start_with_an_initial_part
    name = Classnamer.generate
    assert Classnamer::PARTS[0].any? { |part| name =~ /^#{part}/ }, 'generated name should start with an initial part'
  end

  def test_generated_name_should_contain_a_middle_part
    name = Classnamer.generate
    assert Classnamer::PARTS[1].any? { |part| name =~ /#{part}/ }, 'generated name should contain a middle part'
  end

  def test_generated_name_should_end_with_a_final_part
    name = Classnamer.generate
    assert Classnamer::PARTS[2].any? { |part| name =~ /#{part}$/ }, 'generated name should end with a final part'
  end
end
