## Ruby's built-in methods ##

# Methods are typically called by adding `.method_name` after an instance of the object that contains that method
# In this case, #reverse is a built-in method for String objects
"anything".reverse
puts "anything" #=> anything

## Creating a method ##
def my_name
    "Joe Smith"
end

puts my_name #=> "Joe Smith"

## Method names ##
method_name      # valid
_name_of_method  # valid
1_method_name    # invalid
method_27        # valid
method?_name     # invalid
method_name!     # valid
begin            # invalid (Ruby reserved word)
begin_count      # valid

## Parameters and arguments ##
def greet(name)
    "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!

# Default parameters
def greet(name = "stranger")
    "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!

# What methods return
def my_name
    return "Joe Smith"
end

puts my_name

def even_odd(number)
    if number % 2 == 0
        "That is an even number"
    else
        "That is an odd number"
    end
end

puts even_odd(16) #=> That is an even number
puts even_odd(17) #=> That is an odd number

def my_name
    return "Joe Smith"
    "Jane Doe"
end

puts my_name #=> "Joe Smith"

def even_odd(number)
    unless number.is_a? Numeric
        return "A number was not entered"
    end

    if number % 2 == 0
        "that is an even number"
    else
        "That is an odd number"
    end
end

puts even_odd(20) #=> That is an even number
puts even_odd("Ruby") #=> A number was not entered

## Difference between puts and return ##
# A common source of confusion for new programmers is the difference between puts and return
# - puts is a method that prints whatever argument you pass it to the console.
# - return is the final output of a method that you can use in other places throughout your code.

def puts_squared(number)
    puts number * number
end

def return_squared(number)
    number * number
end

x = return_squared(number)
y = 100
sum = x + y #=> 500

puts "The sum of #{x} and #{y} is #{sum}"
#=> The sum of 400 and 100 is 500

## Chaining methods ##
# Used to write very concise code

phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"

["be", "to", "not", "or", "be", "to"].reverse
= ["to", "be", "or", "not", "to", "be"].join(" ")
= "to be or not to be".capitalize
= "To be or not to be"

## Predicate methods ##
# You will sometimes encounter built-in Ruby methods that have a question mark at the end of their name.
# These are all predicate methods, which is a naming convention that Ruby uses for methods that return
# a boolean, that is, they return either true or false.

puts 5.even? #=> false
puts 6.even #=> true
puts 17.odd #=> true

puts 12.between?(10,15) #=> true

## Bang methods ##
whisper = "HELLO EVERYBODY"
puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"

puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"