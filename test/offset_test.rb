require './test/test_helper'


class OffsetTest < Minitest::Test

  def setup
    @offset_1 = Offset.new
    @offset_2 = Offset.new("051119")
  end

  def test_offset_exists
    assert_instance_of Offset, @offset_2
  end

  # def test_can_take_date_or_use_current_date
  #   @offset_1.date.stubs(:date).returns("021093")
  #
  #   assert_equal "140919", @offset_2.date
  # end
  #
  # def test_date_is_squared_and_returns_last_4_numbers
  #   @offset_1.date.stubs(:keys).returns("021093")
  #   assert_equal "4561",@offset_2.squared
  # end
  #
  # def test_offset_array_can_be_converted
  #   expected = {
  #     :a=>4,
  #     :b=>5,
  #     :c=>6,
  #     :d=>1
  #   }
  #
  #   assert_equal expected, @offset_1.hashed
  #
  #   expected = {
  #     :a=>4,
  #     :b=>5,
  #     :c=>6,
  #     :d=>1
  #   }
  #
  #   assert_equal expected, @offset_2.hashed
  # end


end
