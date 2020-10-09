class AdvanceSearchPage
  include Capybara::DSL


  def click_on_250_top_check_button
    top_250_xpath = "//div[7]/div[2]/table/tbody/tr[1]/td[2]/label"
    page.find(:xpath, top_250_xpath).click
  end

  def click_on_search_button
    search_button_xpath = "//form/div/p[3]/button"
    page.find(:xpath, search_button_xpath).click
  end
end
