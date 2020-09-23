require 'rails_helper'

RSpec.feature "UserLoginSpecs", type: :feature, js:true do
  before :each do
    User.create!(first_name: "First", last_name: "Last", email: "test@email.com", password: "12345", password_confirmation: "12345")
  end

  scenario "An registered user logs in" do
    visit '/'
    page.find('nav.navbar').click_link('Login')
    expect(page).to have_content('User Login')
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: '12345'
    click_on 'Submit'
    expect(page.find('nav.navbar')).to have_content('Logout')
    save_screenshot
  end

end
