require 'pry'
class Bottles
  def song
    verses(99,0)
  end

  def verses(start, finish)
    start.downto(finish).reduce('') { |out,n| out << verse(n) << "\n" }.chomp
  end

  def verse(n)
    <<~END_OF_STR
      #{first_line(n)}
      #{n == 0 ? go_buy_more_line : second_line(n)}
    END_OF_STR
  end

  private

  def first_line(n)
    <<~END_OF_STR.chomp
      #{count(n).capitalize} #{bottle_or_bottles(n)} of beer on the wall, \
      #{count(n)} #{bottle_or_bottles(n)} of beer.
    END_OF_STR
  end

  def second_line(n)
    <<~END_OF_STR.chomp
      Take #{one_or_it(n)} down and pass it around, \
      #{count(n-1)} #{bottle_or_bottles(n-1)} of beer on the wall.
    END_OF_STR
  end

  def go_buy_more_line
    <<~END_OF_VERSE.chomp
      Go to the store and buy some more, \
      99 bottles of beer on the wall.
    END_OF_VERSE
  end

  def one_or_it(n)
    n == 1 ? 'it' : 'one'
  end

  def bottle_or_bottles(n)
    n == 1 ? 'bottle' : 'bottles'
  end

  def count(n)
    n == 0 ? 'no more' : n.to_s
  end
end
