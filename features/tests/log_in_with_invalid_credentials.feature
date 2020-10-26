Feature: Sign in with invalid credentials

  Background:
    Given Go to the page

  Scenario Outline: I type invalid credential into email and password fields
    When I click on sign in
    And I click on sign in with IMDb button
    And I click on email field and type email <email>
    And I click on password field and type password <password>
    Then I click on sign in button
    And There should appear error message

    Examples:
      | email       | password |
      | sust@gc.com | ddd32143 |
      | resc@lh.com | ttt5321  |
      | h0jf@yf.com | 8ffsdfsd |