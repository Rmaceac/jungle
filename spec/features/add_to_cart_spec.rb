require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel4.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Add an item to their cart" do
    # ACT
    visit root_path
    click_button("Add", match: :first)

    # DEBUG / VERIFY
    # save_screenshot
    # puts page.html

    expect(page).to have_text 'My Cart (1)', count: 1
  end
end
