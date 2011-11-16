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

  def test_generate_should_return_a_non_empty_string
    assert Classnamer.generate.size > 0, 'return value of Classnamer.generate should not be empty'
  end

  def test_generate_should_return_a_string_starting_with_a_capital_letter
    assert Classnamer.generate =~ /^[A-Z]/, 'return value of Classnamer.generate should start with an uppercase letter'
  end
end
