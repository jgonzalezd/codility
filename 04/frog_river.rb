require 'test/unit'
require 'byebug'
require 'set'
include Test::Unit::Assertions

def solution(x, a)
  path = Set.new [*1..x]
  index = 0
  time = nil
  loop do
    path.delete(a[index])
    time = index if path.empty?
    index += 1
    break if path.empty? || a[index].nil?
  end
  return time ||= -1
end

a = [1,3,1,4,2,3,5,4]
assert_equal 6, solution(5, a)

a = [1,3,5,4,2,3,5,4]
assert_equal 4, solution(5, a)

a = [1,3,1,4,2,3,4]
assert_equal -1, solution(5, a)

a = [1,3]
assert_equal -1, solution(3, a)

a = [1]
assert_equal 0, solution(1, a)

a = []
assert_equal -1, solution(1, a)

a = [1,10000]
assert_equal 0, solution(1, a)

a = [1,2,10000]
assert_equal 1, solution(2, a)
