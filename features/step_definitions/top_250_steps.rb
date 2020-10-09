When('I click on drop-down menu') do
  @main_page = MainPage.new
  @main_page.click_on_drop_down_menu
end

And('I click on advance search item') do
  @main_page.click_on_advance_search
end

And('I click on advance title search') do
  @pre_advance_search_page = PreAdvanceSearchPage.new
  @pre_advance_search_page.click_on_advance_title_search
end

And('I click on 250 top check button') do
  @advance_search_page = AdvanceSearchPage.new
  @advance_search_page.click_on_250_top_check_button
end

And('I click on search button') do
  @advance_search_page.click_on_search_button
end

Then('I should see the first rated movie and click on this') do
  @search_film = SearchFilmPage.new
  @search_film.contain_first_rated_movie
  @search_film.click_on_first_rated_movie
end