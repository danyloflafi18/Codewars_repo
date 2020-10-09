class MainPage
  include Capybara::DSL

  def click_on_drop_down_menu
    drop_down_menu_xpath = "//div[1]/div/label/div"
    page.find(:xpath, drop_down_menu_xpath).click
  end

  def click_on_advance_search
    advance_search_xpath = "//span/ul/a[7]"
    page.find(:xpath, advance_search_xpath).click
  end

  def click_on_search_field
    find_field "suggestion-search"
  end

  def type_into_search_field(film)
    fill_in :with => film
  end

  def click_on_search_button
    click_on "suggestion-search-button"
  end

  def click_on_sign_in
    page.find(:xpath, "//nav/div[2]/div[5]/a/div").click
  end
end
