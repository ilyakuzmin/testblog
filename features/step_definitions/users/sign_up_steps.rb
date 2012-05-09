When /^I submit registation form with email: "([^"]*)", password: "([^"]*)"$/ do |email, password|
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  fill_in "Password confirmation", :with => password
  click_button "Sign up"
end

Then /^I should see notice about successful sign up$/ do
  page.should have_content("Hi, #{User.last.email}!")
end

Then /^I should see error notice about invalid email and password$/ do
  within("div#error_explanation") {
    page.should have_content("Email is invalid")
    page.should have_content("Password is too short (minimum is 6 characters)")
  }
end
