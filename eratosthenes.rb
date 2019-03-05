#!/usr/bin/ruby
=begin
Script that generates all prime number within a set.
Execute the script from command line:
./eratosthenes.rb set_end_number
The method used is the Sieve of Eratosthenes:
Starting from the first prime number (2) delete from set all its multiples.
Continue until you find a prime whose square is bigger than the
set_end_number.
=end

require 'set'
set_end_number = ARGV[0].to_i
if set_end_number < 2
  puts 'Please give a number greater than 1 as an argument.'
  exit
end
nums = (2..set_end_number).to_set
nums.each do |n|
  if n*n > set_end_number
    break
  end
  (2*n..set_end_number).step(n).each do |p|
    nums.delete(p)
  end
end
puts "The numbers between 2 and #{ARGV[0]} which are prime are:"
puts *nums.to_a.join(',')

