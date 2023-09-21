## Nested Collections ##

## Nested Arrays ##
test_scores = [
    [97,76,79,93],
    [79,84,76,79],
    [88,67,64,76],
    [94,55,67,81]
]

teacher_mailboxes = [
    ["Adams", "Baker", "Clark", "Davis"],
    ["Jones", "lewis", "Lopez", "Moore"],
    ["Perez", "Scott", "Smith", "Young"]
]

## Accessing elements ##
teacher_mailboxes[0][0]
#=> "Adams"
teacher_mailboxes[1][0]
#=> "Jones"
teacher_mailboxes[2][0]
#=> "Perez"

# You can also use negative indices to return elements from the end of an array,
# starting at [-1]
teacher_mailboxes[0][-1]
#=> "Davis"
teacher_mailboxes[-1][0]
#=> "Perez"
teacher_mailboxes[-1][-2]
#=> "Smith"

# If you try to access an index of a nonexistent nested element, it will raise an NoMethodError,
# because the nil class does not have a [] method. However, just like a regular array, if you try
# to access a nonexistent index inside of an existing nested element, it will return nil

teacher_mailboxes[3][0]
#=> NoMethodError
teacher_mailboxes[4][0]
#=> nil

# If you want a nil value returned when trying to access an index of a nonexistent nested element,
# you can use the #dig method. This method can also be used when accessing a nonexistent index
# inside of an existing nested element.

teacher_mailboxes.dig(3,0)
#=> nil
teacher_mailboxes.dig(0,4)



## Creating a new nested array ##
mutable = Aray.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] =1000
#=> 1000
mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]

# Changing the value of the first element in the first nested array, causes the first element
# to change in all three nested arrays! This same behavior will happen with strings, hashes, or
# any other mutable objects.



## Adding and Removing elements ##

# You can add another element to the end of nested array using the #push method or the shovel
# operator `<<`. If you want to add an element to a specific nested array, you will need to
# specify the index of the nested array

test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
test_scores
#=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]

# Using this similar syntax, you can add or remove elements from the entire nested array or
# from a specific nested element

test_scores.pop
#=> [100, 99, 98, 97]
test_scores[0].pop
#=> 100
test_scores
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]



## Iterating over a nested array ##

teacher_mailboxes.each_with_index do |row, row_index|
    puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

# To iterate over the individual elements inside of each row, you will need to nest another
# enumerable method inside.

teacher_mailboxes.each_with_index do |row, row_index|
    row.each_with_index do |teacher, column_index|
        puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
    end
end
#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

# Although these examples are a bit contrived, it is important to note that if we only need
# each teacher's name it would be beneficial to use #flatten before iterating

teacher_mailboxes.flatten.each do |teacher|
    puts "#{teacher} is amazing"
end
#=> Adams is amazing!
#=> Baker is amazing!
#=> Clark is amazing!
#=> Davis is amazing!
#=> Jones is amazing!
#=> Lewis is amazing!
#=> Lopez is amazing!
#=> Moore is amazing!
#=> Perez is amazing!
#=> Scott is amazing!
#=> Smith is amazing!
#=> Young is amazing!
#=> ["Adams", "Baker", "Clark", "Davis", "Jones", "Lewis", "Lopez", "Moore", "Perez", "Scott", "Smith", "Young"]

# Now let's take a look at a more complicated example of nesting two predicate enumerables together.
# Using the above nested array of test scores, let's determine if any student scored higher than
# 80 on everything

test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end
#=> false

# This seems pretty straight-forward. It returns false, because none of the nested arrays have
# scores that are all over 80. What do you think will happen if we switch #any? and #all?
# Do you think we will get the same results?

test_scores.all? do |scores|
    scores.any? { |score| score > 80}
end

# The results are different, because now it is determining if all of the nested arrays contain
# any number over 80. This returns true, because each of the nested arrays have at least one
# number over 80.



## Nested hashes ##

# The hashes that you've seen so far have single key/value pairs. However, just like arrays,
# they can be nested, or multidimensional. nested hashes are a very common way to store
# complex associated data.

vehicles = {
    alice: {year: 2019, make: "Toyota", model: "Corolla"},
    blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
    caleb: {year: 2020, make: "Honda", model: "Accord"}
}



## Accessing data ##
# Accessing a specific element in a nested hash is very similar to a nested array. It is as
# simple as calling hash[:x][:y], where :x is the key of the hash and :y is the key of the
# nested hash.

vehicles[;alice][:year]
#=> 2019
vehicles[:blake][:make]
#=> "Volkswagen"
vehicles[:caleb][:model]
#=> "Accord"

# Similar to nested arrays, if you try to access a key in a nonexistent nested hash, it will
# raise an `NoMethodError`, therefore you may want to use the `#dig` method. As expected,
# if you try to access a nonexistent key in an existing nested hash, it will return nil.

vehicles[:zoe][:year]
#=> NoMethoderror
vehicles.dig(:zoe, :year)
#=> nil
vehicles[:alice][:color]
#=> nil
vehicles.dig(:alice, :color)
#=> nil



## Adding and removing data ##
# You can add more nested hashes, just like a regular hash. Let's say Dave just bought a
# new vehicle and we want to add it to the list.

vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
#=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

# You can also add an element to one of the nested hashes. Let's say that Dave really loves
# his new Escape and thinks we should keep track of the color of the vehicles. To add a new key/value
# pair to a nested hash, specify the key of the nested hash right before naming the new key.

vehicles[;dove][:color] = "red"
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

# Deleting one of the nested hashes will be just like a regular hash. Let's say Blake has decided
# to sell his Beetle and backpack across Europe. So, let's delete Blake's car

vehicles.delete(:blake)
#=> {:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

# To delete one of the key/value pairs inside of a nested hash, you first specify the key of
# the hash. Let's say Dave decided that we don't need to specify the color of his vehicle. Therefore,
# we specify vehicles[:dave] before we indicate the key of the nested hash to delete

vehicles[:dave].delete(:color)
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}



## Methods ##
# There are many helpful methods to use with nested hashes. Once you know what data you need from
# a nested hash, you might find that browsing through the documentation and experimenting
# with them in IRB is the best way for you to understand how they work.

# Let's look at an example using the vehicles nested hash. Let's say that we want to know who owns
# vehicles that are from 2020 or newer. At first glance in the documentation, it looks like
# #select would be a great method to use.

vehicles.select { |name, data| data[:year] >= 2020 }
#=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

# Yes, using #select gives us the information that we need. However, what if we only want the names
# of the owners and not another nested hash. let's keep looking through the documentation to see
# what else we find. The #collect method sounds very useful for this situation. Let's collect
# the names if the year is 2020 or newer.

vehicles.collect { |name, data| name if data[:year] >= 2020 }
#=> [nil, :caleb, :dave]

# Using #collect gets us a lot closer to only having the names of the new vehicle owners. If
# you look at this method in the documentation, you will see that #collect and #map have the same
# functionality. Both of these methods use the return value of each iteration, so when the
# if statement is false, it will return a nil value.

# Nil values can cause problems down the road, so let's look through the documentation
# to see if we can find a method to help solve this problem. the #compact method returns
# an array (or hash) without nil values, so let's chain it on the end of the block.

vehicles.collect { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]

# Yes, using #collect and #compact returns the data that we want. As you can see, chaining
# methods can be very useful. However, if we continue exploring the documentation, we will
# find another method that combines the functionality of these two methods.

# Ruby version 2.7 added a new enumerable method called #filter_map that sounds
# very useful for this situation.

vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]