class Offset

attr_reader :offset

  def initialize(offset = KeyOffsetHelper.current_date)
    @offset = offset
  end

end
