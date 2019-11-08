require './test/test_helper'


class OffsetTest < Minitest::Test

  def setup
    @offset_1 = Offset.new
    @offset_2 = Offset.new("051119")
    @offset_3 = Offset.new("021093")
  end

  def test_offset_exists
    assert_instance_of Offset, @offset_2
  end

  def test_can_take_date_or_use_current_date
    @offset_1.offset.stubs(:offset).returns("021093")

    assert_equal "051119", @offset_2.offset
  end

  def test_date_is_squared_and_returns_last_4_numbers
    @offset_1.offset.stubs(:key).returns("021093")
    assert_equal "2161",@offset_2.squared
  end

  def test_offset_array_can_be_converted
    expected = {
      :a=>4,
      :b=>6,
      :c=>4,
      :d=>9
    }

    assert_equal expected, @offset_3.hashed

    expected = {
      :a=>2,
      :b=>1,
      :c=>6,
      :d=>1
    }

    assert_equal expected, @offset_2.hashed
  end


end
