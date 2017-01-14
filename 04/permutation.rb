require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(a)
  return 0 unless a.uniq!.nil?
  return 0 unless a.max == a.size
  expected = 1.upto(a.max).reduce(:+)
  actual = a.reduce(:+)
  expected == actual ? 1 : 0
end

a = [4,1,3,2]
assert_equal 1, solution(a)

a = [4,1,3,2,5]
assert_equal 1, solution(a)

a = [4,3,2]
assert_equal 0, solution(a)

a = [1]
assert_equal 1, solution(a)

a = [2]
assert_equal 0, solution(a)

a = [1,2,1000000000]
assert_equal 0, solution(a)
