require 'test/unit'
include Test::Unit::Assertions

def solution(a)
  # write your code in Ruby 2.2
  part_one = 0
  total = a.inject(:+)
  min = nil
  a.first(a.size-1).each_with_index do |val, i|
    part_one += val
    part_two = total - part_one
    diff = (part_one - part_two).abs
    min = diff if min.nil? || diff < min
  end
  min
end

a = [-1000, 1000]
assert_equal 2000, solution(a)

a = [-1000, 1000, 2]
assert_equal 2000, solution(a)
