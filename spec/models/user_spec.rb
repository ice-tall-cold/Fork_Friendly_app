require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all)do
      @user=User.new(Last_Name: "Sai", First_Name: "Mounima", Email: "saimounima@gmail.com", password: "password", password_confirmation: "password", Gender: "Female")
  end
  it "should have a matching Last_Name" do
  expect(@user.Last_Name).to eq("Sai")
  end
  it "should have a matching First_Name" do
  expect(@user.First_Name).to eq("Mounima")
  end
  it "should have a matching password" do
  expect(@user.password).to eq("password")
  end
  it "should have a matching password_confirmation" do
  expect(@user.password_confirmation).to eq("password")
  end
  it "should have a matching Gender" do
  expect(@user.Gender).to eq("Female")
  end
  
  describe "Validations" do
        it "is not to be valid without a valid email" do
            email = User.new(Last_Name: "Sai", First_Name: "Mounima", Email: 'mounima@g', password: "password", password_confirmation: "password", Gender: "Female")
            expect(email).to be_invalid    #Checking if the email is invalid with wrong syntax
          #expect { raise StandardError, "First name can't be blank, Last name can't be blank, Email can't be blank, Email is invalid, Password is too short (minimum is 6 characters)" }
            
        end
it "is not to be valid without a valid password" do
            pwd = User.new(Last_Name: "Sai", First_Name: "Mounima", Email: 'fandom@gmail.com', password: "psd", password_confirmation: "psd", Gender: "Female")
            expect(pwd).to be_invalid    #Checking if the password is invalid with less than 6 charachters
          #expect { raise StandardError, "First name can't be blank, Last name can't be blank, Email can't be blank, Email is invalid, Password is too short (minimum is 6 characters)" }
            
        end
        it "is should have a matching password with password confirmation" do
            pwd = User.new(Last_Name: "Sai", First_Name: "Mounima", Email: 'fandom@gmail.com', password: "passw0d", password_confirmation: "password", Gender: "Female")
            expect(pwd).to be_invalid    #Checking if the password is invalid with not matching password confirmation
          #expect { raise StandardError, "First name can't be blank, Last name can't be blank, Email can't be blank, Email is invalid, Password is too short (minimum is 6 characters)" }
            
        end
 describe "Associations" do
        it "has one health_concerns" do
            healthconcerns = described_class.reflect_on_association(:health_concerns)
            expect(healthconcerns.macro).to eq :has_one
        end
        
        it "has one user_carts" do
            usercarts = described_class.reflect_on_association(:user_carts)
            expect(usercarts.macro).to eq :has_one
        end
    end
        
    end

  
end
