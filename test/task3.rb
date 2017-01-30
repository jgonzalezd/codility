require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(s, p, q)
  results = []
  p.size.times do |index|
    min = p.shift
    max = q.shift
    substr = s[min..max].freeze
    results << if substr.include? 'A'
      1
    elsif substr.include? 'C'
      2
    elsif substr.include? 'G'
      3
    else
      4
    end
  end
  results
end

# assert_equal [2,4,1], solution('CAGCCTA',[2,5,0],[4,5,6])
# assert_equal [2,2,2], solution('C',[0,0,0],[0,0,0])

str = Array.new(100_000, 'A').join
assert_equal [1,1,1], solution(str,[80_000,0,10_000],[99_000,50_000,30_000])
