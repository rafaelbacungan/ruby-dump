## Predicate Enumerable Methods ##

# As you recall from the Methods lesson that a predicate method is indicated by a
# question mark (?) at the end of the method name and returns either `true` or `false`.

## The include? method ##
# The #include? method works exactly like you think it should. If we want to know whether a
# particular element exists in an array, we can use the #include? method.

numbers = [5,6,7,8]
element = 6
result = false

numbers.each do |number|
    if number == element
        result = true
    end
end

result
# => true

element = 3
result = false

numbers.each do |number|
    if number == element
        result = true
    end
end

result
#=> false

# Using #include?, this code can be greatly simplified:
numbers = [5,6,7,8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false

# Another example
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')
#=> false



## The any? method ##

# You might also be able to guess what the #any? method does. It returns true if any
# elements in your array or hash match the condition within the block; otherwise, it will
# return false

# let's say we want to see if there is any number greater than 500 or less than 20 in an
# array of numbers. First, let's see how we could achieve this using #each.

numbers = [21,42,303,499,550,811]
result = false

numbers.each do |number|
    if number > 500
        result = true
    end
end

result
#=> true

numbers = [21,42,303,499, 550, 811]
result = false

numbers.each do |number|
    if number < 20
        result = true
    end
end

result
#=> false

# Using #any?, this code can be greatly simplified:
numbers = [21,42,303,499,550,811]

numbers.any? { |number| number > 500}
#=> true

numbers.any? { |number| number < 20 }
#=> false



## The all? method ##

# The `all?` method is also fairly intuitive. It only returns true if all the elements in your
# array or hash match the condition you set within the block; otherwise, it will return false.

# Let's say that we want to check whether all the words in our list are more than 6 characters long.
# First, let's see how we could achieve this using #each:
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
    if fruit.length > 3
        matches.push(fruit)
    end

    result = fruits.length == matches.length
end
# => true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
    if fruit.length > 6
        matches.push(fruit)
    end

    result = fruits.length == matches.length
end

result
#=> false

# Using #all?, this code can be greatly simplified
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false

# Special note to keep in mind while debugging #all? will return true by default unless the
# block returns false or nil. So if you call #all? on an empty array or hash (i.e., there are no
# elements for the block to evaluate), it will return true.

## The none? method ##
# As you might expect, #none? returns `true` only if the condition in the block matches
# none of the elements in your array or hash; otherwise, it returns false.

# First, let's see how this could be achieved using #each. You'll notice that this approach is
# very similar to what we did for #all?

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
    if fruit.length > 10
        matches.push(fruit)
    end

    result = matches.length == 0
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
    if fruit.length > 6
        matches.push(fruit)
    end

    result = matches.length == 0
end

result
#=> false

# Using #none?, this can be greatly simplified
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false