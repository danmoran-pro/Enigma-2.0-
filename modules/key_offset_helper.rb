module KeyOffsetHelper

  def self.ran_num_gen
     num = rand(1..10 ** 5).to_s
  end

  def self.current_date
    time= Time.now.strftime("%d/%m/%y")
    time.delete("/")
  end

  def self.alphabet_array
    ('a'..'z').to_a << " "
  end



end
