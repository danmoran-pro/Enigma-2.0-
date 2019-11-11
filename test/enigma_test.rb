require './test/test_helper'


class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_can_encrypt
    # @enigma.encrypt
    expected =
    {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    }
    assert_equal "keder ohulw", @enigma.encrypt("hello world", "02715", "040895")
  end


end
