require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(a)
  primes = []
  (2..a).each do |index|
    counter = 0
    (2..index).each do |e|
      counter += 1 if index % e == 0
    end
    unless counter > 1
      primes << index
    end
  end
  primes.each do |e|
    estr = e.to_s
    primes.include? estr.split("").permutation(estr.size).to_a.map { |e| e.join.to_i }
    #check if primes contains all of [193, 139, 913, 931, 319, 391]
    # if it does e is a circular array, count it.
  end

  primes.count
end

assert_equal 13, solution(100)
