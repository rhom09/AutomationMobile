@custom_conversions
Feature: User able to create and manage custom conversions

        @test1
        Scenario: User able to create new conversion
            Given I land on home screen
             When I press on Menu icon
              And I press on my conversions button
              And I press on create your first conversion button
              And I type "Power" as custom conversion name
             When I press on new unit button
              And I type "Horse power" as unit name
              And I type "HP" as unit symbol
              And I type "1" as unit value
              And I press submit checkmark on custom conversions screen
             When I press on new unit button
              And I type "Mule power" as unit name
              And I type "MP" as unit symbol
              And I type "0.5" as unit value
              And I press submit checkmark on custom conversions screen
              And I press on OK button on custom conversions screen
             Then I verify "Power" added to custom conversions list