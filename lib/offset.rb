class Offset

attr_reader :offset

  def initialize(offset = KeyOffsetHelper.current_date)
    @offset = offset
  end

  def squared
  squared = (offset.to_i * offset.to_i).to_s
  squared[-4..-1]
end

def hashed
  offsets_arr = squared
  {
    a: offsets_arr[0].to_i,
    b: offsets_arr[1].to_i,
    c: offsets_arr[2].to_i,
    d: offsets_arr[3].to_i
  }
end

end
