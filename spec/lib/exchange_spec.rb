require 'spec_helper'
require './lib/exchange'

describe Currency do
  it "exchange" do
    json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))  # parse transforma o resultado em javascript object ou transforma em hash?
    currency, currency_destination = json['currency_list'].sample(2) # dá a cada variável um sample
    quantity = rand(1..9999)

    value = Currency::exchange currency, currency_destination, quantity
    expect(value.is_a? Numeric).to eql(true)
    expect(value != 0).to eql(true)
  end
end
