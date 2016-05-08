require 'rails_helper'

feature "visiting the homepage" do
  scenario "the visitor sees welcome text" do
    visit root_path
    expect(page).to have_text("In order for your message to create the greatest possible impact, it must reach the right people at the right time, in the right place, in the way they want to receive it. That’s why PR Newswire has developed the most creative and extensive news distribution network in the business.")
  end
end