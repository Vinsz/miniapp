require 'rails_helper'

RSpec.describe "favorites/show", type: :view do
  before(:each) do
    @favorite = assign(:favorite, Favorite.create!(
      :list => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
