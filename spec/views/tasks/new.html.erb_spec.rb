require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :list => nil,
      :text => "MyString",
      :active => false
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_list_id[name=?]", "task[list_id]"

      assert_select "input#task_text[name=?]", "task[text]"

      assert_select "input#task_active[name=?]", "task[active]"
    end
  end
end
