class PreAdvanceSearchPage
  include Capybara::DSL
  def click_on_advance_title_search
    page.find(:xpath, "//div[3]/div[2]/div[1]/a").click
  end
end
