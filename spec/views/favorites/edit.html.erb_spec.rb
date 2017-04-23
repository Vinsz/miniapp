require 'rails_helper'

RSpec.describe "favorites/edit", type: :view do
  before(:each) do
    @favorite = assign(:favorite, Favorite.create!(
      :list => nil,
      :user => nil
    ))
  end

  it "renders the edit favorite form" do
    render

    assert_select "form[action=?][method=?]", favorite_path(@favorite), "post" do

      assert_select "input#favorite_list_id[name=?]", "favorite[list_id]"

      assert_select "input#favorite_user_id[name=?]", "favorite[user_id]"
    end
  end
end
