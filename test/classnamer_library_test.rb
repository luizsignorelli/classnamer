require 'test/unit'
require 'classnamer'

class ClassnamerLibraryTest < Test::Unit::TestCase
  def test_version_constant_exists
    assert_not_nil Classnamer::VERSION
  end

  def test_part_candidate_matrix_has_three_elements
    assert_equal 3, Classnamer::PART_CANDIDATE_MATRIX.length
  end

  def test_each_part_candidate_starts_with_an_uppercase_letter
    assert Classnamer::PART_CANDIDATE_MATRIX.flatten(1).
      all? { |part_candidate| part_candidate =~ /\A[A-Z]/ }
  end

  def test_classnamer_responds_to_generate
    assert_respond_to Classnamer, :generate
  end

  def test_classnamer_generates_a_string
    assert_kind_of String, Classnamer.generate
  end

  def test_generate_returns_concatenation_of_part_candidates_as_strings
    assert_equal '42ObjecttrueSymbolFoo',
      Classnamer.generate([[42], [Object], [nil], [true], [:Symbol], ['Foo']])
  end

  def test_generate_calls_prng_with_length_of_each_element_of_part_candidate_matrix
    matrix = [%w{A B C}, [], %w{A B}, %w{A}]
    prng_args = []
    prng = lambda { |n|
      prng_args << n
      0
    }
    Classnamer.generate matrix, prng
    assert_equal [3, 0, 2, 1], prng_args
  end

  def test_generate_uses_prng_for_indices
    matrix = [%w{Foo0 Foo1 Foo2}, %w{Bar0 Bar1 Bar2}, %w{Baz0 Baz1 Baz2}]
    indices = [0, 2, 1]
    assert_equal 'Foo0Bar2Baz1',
      Classnamer.generate(matrix, lambda { |_| indices.shift })
  end

  def test_generate_returns_a_single_part_name
    assert_equal 'Foo', Classnamer.generate([['Foo']])
  end

  def test_generate_returns_empty_string_for_empty_part_candidate_matrix
    assert_equal '', Classnamer.generate([])
  end

  def test_generate_returns_empty_string_for_empty_part_candidate_arrays
    assert_equal '', Classnamer.generate([[], [], []])
  end

  def test_generate_raises_an_exception_when_given_an_inappropriate_matrix
    assert_raise(NoMethodError) { Classnamer.generate nil }
  end

  def test_generate_raises_an_exception_when_given_an_inappropriate_prng
    assert_raise(NoMethodError) {
      Classnamer.generate Classnamer::PART_CANDIDATE_MATRIX, nil
    }
  end

  def test_generate_raises_an_exception_when_argument_contains_an_inappropriate_element
    assert_raise(NoMethodError) { Classnamer.generate [['Foo'], nil] }
  end

  def test_initialize_generator_instance
    assert_kind_of Classnamer::Generator, Classnamer::Generator.new
  end

  def test_generator_responds_to_generate
    assert_respond_to Classnamer::Generator.new, :generate
  end

  def test_generator_generates_based_on_initialization_parameters
    matrix = [%w{Foo0 Foo1 Foo2}, %w{Bar0 Bar1 Bar2}, %w{Baz0 Baz1 Baz2}]
    indices = [0, 2, 1]
    generator = Classnamer::Generator.new(matrix, lambda { |_| indices.shift })
    assert_equal 'Foo0Bar2Baz1', generator.generate
  end
end
