Feature: Search top film of the 250

  Background:
    Given Go to the page

    Scenario:
      When I click on drop-down menu
      And I click on advance search item
      And I click on advance title search
      And I click on 250 top check button
      And I click on search button
      Then I should see the first rated movie and click on this