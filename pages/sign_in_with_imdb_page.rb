class SignInWithImdbPage
  include Capybara::DSL

  def click_on_email_field
    email_xpath = "//form/div/div/div/div[1]/input"
    page.find(:xpath, email_xpath).click
  end

  def type_into_email_field(email)
    field = page.find(:xpath, "//form/div/div/div/div[1]/input").click
    field.send_keys email
  end

  def click_on_password_field
    password_xpath = "//form/div/div/div/div[2]/input"
    page.find(:xpath, password_xpath).click
  end

  def type_into_password_field(password)
    field = page.find(:xpath, "//form/div/div/div/div[2]/input").click
    field.send_keys password
  end

  def click_on_sign_in_button
    sign_in_xpath = "//div[3]/span/span/input"
    page.find(:xpath, sign_in_xpath).click
  end

  def contain_error_message
    import_message = "There was a problem"
    assert_text import_message
  end
end
