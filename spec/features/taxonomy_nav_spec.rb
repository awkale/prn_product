require 'rails_helper'

feature "visiting the recipients section" do
  scenario "the visitor sees sub nav" do
    visit recipients_path
    expect(page).to have_text("Industries Subjects Categories")
  end
end