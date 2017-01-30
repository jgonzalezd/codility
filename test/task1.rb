# A non-empty zero-indexed array A consisting of N integers is given.
# We say that a pair of identical elements (P, Q), where 0 ≤ P < Q < N, is passing when P and Q have the same value.

# Write a function:
#
# def solution(a)
# that, given a non-empty zero-indexed array A of N integers, returns the number of identical pairs.
# Example:

# A[0] = 3
# A[1] = 5
# A[2] = 6
# A[3] = 3
# A[4] = 3
# A[5] = 5

# will have the following identical pairs (0,3), (0,4), (1,5), (3,4)
# notice that (2,2) is not an identical pair neither is (5,1)

# Assume that:
#
# N is an integer within the range [-1_000_000_000 .. 1_000_000_000];

#SUBMITTED SOLUTION:
require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(a)
  u = Hash.new
  a.each_with_index do |e, index|
    u[e] ||= [] unless u.keys.include?(e)
    u[e] << index
  end
  total = 0
  max = 1e9.to_i
  u.each do |k, v|
     total += ((v.size - 1))*((v.size - 1) + 1)/2
     return max if total > max
  end
  total
end

assert_equal 4, solution([3,5,6,3,3,5])
assert_equal 4, solution([-1000000000,5,6,-1000000000,-1000000000,5])
assert_equal 4, solution([1000000000,5,6,1000000000,1000000000,5])
assert_equal 1e9.to_i, solution(Array.new(1e5.to_i, 1))
assert_equal 49995000, solution(Array.new(1e4.to_i, 1))

# Process
# 2.2.6 :005 > u.each {|k,v| v.size }
#  => {3=>[0, 3, 4], 5=>[1, 5], 6=>[2]}

# [2] => 0
# [1, 5] => 1
# [0, 3, 4] => 2+1= 3
# [0, 3, 4, 8] = 3+2+1 = 6
# [0, 3, 4, 8, 12] => 4+3+2+1 = 10

# The sum of integers between 1 and n is called a triangular number, and is equal to n*(n+1)/2.


# The sum of integers between n and m is:
# the triangular number of m minus the triangular number of  n-1,
# which is equal to m*(m+1)/2-n*(n-1)/2, and can be written (m-n+1)*(m+n)/2
# this means (range.max-range.min+1)*(range.max+range.min)/2


# test/task1.rb:13:in `block in solution':
  # undefined method `sum' for 1..2:Range (NoMethodError)

### How to improve it? (If I would have had more time)

def solution(a)
  u = Hash.new(0)
  a.each { |e, index| u[e] +=1  }
  total = 0
  max = 1e9.to_i
  u.each do |k, v|
     total += ((v - 1))*((v - 1) + 1)/2
     break if total > max
  end
  total
end

assert_equal 4, solution([3,5,6,3,3,5])
assert_equal 4, solution([-1000000000,5,6,-1000000000,-1000000000,5])
assert_equal 4, solution([1000000000,5,6,1000000000,1000000000,5])
assert_equal 1e9.to_i, solution(Array.new(1e9.to_i, 1))
assert_equal 49995000, solution(Array.new(1e4.to_i, 1))
