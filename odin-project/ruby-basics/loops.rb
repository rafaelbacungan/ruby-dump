## Loops ##
i = 0
loop do
    puts "i is #{i}"
    i += 1
    break if i == 10
end

## While loops ##
i = 0
while i < 10 do
    puts "i is #{i}"
    i += 1
end

while gets.chomp != "yes" do
    puts "Will you go to prom with me?"
end

## Until loops ##
# Opposite of the while loop.
# An until loop continues for as long as the condition is false.

i = 0
until i >= 10 do
    puts "i is #{i}"
    i += 1
end

until gets.chomp == "yes" do
    puts "Do you like Pizza?"

## Ranges ##
(1..5) # inclusive range: 1,2,3,4,5
(1...5) # exclusive range: 1,2,3,4

# we can make ranges of letters, too!
('a'..'d') # a,b,c,d


## For loop ##
for i in 0..5
    puts "#{i} zombies incoming!"
end

## Times loop ##
# if you need to run a loop for a specified number of times
5.times do
    puts "Hello, World!"
end

5.times do |number|
    puts "Alternative fact number #{number}"
end

## Upto and Downto loops ##
# if you need to step through a series of numbers or letters within a specific range, use these

5.upto(10) { |num| print "#{num} " } #=> 5,6,7,8,9,10
10.downto(5) { |num| print "#{num} "} #=> 10,0,8,7,6,5