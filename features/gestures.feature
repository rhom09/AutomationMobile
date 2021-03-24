@gestures
Feature: User able to use gestures

  Scenario: User able to swipe to open left side menu
    Given I land on home screen
    When I swipe from left to right
    Then I should see left side menu
    When I swipe from right to left
    Then I see "Length" as a current unit converter

  Scenario: User able to swipe to open calculator
    Given I land on home screen
    When I swipe from right to left for calculator
    Then I see "Calculator" as a current unit converter
    When I swipe from left to right for calculator
    Then I see "Length" as a current unit converter