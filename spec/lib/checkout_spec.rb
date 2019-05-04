require './lib/item'
require './lib/promo'
require './lib/checkout'

describe Checkout do
  let(:item1) { Item.new(code: '001', name: 'Lavender heart', price: 9.25) }
  let(:item2) { Item.new(code: '002', name: 'Personalised cufflinks', price: 45.00) }
  let(:item3) { Item.new(code: '003', name: 'Kids T-shirt', price: 19.95) }
  let(:promotional_rules) do
    [
      Promo::Lavender,
      Promo::Promo10
    ]
  end
  subject { described_class.new(promotional_rules) }

  it 'calculate promotion for 001,002,003' do
    subject.scan(item1)
    subject.scan(item2)
    subject.scan(item3)

    expect(subject.total).to eq(66.78)
  end

  it 'calculate promotion for 001,003,001' do
    subject.scan(item1)
    subject.scan(item3)
    subject.scan(item1)

    expect(subject.total).to eq(36.95)
  end

  it 'calculate promotion for 001,002,001,003' do
    subject.scan(item1)
    subject.scan(item2)
    subject.scan(item1)
    subject.scan(item3)

    expect(subject.total).to eq(73.76)
  end
end
