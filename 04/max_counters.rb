require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(n,a)
  counters = Hash.new(0)
  a.each do |val|
    # byebug
    if val >= 1 && val <= n
      counters[val] += 1
    elsif val == n+1
      counters = Hash.new(counters.values.max || counters[0])
    end
  end
  res = []
  1.upto(n) do |index|
    res << counters[index]
  end
  res
end

a = [3,4,4,6,1,4,4]
assert_equal [3, 2, 2, 4, 2], solution(5,a)

a = Array.new(100_000,1)
assert_equal [100_000], solution(1,a)

a = Array.new(100_000,1) + Array.new(100_000,2)
assert_equal [100_000, 100_000], solution(2,a)

a = Array.new(100_000,1) + [3]
assert_equal [100_000, 100_000], solution(2,a)

a = [1,1,1]
assert_equal [3], solution(1,a)

a = [2, 1, 1, 2, 1]
assert_equal [3], solution(1,a)
