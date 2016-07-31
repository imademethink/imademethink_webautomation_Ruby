require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative 'cls_LemonTree_AbstractPage'
#require_relative 'cls_LemonTree_SearchResultPage'

class ClsLemonTreeHomePage < ClsAbstractPage

  # constuctor
  def initialize (driver)
    super(driver)
  end

  def homePage_SelectGivenItem (itemName)
    # @@masterWebDriverHandle.find_element(:xpath => "//span[text()='3']").click
    # @@masterWebDriverHandle.manage.timeouts.implicit_wait = 10
    # if ! @@masterWebDriverHandle.find_element(:xpath => "//h2[text()='#{itemName}']").displayed?
    #   puts 'Item not found \n\n\n\n\n\n\n\n\n\n'
    #   return
    # end
    # @@masterWebDriverHandle.find_element(:xpath => "//span[text()='Buy Now']").click
    # @@masterWebDriverHandle.manage.timeouts.implicit_wait = 30

    @@masterWebDriverHandle.action.click(@@masterWebDriverHandle.find_element(:xpath => "//span[text()='Buy Now']")).perform
    @@masterWebDriverHandle.manage.timeouts.implicit_wait = 30

  end










  def homePage_CheckIfMenuItemIsDisplayed (menuItemName)
    if @@masterWebDriverHandle.find_element(:id => menuItemName).displayed?
      puts menuItemName, ' menu item is found'
    else
      puts menuItemName, ' menu item is NOT found'
    end
  end

  def homePage_SelectGivenCity (cityName)
    city_selector_dropDownElement = @@masterWebDriverHandle.find_element(:id, "p_lt_ctl02_usercontrol5_userControlElem_drdcity")
    city_selector_dropDown        = Selenium::WebDriver::Support::Select.new(city_selector_dropDownElement)
    city_selector_dropDown.select_by(:value, cityName)
    @@masterWebDriverHandle.manage.timeouts.implicit_wait = 30
  end

  def homePage_SelectHotel_CheckInDate_CheckOutDate (indexOfAvailableHotels, dateType)
    indexOfAvailableHotelsNumeric = 1
    if indexOfAvailableHotels.include?('first')
      indexOfAvailableHotelsNumeric = 1
    end
    hotel_selector_dropDownElement = @@masterWebDriverHandle.find_element(:id, "p_lt_ctl02_usercontrol5_userControlElem_tags")
    hotel_selector_dropDownElement.click
    hotel_selector_dropDown        = Selenium::WebDriver::Support::Select.new(hotel_selector_dropDownElement)
    hotel_selector_dropDown.select_by(:index, indexOfAvailableHotelsNumeric)

    if dateType.include?('default')
      puts 'Check in and check out date are default'
    end

    @@masterWebDriverHandle.manage.timeouts.implicit_wait = 15
  end

  def homePage_PersonCount_RoomCount(personCount, roomCount)
    person_selector_dropDownElement = @@masterWebDriverHandle.find_element(:id, "ddlAdult")
    person_selector_dropDownElement.click
    person_selector_dropDown        = Selenium::WebDriver::Support::Select.new(person_selector_dropDownElement)
    person_selector_dropDown.select_by(:index, personCount.to_i +                   1)   ########################

    room_selector_dropDownElement = @@masterWebDriverHandle.find_element(:id, "ddlChild")
    room_selector_dropDownElement.click
    room_selector_dropDown        = Selenium::WebDriver::Support::Select.new(room_selector_dropDownElement)
    room_selector_dropDown.select_by(:index, roomCount.to_i +                 1)                   ########################

    @@masterWebDriverHandle.manage.timeouts.implicit_wait = 15
  end

  def homePage_InitiateBooking
    # click on BookNow option
    @@masterWebDriverHandle.find_element(:id, "p_lt_ctl02_usercontrol5_userControlElem_btnSave").click
    @@masterWebDriverHandle.manage.timeouts.implicit_wait = 30
    # waitLocal = Selenium::WebDriver::Wait.new(:timeout => 20)
    # waitLocal.until { @@masterWebDriverHandle.current_url.downcase.start_with? "http" }
    #@@masterWebDriverHandle.manage.timeouts.page_load = 20 # seconds
  end











  # navigate to our hotels page
  def navigateToOurHotels
    @@masterWebDriverHandle.find_element(:link_text, "Our Hotels").click
    return ClsLemonTreeOurHotelsPage.new @@masterWebDriverHandle
  end

  # navigate to our brands page
  def navigateToOurBrands
    @@masterWebDriverHandle.find_element(:link_text, "Our Brands").click
    return ClsLemonTreeOurBrandsPage.new @@masterWebDriverHandle
  end

end