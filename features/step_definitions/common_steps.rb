Given('Go to the page') do
  visit Constants::IMDB_URL # Write code here that turns the phrase above into concrete actions
end

Given /^I am on (.*)$/ do |url|
  visit url
end
