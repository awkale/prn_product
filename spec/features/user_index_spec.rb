require 'rails_helper'

feature 'User index page', :devise do
  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user, :user_internal)
    login_as(user, scope: :user_internal)
    visit users_path
    expect(page).to have_content user.email
  end
end