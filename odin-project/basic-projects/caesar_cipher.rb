def caesar_cipher(cipher_string, character_bump)
    # Iterate through the string
    alphabet = ('a'..'z').to_a
    encrypted_string = ""
    for character in 0..cipher_string.length - 1
        # Move character 5 positions to the right.
        # Find the letter in the alphabet array. Take into consideration for values
        # greater than the array length.
        current_char = cipher_string[character]
        new_index = alphabet.find_index(current_char)
        new_index += character_bump

        if new_index >= alphabet.length
            new_index = new_index - alphabet.length
            encrypted_string += alphabet[new_index]
        else
            encrypted_string += alphabet[new_index]
        end
    end

    puts(encrypted_string)
end

caesar_cipher("zzzzzz", 5)