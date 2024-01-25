def stock_picker(price_array)
    # price_sell_array = Array.new(price_array)
    dict = Hash.new
    price_array.each_with_index do |price_buy ,date_buy|
        price_array[date_buy+1..-1].each_with_index do |price_sell ,gap_date|
            date_sell = date_buy + gap_date + 1
            profit = price_sell - price_buy
            if profit > 0
                buy_sell_display = "buy at #{price_buy} in day #{date_buy+1}, Sell at #{price_sell} in day #{date_sell+1}"
                dict[buy_sell_display] = profit
            end
            # puts "#{price_buy} #{date_buy} #{price_sell} #{date_sell}"
        end
    end
    wanted_date_price = dict.max_by { |date ,price| price}
    buy_sell_display = wanted_date_price.first
    price = wanted_date_price.last
    puts "#{buy_sell_display} for #{price}$ profit "
    # puts dict
end
stock_picker([15,3,6,9,15,8,6,1,30])
