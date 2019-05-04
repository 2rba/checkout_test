class Checkout
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @items = []
  end

  def scan(item)
    @items.push item
  end

  def total
    initial_prices = @items.map(&:price)
    promo_prices = promos.reduce(initial_prices) { |prices, promo| promo.apply(prices) }
    promo_prices.sum.round(2)
  end

  private

  def promos
    @promotional_rules.map { |klass| klass.new(@items) }
  end
end
