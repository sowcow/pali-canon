Feature: related tests

  Scenario Outline: nanoc is ok
    When I successfully run `ruby -S nanoc <command>`
    Then the output should contain "<success>"

    Examples:
      | command | success |
      |   -v    |   2007  |
      | cs temp |  Enjoy! |


  Scenario: very empty site
    Given I have an empty site
    Then a directory named "content" should exist
    Then a file named "content/index.html" should not exist


  #Scenario: I have a site
  #  Given I have a site
  #  Then a directory named "content" should exist
  #  Then a file named "content/index.slim" should exist
  #  Then a directory named "lib/classes" should exist
