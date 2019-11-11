class Enigma

  attr_reader :message, :key, :date

  def initialize
    @message = message
    @alphabet_arr = KeyOffsetHelper.alphabet_array
  end

  def encrypt(message, key = create_key, date = today)
    result = Encryptor.new(message, key, date)
    result.encryptor
  end

end
