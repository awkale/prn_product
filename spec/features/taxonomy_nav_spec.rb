require 'rails_helper'

feature "visiting the recipients section" do
  scenario "the visitor sees sub nav" do
    user = FactoryGirl.create(:user, :admin_adv)
    login_as(user, scope: :user)
    visit recipients_path
    expect(page).to have_text("Industries Subjects Categories")
  end
end