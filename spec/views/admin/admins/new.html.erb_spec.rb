require 'rails_helper'

RSpec.describe "admin/admins/new", type: :view do
  before(:each) do
    assign(:admin_admin, Admin::Admin.new(
      email: "MyString",
      password: "MyString"
    ))
  end

  it "renders new admin_admin form" do
    render

    assert_select "form[action=?][method=?]", admin_admins_path, "post" do

      assert_select "input[name=?]", "admin_admin[email]"

      assert_select "input[name=?]", "admin_admin[password]"
    end
  end
end
