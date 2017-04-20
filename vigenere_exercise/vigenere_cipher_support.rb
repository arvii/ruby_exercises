module VigenereCipherSupport
	def process_encryption value, salt
		generate_vigenere_square
		encrypted_word = ""
		(0..value.length-1).each do |i|
		  if /[[:upper:]]/.match(value[i])
		  	encrypted_word += process_encrypt value[i], salt[i].ord, 65
		  else
		  	encrypted_word += process_encrypt value[i], salt[i].ord, 97
		  end 	  
		end
		puts encrypted_word
	end

	def process_decryption encrypted_value, salt
		generate_vigenere_square
		decrypted_word = ""

		(0..encrypted_value.length-1).each do |i|
		  if /[[:upper:]]/.match(encrypted_value[i])
		  	decrypted_word += process_decrypt encrypted_value[i], salt[i], 65
		  else
		  	decrypted_word += process_decrypt encrypted_value[i], salt[i], 97
		  end 	  
		end
		puts decrypted_word
	end

	private

	def generate_vigenere_square
	  @vigenere_table = {}

	  generate_vigenere_upper_case_square @vigenere_table
	  generate_vigenere_lower_case_square @vigenere_table
	end

	def generate_vigenere_upper_case_square table
		upper_a_int_value = 65
		upper_z_int_value = 90
		(upper_a_int_value..upper_z_int_value).each do |int_value|
		  table[int_value.chr] = generate_horizontoal_value upper_a_int_value, upper_z_int_value, int_value
		end
	end

	def generate_vigenere_lower_case_square table
		lower_a_int_value = 97	
		lower_z_int_value = 122
		(lower_a_int_value..lower_z_int_value).each do |int_value|
		  table[int_value.chr] = generate_horizontoal_value lower_a_int_value, lower_z_int_value, int_value
		end
	end

	def generate_horizontoal_value min_range, max_range, int_value
		horizontal_value = []

		if int_value <= max_range
		  (int_value..max_range).each do |int_value|
			horizontal_value << int_value.chr
		  end

		  char_gap = int_value - min_range
		  unless char_gap == 0
		  	(min_range..min_range+char_gap-1).each do |int_value|
			  horizontal_value << int_value.chr
		  	end
		  end
		end
		horizontal_value
	end

	def process_encrypt value, salt, base_char_int
		horizontal_array_value = @vigenere_table[value]
		horizontal_array_value[salt - base_char_int]
	end

	def process_decrypt decrypt_value, salt, base_char_int
		horizontal_array_value = @vigenere_table[salt]
		hash = Hash[horizontal_array_value.map.with_index.to_a]
		(hash[decrypt_value] + base_char_int).chr
	end

end