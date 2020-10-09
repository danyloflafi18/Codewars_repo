When('I click on search field') do
  @main_page = MainPage.new
  @main_page.click_on_search_field
end

And(/^Type film "([^"]*)"$/) do |name_of_the_film|
  @main_page.type_into_search_field(name_of_the_film)
end

And('Click on search button') do
  @main_page.click_on_search_button
end

Then('I click on this film') do
  @search_film_page = SearchFilmPage.new
  @search_film_page.search_film
end

And('Wait for loaded title') do
  @film_page = FilmPage.new
  @film_page.search_title
end