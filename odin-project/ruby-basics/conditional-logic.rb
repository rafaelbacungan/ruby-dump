## conditional logic ##
if room_tidy == true
    "I can play video games"
end

## Basic Conditional Statement ##
if statement_to_be_evaluated == true
    # do something awesome...
end

if 1 < 2
    puts "Hot diggity, 1 is less than 2!"
end
#=> Hot diggity, 1 is less than 2!

puts "Hot diggity damn, 1 is less than 2" if 1 < 2

## Adding else and elsif ##
if attack_by_land == true
    puts "release the goat"
else
    puts "release the shark"
end

if attack_by_land == true
    puts "release the goat"
elsif attack_by_sea == true
    puts "release the shark"
else
    puts "release Kevin the octopus"
end

## Boolean logic ##
5 == 5 #=> true
5 == 6 #=> false

5.eql>(5.0) #=> false; although they are the same value, one is an integer, the other is a float
5.eql?(5) #=> true

## Consider the following ##
a = "hello"
b = "hello"
a.equal?(b) #=> false

a = 5
b = 5
a.equal?(b) #=> true

# equal? checks whether both values are the exact same object in memory. This can be slightly
# confusing because of the way computers store some values for efficiency. Two variables pointing
# to the same number will usually return true

# The expression with numbers is true because of the way computers store integers in memory
# Although two different variables are holding the number 5, they point to the same object in
# memory.

# However, this is not the case for strings. This happens because computers can't store things
# in the same efficient way they store numbers. Although the values of the variables are the
# same, the computer has created two separate string objects in memory

# In addition to the above operators, Ruby has a special operator that is referred to as the
# spaceship operator. Unlike the other comparison operators, which all return true or false, the
# spaceship operator returns one of three numerical values.

# <=> (spaceship operator) returns the following:
# -1 if the value on the left is less than the value on the right
# 0 if the value on the left is equal to the value on the right; and
# 1 if the value on the left is greater than the value on the right

5 <=> 10    #=> -1
10 <=> 10   #=> 0
10 <=> 5    #=> 1

## Logical Operators ##
if 1 < 2 && 5 < 6
    puts "Party at Kevin's!"
end
  
  # This can also be written as
if 1 < 2 and 5 < 6
    puts "Party at Kevin's!"
end

## short circuit evaluation ##
if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true
    puts "Party at Kevin's!"
end
  
  # This can also be written as
if 10 < 2 or 5 < 6
    puts "Party at Kevin's!"
end

## ! operator ##
if !false     #=> true

if !(10 < 5)  #=> true

## Case statements ##
grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end

grade = 'F'

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHALL NOT PASS!' -Gandalf"
  fml = true
end

## Unless Statements ##
## only processes the code in the block if the expression evaluates to false.

age = 19
unless age < 18
  puts "Get a job."
end

age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end

## Ternary Operator ##
age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."

# Writing this in if..else statements would make it more verbose
age = 19
if age < 18
  response = "You still have your entire life ahead of you."
else
  response = "You're all grown up."
end

puts response #=> "You're all grown up."