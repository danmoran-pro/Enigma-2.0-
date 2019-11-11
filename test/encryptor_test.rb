require './test/test_helper'

class EncryptorTest < Minitest::Test

  def setup
    @encrypt = Encryptor.new("hello world!", "02715", "040895")
  end

  def test_it_exist
    assert_instance_of Encryptor, @encrypt
  end

  def test_it_has_attributes
    assert_equal "hello world!",  @encrypt.message
    assert_equal "02715",  @encrypt.key
    assert_equal "040895",  @encrypt.date
  end

  def test_encrypt_method
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}
    assert_equal expected, @encrypt.encryptor
  end
end
