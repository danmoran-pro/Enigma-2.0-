class Encryptor

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message.chars
    @key = key
    @date = date
    @alphabet_hash = KeyOffsetHelper.alphabet_hash
    @alphanet_arr = KeyOffsetHelper.alphabet_arr
  end

  def encryptor
    dates = Offset.new(date).hashed
    keys = Key.new(key).create_keys
    combo = keys.merge(dates) {|k,o,n| o + n}
    iter = 0
    result = []
    binding.pry
    @message.each_index(0) do |char|
     if message_arr.include?(char)
       result << char
     else
       adjust = message_arr.values_at(char).join.to_i + combo.values[iter]
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
