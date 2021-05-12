require 'test_helper'

class OptOutTest < Minitest::Test
  def test_should_ignore_opt_outs
    parser = Midl::Parser.new('all, but ignore opt-outs')
    assert parser.valid?
    assert_equal({ Midl::ALL => true }, parser.meta_data['ignore_opt_out'])

    parser = Midl::Parser.new('all do not apply opt-out')
    assert parser.valid?
    assert_equal({ Midl::ALL => true }, parser.meta_data['ignore_opt_out'])

    parser = Midl::Parser.new('all, ignoring optouts')
    assert parser.valid?, "failure_reason: #{parser.failure_reason}"
    assert_equal({ Midl::ALL => true }, parser.meta_data['ignore_opt_out'])
  end
end
