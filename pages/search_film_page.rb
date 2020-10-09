class SearchFilmPage
  include Capybara::DSL


  def search_film
    page.find(:xpath, "//div/div[2]/table/tbody/tr[1]/td[1]/a/img").click
  end

  def contain_first_rated_movie
    page.find(:xpath, "//div/div[1]/div[3]/h3/span[1]")
  end

  def click_on_first_rated_movie
    page.find(:xpath, "//div/div[3]/div/div[1]/div[3]/h3/a").click
  end
end
