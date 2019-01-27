=begin
  Author: Junwen He
  Date: 27/JAN/2019
  This is the stock picker solution to find out the best buy/sell
  profit based on the list of the prices.
  The idea of this solution is using nested iterators with a loop untill
  finished profit calculation.
  profit will be replaced once the new profit is higher than the previous one
  the buy and sell day will be found by the index of the list
  and stored in the array.
=end
def stock_picker(transcation_days)
  profit = day_buy = day_sell = 0
  day_list = transcation_days.clone
  loop do
    buy = transcation_days.shift
    transcation_days.each do |sell|
      earn = sell - buy
      if earn > profit
        profit = earn
        day_buy = day_list.index(buy)
        day_sell = day_list.index(sell)
      else
        next
      end
    end
    break if transcation_days.length == 0
  end
  best_decision = [day_buy, day_sell]
  print best_decision
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])