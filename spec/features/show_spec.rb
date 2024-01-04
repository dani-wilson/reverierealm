require "rails_helper"

RSpec.describe "The Show Page" do
  before(:each) do
    visit "/"

    click_link "Create an Account"

    expect(current_path).to eq(new_user_path)

    fill_in('Username', with: "DreamyDani")
    fill_in('Email', with: "dreams@test.com")
    fill_in('Password', with: "password123")
    fill_in('Confirm Password', with: "password123")

    click_button("Create Account")

    @user = User.first

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
    expect(page).to have_button("Create Entry")
  end

  it "I can create a dream journal entry" do
    click_button("New Entry")

    fill_in("Title", with: "Delicious Soup")
    fill_in("Date of Dream", with: "01/03/2024")
    fill_in("Dream Content", with: "I'm at some sort of large convention. Someone I know from highschool is here and has made four different kinds of soups. He wants me to try them all, and I do, and they're extremely delicious. He watches me eat them with fondness.")
    fill_in("Additional Insights", with: "Soup symbolizes emotional nourishment and comfort. Tomatoes represent domestic life (which was one of the soup flavors.)")

    click_button("Create Entry")
      save_and_open_page
    expect(current_path).to eq(user_path(@user))
  end
end