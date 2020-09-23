require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
  
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "A visitor adds aproduct to their cart." do
    visit '/'
    first('article.product').find_button('Add').click
    page.find('nav.navbar').click_link('My Cart (1)')
    expect(page).to have_content('TOTAL:')
    save_screenshot
  end
end
