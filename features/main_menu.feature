@main_menu
Feature: Convert units

              As a user I want to convert units

        @focus
        Scenario: When I tap on menu icon, I should see left side menu
            Given I land on home screen
             When I press on Menu icon
             Then I should see left side menu

        @conversions
        Scenario: I should be able to open my conversions screen
            Given I land on home screen
             When I press on Menu icon
              And I press on my conversions button
             Then I land on my conversions screen