require 'rails_helper'

RSpec.describe "admin/admins/show", type: :view do
  before(:each) do
    @admin_admin = assign(:admin_admin, Admin::Admin.create!(
      email: "Email",
      password: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
  end
end
