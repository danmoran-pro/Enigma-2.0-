class Encryptor

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet_arr = KeyOffsetHelper.alphabet_array
  end

  def encryptor
    dates = Offset.new(date).hashed
    keys = Key.new(key).create_keys
    combo = keys.merge(dates) {|k,o,n| o + n}
    message_arr = @alphabet_arr
    iter = 0
    result = []
    @message.each_char do |char|
     if !message_arr.include?(char)
       result << char
     else
       # binding.pry
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
