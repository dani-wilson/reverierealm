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

    expect(page).to have_field("Title*")
    expect(page).to have_field("Date of Dream*")
    expect(page).to have_field("Private?")
    expect(page).to have_field("Favorite")
    expect(page).to have_field("Dream Content*")
    expect(page).to have_field("Additional Insights")
    expect(page).to have_button("Create Entry")
  end

  it "I can create a dream journal entry" do
    click_button("New Entry")

    fill_in("Title*", with: "Delicious Soup")
    fill_in("Date of Dream*", with: "01/03/2024")
    fill_in("Dream Content*", with: "I'm at some sort of large convention. Someone I know from highschool is here and has made four different kinds of soups. He wants me to try them all, and I do, and they're extremely delicious. He watches me eat them with fondness.")
    fill_in("Additional Insights", with: "Soup symbolizes emotional nourishment and comfort. Tomatoes represent domestic life (which was one of the soup flavors.)")
    check("Private?")
    check("Favorite")

    click_button("Create Entry")

    expect(page).to have_content("Entry saved.")
    
    expect(current_path).to eq(user_path(@user))
  end

  it "once I've submitted a dream, I see it on my dashboard" do
    click_button("New Entry")

    fill_in("Title*", with: "Winter Garden")
    fill_in("Date of Dream*", with: "12/31/2022")
    fill_in("Dream Content*", with: "It's icy and there's snow everywhere, but I find a patch of lettuce and carrots growing. I feel so happy")
    fill_in("Additional Insights", with: "Good stuff")
    check("Private?")
    check("Favorite")

    click_button("Create Entry")
    
    expect(page).to have_content("Entry saved.")

    expect(page).to have_content("Winter Garden")
    expect(page).to have_content("It's icy and there's snow everywhere,")
    expect(page).to have_content("12/31/2022")
  end

  it "only required fields are needed to submit an entry" do
    click_button("New Entry")

    fill_in("Title*", with: "A cute puppy")
    fill_in("Date of Dream*", with: "07/21/2023")
    fill_in("Dream Content*", with: "There's a cute white puppy and she bites really hard.")

    click_button("Create Entry")
    expect(page).to have_content("Entry saved.")

    expect(page).to have_content("A cute puppy")
    expect(page).to have_content("There's a cute white puppy and")
    expect(page).to have_content("07/21/2023")
  end

  it "SAD PATH: required fields are required" do
    click_button("New Entry")

    fill_in("Date of Dream*", with: "07/21/2023")
    fill_in("Dream Content*", with: "There's a cute white puppy and she bites really hard.")

    click_button("Create Entry")

    expect(page).to have_content("Required fields cannot be blank.")
    expect(page).to_not have_content("Entry saved.")
  end
end