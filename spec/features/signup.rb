require 'rails_helper'
describe "the signin process", :type => :feature do
  #before :each do
   # User.make(Email: 'user@example.com', password: 'password')
  #end

  it "signs me in" do
    visit '/signup'
    #within("#session") do
      fill_in 'First name', with: 'user'
      fill_in 'Last Name', with: 'example'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    #end
    click_button 'create user'
    expect(page).to have_content 'New user? Sign up now!'
  end
end