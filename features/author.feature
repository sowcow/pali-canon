Feature: each author have a page

  Scenario:
    Given I have compiled the site
    Then the following files should exist:
      | output/authors/Dhamma_Society/index.html |
      | output/authors/script/index.html         |