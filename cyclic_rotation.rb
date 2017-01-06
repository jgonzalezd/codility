require 'benchmark'
require 'byebug'
require 'test/unit'
include Test::Unit::Assertions
# [0,1]
# [1,0] n= 1
# [0,1] n= 2

# [0,1,2]
# [2,1,0] n=1

# [0,1,2]         1         2         3
# [0,1,2] n= 3 [2,0,1] | [1,2,0] | [0,1,2]

# [0,0,0,0,0,0,1,1,1,1]
# [1,1,1,0,0,0,0,0,0,1]
# [0,0,0,0,0,1,1,1,1,0]

def solution(array_a, k)
  return array_a if array_a.size < 2 || k % array_a.size == 0
  k = k % array_a.size  if k > array_a.size
  first_half = array_a.size-k
  array_b = array_a[(first_half..array_a.size-1)]+array_a[(0..first_half-1)]
end
def solution2(a, k)
  length = a.length
  result = Array.new length
  length.times {|i| result[(i + k)] = a[1] }
  result
end
array1 = Array.new(10){ rand(-1000..-1000) }
array2 = Array.new(100){ rand(-1000..-1000) }
array3 = Array.new(1000){ rand(-1000..-1000) }
array4 = Array.new(10000){ rand(-1000..-1000) }
array5 = Array.new(100000){ rand(-1000..-1000) }
array6 = Array.new(1000000){ rand(-1000..-1000) }
Benchmark.bm do |bm|
  bm.report { solution(array1,99) }
  bm.report { solution2(array1,99) }
  p '----------------------------'
  bm.report { solution(array2,99) }
  bm.report { solution2(array2,99) }
  p '----------------------------'
  bm.report { solution(array3,99) }
  bm.report { solution2(array3,99) }
  p '----------------------------'
  bm.report { solution(array4,99) }
  bm.report { solution2(array4,99) }
  p '----------------------------'
  bm.report { solution(array5,99) }
  bm.report { solution2(array5,99) }
  p '----------------------------'
  bm.report { solution(array6,999999) }
  bm.report { solution2(array6,999999) }
  p '----------------------------'
end


#
# a_small = Array.new(rand(0..2)){ rand(-1000..-1000) }
# assert_equal a_small.rotate(-4), solution(a_small,-4)
