class FilmPage
  include Capybara::DSL

  def search_title
    title_text = "Harry Potter and the Sorcerer's Stone"
    assert_text title_text
  end
end
