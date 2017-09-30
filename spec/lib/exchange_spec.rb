require 'spec_helper'
require './lib/exchange'


describe Currency do
  it 'The API returns a number.' do
    json = JSON.parse(File.read('./spec/fixtures/currency_list.json'))
    currency, currency_destinations = json['currency_list'].sample(2)
    value = rand(1..999)
    result = Currency.exchange currency, currency_destinations, value

    expect(result.is_a? Numeric).to eql(true)
    expect(result > 0).to eql(true)
  end
end