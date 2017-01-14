require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(a)
  positives = a.select{|e| e > 0}.uniq.sort!
  return 1 if positives.size == 0

  1.upto(positives.max + 1) do |index|
    return index unless index == positives[index-1]
  end
end

a = []
assert_equal 1, solution(a)

a = [0]
assert_equal 1, solution(a)

a = [1]
assert_equal 2, solution(a)

a = [0,3]
assert_equal 1, solution(a)

a = [1,3]
assert_equal 2, solution(a)

a = [0,1,2,3,5]
assert_equal 4, solution(a)

a = [0,-1,2,3,5]
assert_equal 1, solution(a)

a = [0,-1,-2,-3,-5]
assert_equal 1, solution(a)

a = [-1,-1,-2,-3,-5]
assert_equal 1, solution(a)
