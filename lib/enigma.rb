class Enigma

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = Key.new(key)
    @offset = Offset.new(date)
    @alphabet_arr = KeyOffsetHelper.alphabet_array
  end

  def encrypt
    offset = @offset.hashed
    keys = @key.create_keys
    combo = keys.merge(offset) {|k,o,n| o + n}
    message_arr = message.chars
    iter = 0
    result = []
    @message.each_char do |char|
     if !message_arr.include?(char)
       result << char
     else
       adjust = message_arr.index(char) + combo.values[iter]
       if adjust < 27
         result << message_arr[adjust]
       else
         num = adjust % 27
         result << message_arr[num]
       end
       iter += 1
       if iter > 3
         iter = 0
       end
     end
   end
   {encryption: result.join(""), key: @key, date: @date}
  end

end
