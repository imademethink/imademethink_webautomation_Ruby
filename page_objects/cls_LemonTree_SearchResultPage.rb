require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative 'cls_LemonTree_AbstractPage'

class ClsLemonTreeSearchResultPage < ClsAbstractPage

  # constuctor
  def initialize (driver)
    super(driver)
  end

  def validateResultSummaryOption (optionName)
    if optionName.include?('Book Room')
      bookRoomOptionIsDisplayed = @@masterWebDriverHandle.find_elements(:css, "input[value='Book Room']")
#      bookRoomOptionIsDisplayed = @@masterWebDriverHandle.find_element(:id, "V111_C1_AR_ctl00_ViewAvailableButton").displayed?
#      bookRoomOptionIsDisplayed = @@masterWebDriverHandle.find_element(:id, "V111_C3_YourStayHeader").displayed?
      puts 'Following count of options displayed - ', bookRoomOptionIsDisplayed.length
    end

    def selectFirstBooking

      @@masterWebDriverHandle.action.move_to(@@masterWebDriverHandle.find_element(:css, "input[value='Book Room']")).click.perform
      waitLocal= Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
      waitLocal.until { @@masterWebDriverHandle.find_element(:css, "input[value='Hide Available Rates']").displayed? }

      @@masterWebDriverHandle.action.move_to(@@masterWebDriverHandle.find_element(:css, "input[value='Hide Available Rates']")).send_keys(:down).perform

      @@masterWebDriverHandle.action.move_to(@@masterWebDriverHandle.find_element(:css, "input[value='Book Now']")).click.perform
      waitLocal2= Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
      waitLocal2.until { @@masterWebDriverHandle.find_element(:css, "input[value='No Thanks']").displayed? }


#       @@masterWebDriverHandle.find_element(:css, "input[value='Book Room']").click
# #      @@masterWebDriverHandle.find_element(:id, "V111_C1_AR_ctl00_ViewAvailableButton").click
#       @@masterWebDriverHandle.manage.timeouts.implicit_wait = 20
# #      @@masterWebDriverHandle.find_element(:id, "V111_C1_AR_ctl00_ViewAvailableButton").click
#       @@masterWebDriverHandle.find_element(:css, "input[value='Book Now']").click
#       @@masterWebDriverHandle.manage.timeouts.implicit_wait = 500
    end

  end










end