@home_screen
Feature: Tests for home screen functionality

  Background:
    Given I land on home screen

        @default
        Scenario: Default values on home screen is foot and centimeter
             Then Left unit picker value should be "Foot"
              And right unit picker value should be "Centimeter"

        
        Scenario: Show all button should be enabled at launch
             Then Show all button should be disabled
             When I type "1" on application keyboard
             Then Show all button should be enabled

        @conversions
        Scenario Outline: Verify default conversion
             When I type "<target>" on application keyboard
             Then I should see result as "<result>"
        Examples:
                  | target | result   |
                  | 1      | 30.48    |
                  | 3      | 91.44    |
                  | 5      | 152.4    |
                  | 7      | 213.36   |
                  | 1030   | 31 394.4 |

        
        Scenario: User able to add current conversion to favorites list
             When I press on add to favorites icon
             When I press on Menu icon
              And I press on favorite conversions
             Then I verify "Length" added to favorite conversions list

        
        Scenario: User able to search by existing conversion type
             When I press on search icon
              And I type "Temperature" in search field
              And I press return button on soft keyboard
             Then I see "Temperature" as a current unit converter
             Then Left unit picker value should be "Celsius"
              And right unit picker value should be "Fahrenheit"


        Scenario Outline: User able to select values from unit pickers
             When I select "<unit_type>" from left unit picker
              And I type "<amount>" on application keyboard
             Then I should see result as "<result>"

        Examples:
                  | unit_type | amount | result  |
                  | Inch1      | 1      | 2.54    |
                  | Link1      | 1      | 20.1168 |
                  | Kilometer1 | 1      | 100 000 |

        
        Scenario: User able to convert values
             When I press on Menu icon
              And I select "Volume" from menu
              And I select "Cup" from right unit picker
              And I type "1" on application keyboard
             Then I should see result as "15.1416"


        Scenario: User able to switch values
          And Left unit picker value should be "Foot"
          And right unit picker value should be "Centimeter"
          When I press on switch units button
          Then Left unit picker value should be "Centimeter"
          And right unit picker value should be "Foot"

        @wip
        Scenario: User able to cleanup conversion history
          When I press on Menu icon
          And I select "History" from menu
          Then I see "History" as a current unit converter
          And I should see text "No history right now"
          When I press on Menu icon
          And I select "Length" from menu
          And I type "1" on application keyboard
          When I press on Menu icon
          And I select "History" from menu
          And I verify that 1 st result in history list is "Length"
          When I press delete from history at 1 st row
          Then I should see text "No history right now"