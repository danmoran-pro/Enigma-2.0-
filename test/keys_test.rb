require './test/test_helper'





class KeyTest < Minitest::Test

    def setup
      @ran_num_1 = Key.new
      @ran_num_2 = Key.new("12345")
    end

    def test_keys_exists
      assert_instance_of Key, @ran_num_1
    end

    def test_can_be_initialized_with_or_without_key
      @ran_num_1.key.stubs(:key).returns("67899")
      assert_equal "12345", @ran_num_2.key
    end

    def test_array_can_be_converted
      expected = {
        :a=>12,
        :b=>23,
        :c=>34,
        :d=>45
      }

      assert_equal expected, @ran_num_2.create_keys

      expected_2 = {
        :a=>67,
        :b=>78,
        :c=>89,
        :d=>99
      }

      @ran_num_1.create_keys.stubs(:key).returns(expected_2)
    end
end
