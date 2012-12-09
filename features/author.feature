Feature: each author have a page

  Scenario:
    Given I have an empty site

    And a file named "content/canon/pi by Dhamma Society/author.yml" with:
      """
      # Dhamma Society
      [site](http://studies.worldtipitaka.org)
      """

    And a file named "content/canon/ru by script/author.yml" with:
      """
      # Simple transliteration script
      (there's no link)
      """

    When I compile the site
    Then the following files should exist:
      | output/authors/Dhamma_Society/index.html |
      | output/authors/script/index.html         |