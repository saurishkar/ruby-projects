def stock_picker(prices)
  pair = []
  max = prices[1] - prices[0]
  0.upto(prices.length - 2) do |b_d|
    (b_d + 1).upto(prices.length - 1) do |s_d|
      diff = prices[s_d] - prices[b_d]
      if diff > max
        max = diff
        pair = [b_d, s_d]
      end
    end
  end
  pair.to_s
end
