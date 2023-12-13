require "rails_helper"

RSpec.describe "The landing page" do
  describe "creating an account" do
    it "has a button to create an account" do
      visit "/"

      expect(page).to have_link("Create an Account")
    end

    it "when I click the button, I am taken to a form to enter my information" do
      visit "/"

      click_link "Create an Account"

      expect(current_path).to eq(new_user_path)

      expect(page).to have_field("Username")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Confirm Password")
    end

    it "HAPPY PATH: when I fill out my information, I see a message notifying me that my account creation has been successful" do
      visit "/"

      click_link "Create an Account"

      expect(current_path).to eq(new_user_path)

      expect(page).to have_field("Username")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Confirm Password")

      fill_in('Username', with: "DreamyDani")
      fill_in('Email', with: "dreams@test.com")
      fill_in('Password', with: "password123")
      fill_in('Confirm Password', with: "password123")

      click_button("Create Account")

      expect(page).to have_content("Account successfully created!")
      expect(current_path).to eq(user_path(User.last.id))
    end

    xit "SAD PATH: My username must be unique" do
      visit "/"

      click_link "Create an Account"

      fill_in('Username', with: "DreamyDani")
      fill_in('Email', with: "dreams@test.com")
      fill_in('Password', with: "password123")
      fill_in('Confirm Password', with: "password123")

      click_button("Create Account")

      visit "/"

      click_link "Create an Account"

      fill_in('Username', with: "DreamyDani")
      fill_in('Email', with: "danio@test.com")
      fill_in('Password', with: "password123")
      fill_in('Confirm Password', with: "password123")

      click_button("Create Account")

      expect(page).to have_content("User already exists.")
    end

    it "SAD PATH: when I fill out the form incorrectly, I see a message notifying me that fields cannot be blank" do
      visit "/"

      click_link "Create an Account"

      expect(current_path).to eq(new_user_path)

      expect(page).to have_field("Username")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Confirm Password")

      fill_in('Username', with: "DreamyDani")
      fill_in('Password', with: "password123")
      fill_in('Confirm Password', with: "password123")

      click_button("Create Account")

      expect(page).to have_content("User must enter a valid email address.")
      expect(current_path).to eq(new_user_path)
    end

    it "SAD PATH: only a valid email address format can be accepted" do
      visit "/"

      click_link "Create an Account"

      expect(current_path).to eq(new_user_path)

      expect(page).to have_field("Username")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Confirm Password")

      fill_in('Username', with: "DreamyDani")
      fill_in('Email', with: 'monkey')
      fill_in('Password', with: "password123")
      fill_in('Confirm Password', with: "password123")

      click_button("Create Account")

      expect(page).to have_content("User must enter a valid email address.")
      expect(current_path).to eq(new_user_path)
    end
  end

  describe "logging in" do
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
    end

    it "HAPPY PATH: has the option to login with an already-made account" do
      visit "/"

      expect(page).to have_link("Log In")

      click_link('Log In')

      expect(current_path).to eq(login_path)
    end

    it "HAPPY PATH: can log in" do
      visit "/"

      click_link("Log In")

      fill_in('Username', with: 'DreamyDani')
      fill_in('Password', with: 'password123')
      click_button('Log In')

      expect(page).to have_content("Welcome, #{@user.username}")

      expect(current_path).to eq(user_path(@user))
    end
  end
end