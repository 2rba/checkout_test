class Promo::Lavender < ::Promo
  def apply(prices)
    lavender_count = @items.select { |item| item.code == '001' }.count
    return prices if lavender_count < 2

    @items.map.with_index do |item, i|
      price = prices[i]
      if item.code == '001'
        8.50
      else
        price
      end
    end
  end
end
