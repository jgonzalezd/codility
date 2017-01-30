require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(m, p)
  coins = [1, 0.5, 0.25, 0.1, 0.05, 0.01]
  change = m - p
  result = []
  coins.each do |coin|
    sum = 0
    while change.round(3) >= coin  do
      change -= coin
      sum += coin
    end
    result << sum
  end
  result.reverse.map do |e|
    e < 1 ? (e * 100).to_i : e
  end
end

assert_equal [1,0,0,0,0,4], solution(5, 0.99)
