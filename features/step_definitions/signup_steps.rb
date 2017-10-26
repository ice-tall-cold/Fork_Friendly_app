Given /^the following users exist:$/ do |profiles|
  profiles.hashes.each do |p|
    User.create!(p)
  end
end

