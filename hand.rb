require 'pry-byebug'
require 'pry-doc'

hand = gets.chomp.split("").sort!

pair = 0
three_card = 0
four_card = 0

if hand.include?("*")
  # 先頭のアスタリスク消す
  hand.shift

  # 手札が一枚になるまで繰り返す
  while hand.count > 1

    # 手札先頭の文字を基準点とする
    ref_point = hand.shift
    case hand.count(ref_point)
    when 0
      if pair == 0
        pair += 1
        hand.delete(ref_point)
      end
    when 1
      three_card += 1
      hand.delete(ref_point)
    when 2
      four_card += 1
      hand.delete(ref_point)
    end
  end
else
  # 手札が一枚になるまで繰り返す
  while hand.count > 1

    # 先頭の文字を基準点とする
    ref_point = hand.shift
    case hand.count(ref_point)
    when 0
      hand.delete(ref_point)
    when 1
      pair += 1
      hand.delete(ref_point)
    when 2
      three_card += 1
      hand.delete(ref_point)
    when 3
      four_card += 1
      hand.delete(ref_point)
    end
  end
end

result = "result comes here"
if four_card == 1
  "FourCard"
elsif three_card == 1
  "ThreeCard"
elsif pair == 2
  "TwoPair"
elsif pair == 1
  "OnePair"
else
  "NoPair"
end

puts result



result = ## ここに結果入れる。ロジックで

# def check_your_hand
#   ref_point = self.shift
#   self.length.times do |index|
#
#   end
#
#   self.include?(ref_point)
# end
