## Life before enumerables ##
# Let's say that you wanted to make an invite list for your birthday using your `friends` array
# but that you don't want to invite your friend Brian because he's a bit of a nutcase at parties
# and always drinks too much.

# With the loops you've learned so far, you might do something like this
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends.do
    if friend != 'Brian'
        invided_list.push(friend)
    end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]
# Warning: The do is optional in a for loop in Ruby and may cause issues if used in IRB


## Using the #select enumerable method, you can change the above code to this: ##
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friends.select {|friend| friend != 'Brian'}
#=> ["Sharon", "Leo", "Leila", "Arun"]

# or even better and more to the point
friends.reject {|friend|friend == 'Brian'}
#=> ["Sharon", "Leo", "Leila", "Arun"]


## The each method ##
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]

## What if the block you want to pass to a method requires more logic than can fit on one line? ##
my_array = [1, 2]

my_array.each do |num|
    num *= 2
    puts "The new number is #{num}"
end

#=> The new number is 2.
#=> The new number is 4.

#=> [1, 2]

# #each also works for hashes with a bit of added functionality. By default, each iteration will yield both
# the key and value individually or together (as an array) to the block depending on how you define your
# block variable

my_hash = { "one" => 1, "two" => 2 }
my_hash.each { |key, value| puts "#{key} is #{value}"}

# one is 1
# two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{}pair" }

# the pair is ["one", 1]
# the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}

# You may have noticed in the above code examples that #each returns the original array or hash regardless of what
# happens inside the code block. This is an important thing to keep in mind when debugging your code as it
# can lead to some confusion

# Take this code for example
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| friend.upcase }

#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

# You might expect this to return ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN'], but you'd be wrong. It actually
# returns the original array you called #each on.



## The each_with_index method ##
# This method is nearly the same as #each, but it provides  some additional functionality by yielding two block
# variables instead of one as it iterates through an array. The first variable's value is the element itself,
# while the second variable's value is the index of that element within the array. This allows you to do things
# that are a bit more complex.

# For example, if we only want to print every other word from an array of strings, we can achieve this like so:

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]



## The map method ##
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]

salaries = [1200, 1500, 1100, 1800]

salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]



## The select method ##
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

#=> ["Sharon", "Leo", "Leila", "Arun"]

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}



## The reduce method ##
my_numbers = [5,6,7,8]
sum = 0

my_numbers.each { |number| sum += number }

sum
#=> 26

# can alternatively be declared this way..
my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
#=> 26

# The expression above can be broken down like this:
# 1. Iteration 0: sum = 5 + 6 = 11
# 2. Iteration 1: sum = 11 + 7 = 18
# 3. Iteration 2: sum = 18 + 8 = 26

# We can also set a different initial value for the accumulator by directly passing in a value to the reduce
# method

my_numbers = [5, 6, 7, 8]

my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026

# another sample
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}

# What's going on with the sample above?
# We passed in a much more interesting initial value for our accumulator this time. When we pass in an argument to Hash.new, that
# becomes the default value when accessing keys that do not exist in the hash. For example, we could say the following:

hundreds = Hash.new(100)
hundreds["first"]         #=> 100
hundreds["mine"]          #=> 100
hundreds["yours"]         #=> 100

# Once you set the value for a key equal to something else, the default value is overwritten

hundreds = Hash.new(100)
hundreds["new"]           #=> 100
hundreds["new"] = 99
hundreds["new"]           #=> 99

# Now that we know that this new hash with a default value of 0 is our accumulator (which is called result in the code block), let's
# see what happens in each iteration:
# 1. Iteration 0:
#   - result ={}
#   - Remember, this hash already has default values of 0, so result["Bob's Dirty Burger Shack"] == 0 and result["St. Mark's Bistro"] == 0
# 2. Iteration 1:
#   - The method runs result["bob's Dirty Burger Shack"] += 1
#   - result = {"Bob's Dirty Burger Shack" => 1}
# 3. Iteration 2:
#   - The method runs result["St. Mark's Bistro"] += 1
#   - result = {"Bpb's Dirty Burger Shack" => 1, "St. Mark's Bistro" => 1}
# 4. Iteration 3:
#   - The method runs result["Bob's Dirty Burger Shack"] += 1
#   - result = {"Bob's Dirty Burger Shack" => 2, "St. Mark's Bistro" => 1}
# Note that this example returns a hash with several key => valye pairs. So even though the result is more complicated, #reduce
# still returns one object, a hash.



## Bang Methods ##
# Earlier, we mentioned that enumerables like #map and #select return new arrays but don't modify the arrays that they were called on.
# This is by design since we won't often want to modify the original arrary or hash and we don't want to accidentally
# lose that information.

# For example, if enumerables did mutate the original array, then using #select to filter out Brian from our invitation list would
# permanently remove him from our friends list. Whoa! That's a bit drastic. Brian may be a nutcase at parties, but he's still
# our friend.

# To see this principle in action, let's go back to an earlier example where we wrote each of our friends' names in all caps:

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

# You can see that when we call our original friends array again, it remains unchanged.
# If you wanted to change your friends array instead, you could use the bang method #map!:

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

# Now when we call our original friends array again, it returns the changed values from the #map! method. Instead of returnning a
# new array, #map! modified our original array.

# As you'll recall from the Methods lesson, bang methods can be easily identified by their exclamation marks (!) at the end of
# their name. All bang methods are destructive and modify the object they are called on. Many of the enumerable methods that
# return new versions of the array or hash they were called on have a bang method version available, such as #map! and #select!

# It's best practice to avoid using these methods, however, as you or a future developer working on your code may need the original
# version.



## Return values of enumerables ##
# So if it's not a good idea to use bang methods but we need to re-use the result of an enumerable method throughout our program,
# what can we do instead?

# One option is to put the result of an enumerable method into a local variable:
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends = friends.select { |friend| friend != 'Brian' }

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]

# An even better option would be to wrap your enumerable method in a method definition:
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends(friends)
 #=> ["Sharon", "Leo", "Leila", "Arun"]