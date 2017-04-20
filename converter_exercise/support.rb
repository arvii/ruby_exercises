module Support

	def convert_num_to_word_value string_num_values
		if string_num_values.size == 3
		  convert_to_hundreds string_num_values
		elsif string_num_values.size == 2
		  convert_to_tens string_num_values
		else
		  convert_to_ones string_num_values[0]
		end
		"#{@hundreds_value} #{@tens_value} #{@ones_value}".strip
	end

	def convert_to_hundreds string_num_values
	  set_hundred_string_value string_num_values[0]
	  string_num_values[0] =''
	  convert_to_tens string_num_values
	end

	def convert_to_tens string_num_values
	  if string_num_values[0] == "1"
	    set_tens_string_value string_num_values
	  else
	    set_tens_string_value string_num_values[0]
	    string_num_values[0] =''
			
	    unless string_num_values == "0"
		  convert_to_ones string_num_values
	    end
	  end

	end

	def convert_to_ones string_num_values	
	  set_ones_string_value string_num_values	
	end

	def set_hundred_string_value string_num_value
	  @hundreds_value = "#{set_ones_string_value string_num_value} Hundred"
	  @ones_value = ""
	end

	def set_tens_string_value string_num_value
	  if string_num_value[0] == "1"
		tens = {
	      "0" => "Ten",
		  "1" => "Eleven",
		  "2" => "Twelve",
		  "3" => "Thirteen",
		  "4" => "Fourteen",
		  "5" => "Fifteen",
		  "6" => "Sixteen",
		  "7" => "Seventeen",
		  "8" => "Eighteen",
		  "9" => "Nineteen"
		}

		@tens_value = tens[string_num_value[1]]
	  else
		tens = {
		  "2" => "Twenty",
		  "3" => "Thirty",
		  "4" => "Fourty",
		  "5" => "Fifty",
		  "6" => "Sixty",
		  "7" => "Seventy",
		  "8" => "Eighty",
		  "9" => "Ninety"
		}

		@tens_value = tens[string_num_value]
	  end
	end

	def set_ones_string_value string_num_value
	  ones = {
		"0" => "Zero",
		"1" => "One",
		"2" => "Two",
		"3" => "Three",
		"4" => "Four",
		"5" => "Five",
		"6" => "Six",
		"7" => "Seven",
		"8" => "Eight",
		"9" => "Nine"
	  }
	  @ones_value = ones[string_num_value]
	end
end