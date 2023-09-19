## Numbers ##

# Addition
1 + 1 #=> 2

# Subtraction
2 - 1 #=> 1

# Multiplication
2 * 2 #=> 4

# Division
10 / 5 #=> 2

# Exponent
2 ** 2 #=> 4
3 ** 4 #=> 81

# Modulus (find the remainder of division)
8 % 2 #=> 0 (8 / 2 = 4; no remainder)
10 % 4 #=> 2 (10 / 4 = 2 with a remainder of 2)

## Integers and Floats ##
17 / 5 #=> 3, not 3.4
17 / 5.0 #=> 3.4

## Converting number types
13.to_f #=> 13.0
13.9.to_i #=> 13

## even/odd methods
6.even? #=> true
7.even> #=> false

6.odd> #=> false
7.odd #=> true

## Concatenation ##

# With plus operator
"Welcome" + "to" + "Odin" #=> "Welcome to Odin"
# With the shovel operator
"Welcome " << "to " << "Odin " #-> "Welcome to Odin"
# With the concat method
"Welcome ".concat("to ").concat("Odin!") #=> "Welcome to Odin"

## Substrings ##
"hello"[0] #=> "h"
"hello"[0..1] #=> "he"
"hello"[0, 4] #=> "hell"
"hello"[-1] #=> "o"

## Escape characters ###
\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
# \"  #=> Double quotation mark
# \'  #=> Single quotation mark

## Interpolation ##
name = "Odin"
puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello #{name}' #=> "Hello, #{name}"

## Common String methods ##
"hello".capitalize #=> "Hello"

"hello".include?("lo") #=> true
"hello".include?("z") #=> false

"hello".upcase #=> "HELLO"
"Hello".downcase #=> "hello"

"hello".empty? #=> false
"".empty? #=> true

"hello".length #=> 5
"hello".reverse #=> "olleh"

"hello world".split #=> ["hello", "world"]
"hello".split("") #=> ["h", "e", "l", "l", "o"]

" hello, world   ".strip  #=> "hello, world"

## Symbols ##

# Symbols vs Strings
# Strings can be changed, so every time a string is used, Ruby has to store it in memory even if an existing string with the same
# value already exists. Symbols, on the other hand, are stored in memory only once, making them faster in certain situations.
# One common application where symbols are preferred over strings are the keys in hashes.

:my_symbol

"string" == "string" #=> true
"string".object_id == "string".object_id #=> false
:symbol.object_id == :symbol.object_id #=> true