module VigenereCipherSupport2
  def process_encryption value, salt
    encrypted_word = ""

    while salt.size < value.size
      salt += salt
    end

    (0..value.length-1).each do |i|
      cipher = (value[i].ord - LOWER_CASE_A_INT).abs + (salt[i].ord - LOWER_CASE_A_INT).abs
    	
      if cipher > NUMERIC_RANGE
        encrypted_word += ((cipher%NUMERIC_RANGE) + LOWER_CASE_A_INT).chr 
      else
        encrypted_word += (cipher + LOWER_CASE_A_INT).chr  
      end
    end
    puts encrypted_word
  end

  def process_decryption value, salt
  	decrypted_word = ""

  	while salt.size < value.size
  	  salt += salt
  	end

  	(0..value.length-1).each do |i|
  		cipher = (value[i].ord - LOWER_CASE_A_INT).abs - (salt[i].ord - LOWER_CASE_A_INT).abs
      if cipher < 0
        decrypted_word += ((NUMERIC_RANGE + cipher) + LOWER_CASE_A_INT).chr 
      else
        decrypted_word += (cipher + LOWER_CASE_A_INT).chr
      end
  	end
  	puts decrypted_word
  end

  private
  LOWER_CASE_A_INT = 97
  NUMERIC_RANGE = 26
end