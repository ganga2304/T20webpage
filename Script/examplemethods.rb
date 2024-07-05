module ExampleMethods
  def calculate_price(i, c, w, v)
    total_volume = total_volume(v, i)
    total_weight = total_weight(w, i)
    total_volume = total_volume(c, i)
    #method calling
    amount_increase_to_ten()
    cal_total(total_volume, total_weight, total_volume)
  end

  def total_volume(v, i)
    v * i
  end

  def total_weight(w, i)
    w * i
  end

  def amount_increase_to_ten
    (1..10).to_a.each do |i|
      puts 'Enter a new value'
    end
  end

  def cal_total(total, total1, total2)
    temp_val = total + total1 + total2
    temp_val = temp_val * temp_val
    (1..10).to_a.each do |i|
      puts 'Result should be below value'
      puts temp_val
      puts 'Finalized'
    end
  end
end