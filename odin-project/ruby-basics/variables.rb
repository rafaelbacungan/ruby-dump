## Declaring a variable ##
age = 18 #=> 18
age = 18 + 5 #=> 23

age = 18
age #=> 18
age = 33
age #=> 33

age = 18
age #=> 18
age = age + 4
age #=> 22

age = 18
age += 4 #=> 22

age = 18
age -= 2  #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4

## How to name variables ##
a = 19
string = "John"

## bad
a = 19
string = "John"

## good
age = 19
name = "John"
can_swim = false


## Variables are references
desired_location = "Barcelona"
johns_location = desired_location

desired_location #=> "Barcelona"
johns_location #=> "Barcelona"

johns_location.upcase!  #=> "BARCELONA"

desired_location        #=> "BARCELONA"
johns_location          #=> "BARCELONA"