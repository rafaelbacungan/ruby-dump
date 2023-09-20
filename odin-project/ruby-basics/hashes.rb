## Hashes ##

# Arrays vs Hashes
# Think of objects in javascript

## Creating hashes ##
my_hash = {
    "a random word" => "ahoy",
    "Dorothy's math test score" => 94,
    "an array" => [1,2,3],
    "an empty hash within a hash"
}

my_hash = Hash.new
my_hash #=> {}

# Hashes don't only take strings as keys and values. Ruby is a pretty flexible language,
# so you can jam any old thing in there and it'll work just fine.
hash = { 9 => "nine", :six => 6}

## Accessing Values ##
shoes = {
    "summer" => "sandals",
    "winter" => "boots"
}

shoes["summer"] #=> "sandals"
shoes["hiking"] #=> nil

shoes.fetch("hiking") #=> KeyError: key not found: "hiking"

# Alternatively, this method can return a default value instead of raising an error if the
# given key is not found
shoes.fetch("hiking", "hiking boots") #=> "hiking boots"


## Adding and changing data ##
shoes["fall"] = "sneakers"
shoes #=> {"summer" => "sandals", "winter"=>"boots", "fall"=>"sneakers"}

shoes["summer"] = "flip-flops"
shoes     #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}

## Removing data ##
shoes.delete("summer") #=> "flip-flops"
shoes #=> {"winter"=>"boots", "fall"=>"sneakers"}

## Methods ##
books = {
    "Infinite Jest" => "David Foster Wallace",
    "Into the Wild" => "Jon Krakauer"
}

books.keys #=> ["Infinite Jest", "Into the Wild"]
books.values #=> ["David Foster Wallace", "John Krakauer"]

## Merging two hashes ##
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2) #=> { "a" => 100, "b" => 254, "c" => 300}

## Symbols as hash keys ##

# 'Rocket' syntax
american_cars = {
    :chevrolet => "Corvette",
    :ford => "Mustang",
    :dodge => "Ram"
}

# 'Symbols' syntax
japanese_cars = {
    honda: "Accord",
    toyota: "Corolla",
    nissan: "Altima"
}

# When you use the cleaner 'symbols' syntax to create a hash, you'll still need to use
# the standard symbol syntax when you're trying to access a value. In other words, regardless of
# which of the above two syntax options you use when creating a hash, they both create symbol keys
# that are accessed the same way
american_cars[:ford]
japanese_cars[:honda]