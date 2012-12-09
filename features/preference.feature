Feature: preferences are hidden

  Scenario:
    Given I have an empty site

    And an empty file named "content/preferences/Pali.yml"
    And an empty file named "content/preferences/Russian.yml"

    When I compile the site

    Then the following directories should not exist:
      | output/preferences |