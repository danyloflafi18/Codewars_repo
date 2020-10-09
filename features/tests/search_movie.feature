Feature:Search movie on IMDb
  Background:
    Given Go to the page

  Scenario:Search movie and be sure that the title be loaded
    When I click on search field
    And Type film "Harry Potter and the Philosopher's Stone"
    And Click on search button
    Then I click on this film
    And Wait for loaded title