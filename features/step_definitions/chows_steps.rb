When /^(?:|I )click on button with text "([^"]*)"$/ do |inner_text|
  page.find('div', :text => inner_text)
end

When /^(?:|I )upload the file "([^"]*)"$/ do |filename|
  attach_file('Choose File', Rails.root + "spec/fixtures/files/fork_friendly_upcs.csv")
end
    