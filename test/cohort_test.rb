require 'test_helper'

class CohortTest < Minitest::Test
  def test_should_capture_the_cohort
    parser = Midl::Parser.new('all records in study NIC-345678')
    assert parser.valid?
    assert_equal({ Midl::EQUALS => 'NIC-345678' }, parser.meta_data['cohort'])

    parser = Midl::Parser.new('all records in cohort NIC_345678')
    assert parser.valid?
    assert_equal({ Midl::EQUALS => 'NIC-345678' }, parser.meta_data['cohort'])

    parser = Midl::Parser.new('all records in study cohort NIC_345678, but do not apply opt-outs')
    assert parser.valid?
    assert_equal({ Midl::EQUALS => 'NIC-345678' }, parser.meta_data['cohort'])
  end
end
