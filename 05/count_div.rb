require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(a, b, k)
  if k > b
    if b == 0
      return 1
    else
      return 0
    end
  end
  a == 0 ? times = 1 : times = 0
  upper = b/k
  times += upper
  if a > k
    lower = (a-1)/k
    times -= lower
  end
  times
end

assert_equal 6, solution(0,10,2)
assert_equal 8, solution(0,14,2)
assert_equal 2, solution(0,2,2)
assert_equal 3, solution(6,11,2)
assert_equal 2, solution(7,10,2)
assert_equal 2, solution(1000000,1500000,500000)
assert_equal 4, solution(300,1000,200)
assert_equal 1001, solution(0,2000000000,2000000)
