Feature: command line interface

  Scenario: prepare site in given directory
    Given I successfully run `pali-canon prepare site`
    Then the following files should exist:
      | site/lib/classes/author.rb |
      | site/lib/classes/canon.rb |
    And the following directories should exist:  
      | site/content/canon |   

  Scenario: compile site to given directory
    Given I successfully run `nanoc create-site site`
    When I successfully run `pali-canon compile site`
    Then the following files should exist:
      | site/index.html |         
      | site/style.css |              
    And a directory named "site/output" should not exist