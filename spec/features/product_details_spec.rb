require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "They see details of an individual product" do
    # ACT
    visit root_path
    first('article.product a').click

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_css 'section.products-show'
  end

end
