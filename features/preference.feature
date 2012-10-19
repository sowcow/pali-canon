Feature: preferences are hidden

  Scenario:
    Given I have compiled the site
    Then the following directories should not exist:
      | output/preferences |