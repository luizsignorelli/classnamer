require File.expand_path("test_helper", File.dirname(__FILE__))

class ClassnamerTest < Test::Unit::TestCase
  def test_classnamer_should_respond_to_generate
    assert_respond_to Classnamer, :generate, 'Classnamer should respond to :generate'
  end

  def test_generate_should_not_raise
    assert_nothing_raised('Classnamer.generate should not raise anything') do
      Classnamer.generate
    end
  end

  def test_generate_should_not_throw
    assert_nothing_thrown('Classnamer.generate should not throw anything') do
      Classnamer.generate
    end
  end

  def test_generate_should_return_a_string
    assert Classnamer.generate.is_a?(String), 'Classnamer.generate should return a string'
  end

  def test_generated_name_should_not_be_empty
    assert Classnamer.generate.size > 0, 'generated name should not be empty'
  end

  def test_generated_name_should_start_with_part_0
    name = Classnamer.generate
    assert Classnamer::PARTS[0].map { |part| (name =~ /^#{part}/).nil? }.include?(false), 'generated name should start with part 1'
  end

  def test_generated_name_should_contain_part_1
    name = Classnamer.generate
    assert Classnamer::PARTS[1].map { |part| (name =~ /#{part}/).nil? }.include?(false), 'generated name should contain part 1'
  end

  def test_generated_name_should_end_with_part_2
    name = Classnamer.generate
    assert Classnamer::PARTS[2].map { |part| (name =~ /#{part}$/).nil? }.include?(false), 'generated name should end with part 2'
  end
end
