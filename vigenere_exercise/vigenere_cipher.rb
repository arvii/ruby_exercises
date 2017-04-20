require 'pry'
require './vigenere_cipher_support2.rb'
class VigenereCipher
	include VigenereCipherSupport2
	def encrypt value, salt
	  process_encryption value, salt
	end

	def decrypt encrypted_value, salt
		process_decryption encrypted_value, salt
	end

end