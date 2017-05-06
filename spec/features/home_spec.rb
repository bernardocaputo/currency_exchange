require 'rails_helper'

RSpec.describe "Exchange Currency Process", :type => :feature do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
    end
    

    save_and_open_page
    expect(page).to have_content("value")
  end

  xit "switch currencies" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
    end
    click_button 'switch currency'

    save_and_open_page

    expect(page).to have_select('currency', selected: 'USD')
    expect(page).to have_select('currency_destination', selected: 'EUR')
  end


end
