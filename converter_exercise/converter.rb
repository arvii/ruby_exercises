require './support.rb'
class Converter
  include Support

  def convert num
    @hundreds_value = ""
    @tens_value = ""
    @ones_value = ""
    string_num_values = num.to_s

    if string_num_values.size > 3 || num < 0 
  	  puts "Invalid number"
    else
  	  puts convert_num_to_word_value string_num_values
    end
  end	
end