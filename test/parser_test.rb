require 'test_helper'

class ParserTest < Minitest::Test
  def test_midl_parser
    query = 'all'
    parser = MidlParser.new
    parser.parse(query.downcase)
  end

  def test_should_raise_exception_on_non_string_query
    assert_raises ArgumentError do
      Midl::Parser.new(/all/)
    end
  end

  def test_should_display_error_msg_on_empty_query
    parser = Midl::Parser.new('')

    refute parser.valid?
    assert_instance_of Hash, parser.meta_data
    assert_empty parser.meta_data
    refute_nil parser.failure_reason
  end

  def test_should_display_error_msg_on_invalid_query
    parser = Midl::Parser.new('bob and simon')

    refute parser.valid?
    assert_empty parser.meta_data
    refute_nil parser.failure_reason
  end

  def test_should_cope_with_a_mixed_case_query
    parser = Midl::Parser.new('All')

    assert parser.valid?
    assert_equal({ Midl::ALL => false }, parser.meta_data['ignore_opt_out'])
    assert_nil parser.failure_reason
  end
end
