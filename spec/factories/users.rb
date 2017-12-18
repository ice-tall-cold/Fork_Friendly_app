FactoryBot.define do
  factory :user do
      First_Name 'Ashok'
      Last_Name 'kumar'
      password 'password'
      password_confirmation 'password'
      Gender 'Male'
      Admin true
      factory :valid_user do
        Email 'Ashok@tamu.edu'
      end
      factory :invalid_user do
        Email 'Ashok'
      end
      
  end
end
