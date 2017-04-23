require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :list => nil,
      :text => "MyString",
      :active => false
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_list_id[name=?]", "task[list_id]"

      assert_select "input#task_text[name=?]", "task[text]"

      assert_select "input#task_active[name=?]", "task[active]"
    end
  end
end
