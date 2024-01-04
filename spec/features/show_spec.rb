require "rails_helper"

RSpec.describe "The Show Page" do
  before(:each) do
    @user = User.create!(username: "DreamyDani", email: "dani@test.com", password: "password123")

    visit user_path(@user)
  end

  it "has an option to create a new dream journal entry" do
    expect(page).to have_button("New Entry")
  end

  it "when I click on the button to create a new entry, I am taken to a form where I can enter a dream journal entry" do
    click_button("New Entry")

    expect(current_path).to eq(new_dream_path)

    expect(page).to have_field("Title")
    expect(page).to have_field("Date of Dream")
    expect(page).to have_field("Private?")
    expect(page).to have_field("Favorite")
    expect(page).to have_field("Dream Content")
    expect(page).to have_field("Additional Insights")
  end

  it "I can create a dream journal entry" do
    click_button("New Entry")

    
  end
end