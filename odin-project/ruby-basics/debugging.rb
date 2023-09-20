## Debugging ##

# Debugging with Puts
def isogram?(string)
    original_length = string.length
    string_array = string.downcase.split
    unique_length = string_array.uniq.length
    original_length == unique_length
end

isogram?("Odin")
#=> false

# Debugging with p
def isogram?(string)
    original_length = string.length
    string_array = string.downcase.split

    p string_array

    unique_length = string_array.uniq.length

    p unique_length

    original_length == unique_length
end

isogram?("Odin")

# Debugging with Pry-byebug
# Pry is a Ruby gem that provides you with an interactive REPL while your program is running.
# The REPL provided by Pry is verys similar to IRB but has added functionality.
# The recommended Ruby gem for debuging is Pry-byebug and it includes Pry as a dependency. Pry-byebug
# adds step-by-step debugging and stack navigation.

# To use Pry-byebug, you'll first need to install it in your terminal by running `gem install prye-byebug`.
# You can then make it available in your program by requiring it at the top of your file with `require 'pry-byebug'`.
# Finally, to use Pry-byebug, you just need to call binding.pry at any point in your program. If you encounter an error like this:
Error: while executing gem ... (Gem::Exception)
    OpenSSL is not available. Install OpenSSL and rebuild Ruby (preferred) or us non-HTTPS sources

# Ensure that Ubuntu is up to date and upgraded by using these commands in order (These commands will require user password input):
sudo apt update
sudo apt upgrade

require 'pry-byebug'

def isogram?(string)
    original_length = string.length
    string_array = string.downcase.split

    binding.pry

    unique_length = string_array.uniq.length
    original_length == unique_length
end

isogram?("Odin")

require 'pry-byebug'

def yell_greeting(string)
    name = string

    binding.pry

    name = name.upcase
    greeting = "WASSAP, #{name}!"
    puts greeting
end

yell_greeting("bob")