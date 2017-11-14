require 'rails_helper'
describe "the login process", :type => :feature do
 # before :each do
    #User.make(Email: 'sankeerth@tamu.edu', password: 'password')
  #end

  it "logs me in as an existing user with valid email and password" do
       visit '/login'
    #visit login_path
    #within("#session") do
      fill_in 'Email', with: 'sankeerth@tamu.edu'
      fill_in 'Password', with: 'password'
    #end
    click_button '>'
    expect(page.status_code).to eq(200)
 end
     it "renders same login page for invalid user" do
         visit '/login'
         fill_in 'Email', with: 'sam@'
      fill_in 'Password', with: 'password'
      click_button '>'
    expect(page).to have_content 'New user? Sign up now!'
  end
end