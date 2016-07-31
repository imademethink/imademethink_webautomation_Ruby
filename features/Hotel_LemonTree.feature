@hotel @LemonTree @desktop
Feature: Hotel website validation

  Background: Background steps here
    When LemonTree init browser
    And LemonTree Navigate to "https://www.lemontreehotels.com/"

  @homepagebasic
  Scenario: Home page basics
    When LemonTree Check title
    Then LemonTree Title should be "Official Website of Lemon Tree Hotels, India"
    When LemonTree Check menu items
    Then LemonTree Menu items should be "Our Hotels, Our Brands, Fresh Offers, Partner With Us, Rewards"
    And LemonTree quit this test

  Scenario: Simple reservation case
    When LemonTree Select city as "Goa"
    And LemonTree Select "first" hotel and check in and check out date as "default"
    And LemonTree Select person count as "1" and room count "1"
    And LemonTree Initiate booking
    Then LemonTree Available hotel summary to be shown with "Book Room" option
    When LemonTree Selected first booking option
    Then LemonTree "No Thanks,Select Packages" option should be shown
    And LemonTree quit this test

