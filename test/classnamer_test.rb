require "test_helper"

class ClassnamerTest < MiniTest::Unit::TestCase
  def test_part_candidate_matrix_is_an_array
    assert_kind_of Array, Classnamer::PARTS
  end

  def test_part_candidate_matrix_has_three_elements
    assert_equal 3, Classnamer::PARTS.length
  end

  def test_each_element_of_part_candidate_matrix_is_an_array
    assert Classnamer::PARTS.all?{|part_array| part_array.kind_of?(Array)}
  end

  def test_each_part_candidate_is_a_string
    assert Classnamer::PARTS.flatten(1).all?{|part| part.kind_of?(String)}
  end

  def test_each_part_candidate_starts_with_an_uppercase_letter
    assert Classnamer::PARTS.flatten(1).all?{|part| part =~ /^[A-Z]/}
  end

  def test_classnamer_responds_to_generate
    assert_respond_to Classnamer, :generate
  end

  def test_generate_returns_a_string
    assert_kind_of String, Classnamer.generate
  end

  def test_generated_name_starts_with_an_initial_part_candidate
    name = Classnamer.generate
    assert Classnamer::PARTS[0].any?{|part| name =~ /^#{part}/}
  end

  def test_generated_name_contains_a_middle_part_candidate
    name = Classnamer.generate
    assert Classnamer::PARTS[1].any?{|part| name =~ /#{part}/}
  end

  def test_generated_name_ends_with_a_final_part_candidate
    name = Classnamer.generate
    assert Classnamer::PARTS[2].any?{|part| name =~ /#{part}$/}
  end

  def test_generate_returns_a_concatenation_of_part_candidates
    assert_equal "FooBarBaz", Classnamer.generate([["Foo"], ["Bar"], ["Baz"]])
  end
end
