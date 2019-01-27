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