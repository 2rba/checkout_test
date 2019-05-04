class Promo
  def initialize(items)
    @items = items
  end

  def apply(prices)
    raise 'abstract'
  end
end

require 'promo/promo10'
require 'promo/lavender'
