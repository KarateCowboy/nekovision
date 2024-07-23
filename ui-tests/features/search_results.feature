Feature: Search and Results

#  Background: As a user, in order to find videos that interest me, I want to search terms and be presented with a list of results matching the search term

  Scenario: User searches for a video
    Given I am on the main page
      When I search for Smidget Freestyle Don't bother me
      Then I should see a list of videos matching the search term