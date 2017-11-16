FactoryGirl.define do
  factory :user do
      First_Name 'Ashok'
      Last_Name 'kumar'
      Email 'Ashok@tamu.edu'
      password 'password'
      password_confirmation 'password'
      Gender 'Male'
      Admin true
  end
  factory :user_not_valid do
      First_Name 'Ashok'
      Last_Name 'kumar'
      Email 'Ashok.edu'
      password 'pass'
      password_confirmation 'pass'
      Gender 'Male'
      Admin true
  end
end
