require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative '../../page_objects/cls_LemonTree_HomePage'
require_relative '../../page_objects/cls_LemonTree_AbstractPage'
require_relative '../../page_objects/cls_LemonTree__Main'
require_relative '../../page_objects/cls_LemonTree_SearchResultPage'
require_relative '../../page_objects/cls_LemonTree_BookingPage'
require_relative '../../utilities/cls_Utilities_WebDriver'

@@masterWebDriverHandle           = nil
@@obj_LemonTreeMain               = ClsLemonTreeMain.new

@@objClsAbstractPage              = nil
@@obj_CurrentPage                 = nil
@@objClsHomePage                  = nil
@@objClsSearchResultPage          = nil

When(/^LemonTree init browser$/) do
  puts 'LemonTree Open browser'
  @@obj_LemonTreeMain.initBrowser('chrome')
end
And(/^LemonTree quit this test$/) do
  puts 'LemonTree quit this test'
  @@obj_LemonTreeMain.quitTest
end

When(/^LemonTree Navigate to "([^"]*)"$/) do |homePageUrl|
  homePageUrl.gsub(/\n\s+/, " ")
  puts 'LemonTree Navigate to ', homePageUrl
  @@objClsHomePage = @@obj_LemonTreeMain.navigateToHomePage homePageUrl
end





#   Scenario: Simple reservation case   ===============================
When(/^LemonTree Select city as "([^"]*)"$/) do |cityName|
  puts 'LemonTree Select city as ', cityName
  @@obj_LemonTreeMain.booking_SelectGivenCity cityName
end

And(/^LemonTree Select "([^"]*)" hotel and check in and check out date as "([^"]*)"$/) do |indexOfAvailableHotels, dateType|
  puts 'LemonTree Select available hotel, check in and check out date as mentioned'
  @@obj_LemonTreeMain.booking_SelectHotel_CheckInDate_CheckOutDate indexOfAvailableHotels, dateType
end

And(/^LemonTree Select person count as "([^"]*)" and room count "([^"]*)"$/) do |personCount, roomCount|
  puts 'LemonTree Select person count and room count as mentioned'
  @@obj_LemonTreeMain.booking_Select_PersonCount_RoomCount personCount, roomCount
end

And(/^LemonTree Initiate booking$/) do
  puts 'LemonTree initiate booking'
  @@objClsSearchResultPage = @@obj_LemonTreeMain.booking_Initiate
end

Then(/^LemonTree Available hotel summary to be shown with "([^"]*)" option$/) do |optionName|
  puts 'LemonTree available hotel summary to be shown with Book Now option'
  @@obj_LemonTreeMain.booking_ValidateResultSummaryOption optionName
end

When(/^LemonTree Selected first booking option$/) do
  puts 'LemonTree Selected first booking option'
  @@objClsBookingPage = @@obj_LemonTreeMain.booking_SelectFirstBookingOption
end

Then(/^LemonTree "([^"]*)" option should be shown$/) do |optionNamesOnSelectedBookingPage|
  puts 'LemonTree ', optionNamesOnSelectedBookingPage , ' option should be shown'
  @@obj_LemonTreeMain.selectedBooking_OptionCheck optionNamesOnSelectedBookingPage
end
#   Scenario: Simple reservation case   ===============================




#  Scenario: Home page basics ============================
When(/^LemonTree Check title$/) do
  puts 'LemonTree Check title'
  @@obj_LemonTreeMain.getThisPageTitle
end

Then(/^LemonTree Title should be "([^"]*)"$/) do |titleOfHomePage_Expected|
  puts 'LemonTree Title should be ',titleOfHomePage_Expected
  @@obj_LemonTreeMain.compareWithThisExpectedTitle titleOfHomePage_Expected
end

When(/^LemonTree Check menu items$/) do
  puts 'LemonTree Check menu items'
  @@obj_LemonTreeMain.getMenuItems
end

Then(/^LemonTree Menu items should be "([^"]*)"$/) do |main_menu_item_list_expected|
  puts 'LemonTree Menu items should be ', main_menu_item_list_expected
  @@obj_LemonTreeMain.compareTheseExpectedMenuItems main_menu_item_list_expected
end
#  Scenario: Home page basics ============================