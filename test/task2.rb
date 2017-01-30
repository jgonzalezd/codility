# A string S consisting only of letters "A", "B" and "C" is given. This string can be transformed according to one of the following rules:
#
# substitute some occurrence of "AB" with "AA",
# substitute some occurrence of "BA" with "AA",
# substitute some occurrence of "CB" with "CC",
# substitute some occurrence of "BC" with "CC",
# substitute some occurrence of "AA" with "A",
# substitute some occurrence of "CC" with "C".
# As long as it is possible to transform the string, a rule is picked at random and the string is transformed according to that rule.
#
# Write a function:
#
# function solution(S);
# that, given a string S consisting of N characters, returns any string that can result from a sequence of transformations as described above.
#
# For example, given string S = "AABBCC" the function may return "AC" because this is one of the possible sequences of transformations:
#
# "AABBCC" becomes "AAABCC" (rule 1);
# "AAABCC" becomes "AABCC" (rule 5);
# "AABCC" becomes "AACCC" (rule 4);
# "AACCC" becomes "AACC" (rule 6);
# "AACC" becomes "ACC" (rule 5);
# "ACC" becomes "AC" (rule 5);
# no further rule can be applied.
# Assume that:
#
# the length of S is within the range [0..100,000];
# string S consists only of the following characters: "A", "B" and/or "C".
# Complexity:
#
# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N) (not counting the storage required for input arguments).

#SUBMITTED SOLUTION
require 'test/unit'
require 'byebug'
include Test::Unit::Assertions

def solution(s)
  str = s
  rules = { 'AB'=> 'AA',
            'BA' => 'AA',
            'CB'=> 'CC',
            'BC' => 'CC',
            'AA' => 'A',
            'CC'=> 'C'}

  loop do
    applied_rule = false
      rules.each do |k,val|
        prev = str.dup
        str.gsub!(k,val)
        applied_rule = true if prev != str
      end
    break unless applied_rule
  end
  str
end

assert_equal "AC", solution("ABBCC")
assert_equal "AC", solution("ABBCCCC")
assert_equal "AC", solution("AABBCCCC")
assert_equal "A", solution("AABBBBBBBBBBB")
assert_equal "AC", solution("AACBBB")


### How to improve it? (If I would have had more time)


def solution(s)
  s.gsub(/A+B+|B+A+|A+/,'A').gsub(/B+C+|C+B+|C+/,'C')
end

assert_equal "AC", solution("ABBCC")
assert_equal "AC", solution("ABBCCCC")
assert_equal "AC", solution("AABBCCCC")
assert_equal "A", solution("AABBBBBBBBBBB")
assert_equal "AC", solution("AACBBB")
assert_equal "ACA", solution("AACBBBA")
assert_equal "CAC", solution("CBBBACC")
