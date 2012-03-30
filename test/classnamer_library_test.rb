require "test_helper"

class ClassnamerLibraryTest < MiniTest::Unit::TestCase
  def test_version_constant_exists
    refute_nil Classnamer::VERSION
  end

  def test_part_candidate_matrix_has_three_elements
    assert_equal 3, Classnamer::PART_CANDIDATE_MATRIX.length
  end

  def test_part_candidate_matrix_is_frozen
    assert Classnamer::PART_CANDIDATE_MATRIX.frozen?
  end

  def test_each_element_of_part_candidate_matrix_is_frozen
    assert Classnamer::PART_CANDIDATE_MATRIX.all?(&:frozen?)
  end

  def test_each_part_candidate_starts_with_an_uppercase_letter
    assert Classnamer::PART_CANDIDATE_MATRIX.flatten(1).all?{|part_candidate| part_candidate =~ /\A[A-Z]/}
  end

  def test_each_part_candidate_is_frozen
    assert Classnamer::PART_CANDIDATE_MATRIX.flatten(1).all?(&:frozen?)
  end

  def test_classnamer_responds_to_generate
    assert_respond_to Classnamer, :generate
  end

  def test_generate_does_not_output
    assert_silent do
      Classnamer.generate
    end
  end

  def test_generate_returns_a_concatenation_of_part_candidates
    assert_equal "FooBarBazQux", Classnamer.generate([["Foo"], ["Bar"], ["Baz"], ["Qux"]])
  end

  def test_generate_returns_a_single_part_name
    assert_equal "Foo", Classnamer.generate([["Foo"]])
  end

  def test_generate_returns_empty_string_for_empty_part_candidate_matrix
    assert_equal "", Classnamer.generate([])
  end

  def test_generate_returns_empty_string_for_empty_part_candidate_arrays
    assert_equal "", Classnamer.generate([[], [], []])
  end

  def test_generate_uses_default_part_candidate_matrix
    seed = srand
    srand seed
    name1 = Classnamer.generate(Classnamer::PART_CANDIDATE_MATRIX)
    srand seed
    name2 = Classnamer.generate
    assert_equal name1, name2
  end

  def test_generate_raises_an_exception_when_given_an_inappropriate_argument
    assert_raises(NoMethodError) do
      Classnamer.generate nil
    end
  end

  def test_generate_raises_an_exception_when_argument_contains_an_inappropriate_element
    assert_raises(NoMethodError) do
      Classnamer.generate [["Foo"], nil]
    end
  end

  def test_generate_converts_part_candidates_to_strings
    assert_equal "42ObjecttrueSymbolFoo", Classnamer.generate([[42], [Object], [nil], [true], [:Symbol], ["Foo"]])
  end
end
