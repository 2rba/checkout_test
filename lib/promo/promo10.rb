class Promo::Promo10 < Promo
  def apply(prices)
    return prices if @items.sum(&:price) <= 60

    prices.map do |price|
      price * 0.9
    end
  end
end
