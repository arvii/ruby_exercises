class Sieve
  def prime max_range
    prime_numbers = (0...max_range).to_a
    prime_numbers[0] = prime_numbers[1] = nil

    prime_numbers.each do |num|
      
      next unless num

      break if num*num > max_range

      (num+num).step(max_range,num) { |temp_num| prime_numbers[temp_num] = nil }
    end
    puts prime_numbers.compact.to_s
  end
end