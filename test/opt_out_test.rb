require 'test_helper'

class OptOutTest < Minitest::Test
  def test_should_default_to_using_optouts
    parser = Midl::Parser.new('all records')

    assert parser.valid?
    assert_equal({ Midl::ALL => false }, parser.meta_data['ignore_opt_out'])
  end

  def test_should_ignore_opt_outs
    parser = Midl::Parser.new('all records, but ignore opt-outs')
    assert parser.valid?
    assert_equal({ Midl::ALL => true }, parser.meta_data['ignore_opt_out'])

    parser = Midl::Parser.new('all records do not apply opt-out')
    assert parser.valid?
    assert_equal({ Midl::ALL => true }, parser.meta_data['ignore_opt_out'])

    parser = Midl::Parser.new('all records, ignoring optouts')
    assert parser.valid?, "failure_reason: #{parser.failure_reason}"
    assert_equal({ Midl::ALL => true }, parser.meta_data['ignore_opt_out'])
  end
end
