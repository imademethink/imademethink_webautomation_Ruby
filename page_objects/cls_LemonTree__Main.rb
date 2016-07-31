require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative '../utilities/cls_Utilities_WebDriver'
require_relative '../page_objects/cls_LemonTree_AbstractPage'
require_relative '../page_objects/cls_LemonTree_SearchResultPage'
require_relative '../page_objects/cls_LemonTree_BookingPage'

class ClsLemonTreeMain

  @titleOfHomePage_Actual = nil
  @arr_ItemsDisplayed     = nil

#####################################
  def initBrowser (browserType)
    browserType.gsub(/\n\s+/, " ")
    @arr_ItemsDisplayed     = Array.new
    if browserType.include? 'firefox'
      @@objClsAbstractPage = ClsAbstractPage.new(Selenium::WebDriver.for(:firefox))
    elsif browserType.include? 'chrome'
      @@objClsAbstractPage = ClsAbstractPage.new(Selenium::WebDriver.for(:chrome, :switches => %w[ --disable-extensions ]))
    end
  end
#####################################

#####################################
  def quitTest
    @@objClsAbstractPage.quitDriver
  end
#####################################




#####################################
  def navigateToHomePage (homePageUrl)
    homePageUrl.gsub(/\n\s+/, " ")
    @@objClsAbstractPage.navigateToHomePage homePageUrl
    return ClsLemonTreeHomePage.new @@masterWebDriverHandle
  end
#####################################
  def getThisPageTitle
    @titleOfHomePage_Actual = @@objClsAbstractPage.getTitle
  end
#####################################
  def compareWithThisExpectedTitle (titleOfHomePage_Expected)
    titleOfHomePage_Expected.gsub(/\n\s+/, " ")
    if @titleOfHomePage_Actual.include? titleOfHomePage_Expected
       puts 'Correct title found'
    else
       puts 'Correct title NOT found'
    end
  end
#####################################
  def getMenuItems

    if @@objClsHomePage.homePage_CheckIfMenuItemIsDisplayed "FindHotel"
      @arr_ItemsDisplayed << 'Our Hotels'
    end
    if @@objClsHomePage.homePage_CheckIfMenuItemIsDisplayed "ourBrand"
      @arr_ItemsDisplayed << 'Our Brands'
    end
    if @@objClsHomePage.homePage_CheckIfMenuItemIsDisplayed "Lemon"
      @arr_ItemsDisplayed << 'Fresh Offers'
    end
    if @@objClsHomePage.homePage_CheckIfMenuItemIsDisplayed "devlmnt"
      @arr_ItemsDisplayed << 'Partner With Us'
    end
    if @@objClsHomePage.homePage_CheckIfMenuItemIsDisplayed "Rewards"
      @arr_ItemsDisplayed << 'Rewards'
    end

  end
#####################################
  def compareTheseExpectedMenuItems (main_menu_item_list_expected)
    main_menu_item_list_expected.gsub(/\n\s+/, " ")
    main_menu_item_list_expected_array = main_menu_item_list_expected.split(/\s*,\s*/)

    main_menu_item_list_expected_array.each do |single_expected_item|
      if @arr_ItemsDisplayed.include? single_expected_item
        puts 'Following menu items is displayed ', single_expected_item.gsub(/\n\s+/, " ")
      else
        puts 'Following menu items is NOT displayed ', single_expected_item.gsub(/\n\s+/, " ")
      end
    end

  end
#####################################
  def booking_SelectGivenCity (cityName)
    cityName.gsub(/\n\s+/, " ")
    @@objClsHomePage.homePage_SelectGivenCity cityName
  end
#####################################
  def booking_SelectHotel_CheckInDate_CheckOutDate (indexOfAvailableHotels, dateType)
    indexOfAvailableHotels.gsub(/\n\s+/, " ")
    dateType.gsub(/\n\s+/, " ")
    @@objClsHomePage.homePage_SelectHotel_CheckInDate_CheckOutDate indexOfAvailableHotels, dateType
  end
#####################################
  def booking_Select_PersonCount_RoomCount (personCount, roomCount)
    personCount.gsub(/\n\s+/, " ")
    roomCount.gsub(/\n\s+/, " ")
    @@objClsHomePage.homePage_PersonCount_RoomCount personCount, roomCount
  end
#####################################
  def booking_Initiate
    @@objClsHomePage.homePage_InitiateBooking
    return ClsLemonTreeSearchResultPage.new @@masterWebDriverHandle
  end
#####################################
  def booking_ValidateResultSummaryOption (optionName)
    optionName.gsub(/\n\s+/, " ")
    @@objClsSearchResultPage.validateResultSummaryOption optionName
  end
#####################################
   def booking_SelectFirstBookingOption
     @@objClsSearchResultPage.selectFirstBooking
     return ClsLemonTreeBookingPage.new @@masterWebDriverHandle
   end

  def selectedBooking_OptionCheck (optionNamesOnSelectedBookingPage)
    optionNamesOnSelectedBookingPage.gsub(/\n\s+/, " ")
    @@objClsBookingPage.validateFollowingOption optionNamesOnSelectedBookingPage
  end

end