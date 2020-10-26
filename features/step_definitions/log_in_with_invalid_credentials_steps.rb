When('I click on sign in') do
  @main_page = MainPage.new
  @main_page.click_on_sign_in
end

And('I click on sign in with IMDb button') do
  @sign_in_page = SignInWithImdbPage.new
  @sign_in_page.click_on_sign_in_with_IMDb_button
end

And(/^I click on email field and type email (.*)$/) do |email|
  @sign_in_with_imdb_page = SignInWithImdbPage.new
  @sign_in_with_imdb_page.click_on_email_field
  @sign_in_with_imdb_page.type_into_email_field(email)
end

And(/^I click on password field and type password (.*)$/) do |password|
  @sign_in_with_imdb_page.click_on_password_field
  @sign_in_with_imdb_page.type_into_password_field(password)
end

Then('I click on sign in button') do
  @sign_in_with_imdb_page.click_on_sign_in_button
end

And('There should appear error message') do
  @sign_in_with_imdb_page.contain_error_message
end