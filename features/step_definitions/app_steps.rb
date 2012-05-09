Given /^I am registered user$/ do
  @user = Factory(:user)

  login_as @user
end

Then /^I should see "([^"]*)"$/ do |name|
  page.should have_content(name)
end

Then /^I should not see "([^"]*)"$/ do |name|
  page.should have_no_content(name)
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see "([^"]*)" link$/ do |name|
  page.should have_css("a", name)
end

When /^I follow "([^"]*)" link$/ do |name|
  click_link(name)
end

Then /^I should be on (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end
