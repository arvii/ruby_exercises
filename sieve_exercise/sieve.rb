class Sieve
  def prime range
    numbers = []
    (2..range).each do |num|
      if is_prime? num
        numbers.push(num)
      end
    end
    puts numbers
  end

  private 

  def is_prime? num
    return false if num <= 1
    Math.sqrt(num).to_i.downto(2).each {|i| return false if num % i == 0}
    true
  end
end