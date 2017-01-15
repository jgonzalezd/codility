require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(n)
  n.to_s(2).reverse.to_i.to_s.split('1').map(&:size).max || 0
end

assert_equal 5, solution(1041)
