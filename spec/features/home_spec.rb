require 'spec_helper'

RSpec.describe "Currency conversion process", type: :feature do
  
  it 'Exchange value' do
    visit '/'
    within('#exchange_form') do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
    end 
    click_button 'Converter'

    expect(page).to have_content('vale')
  end

end