require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative 'cls_LemonTree_AbstractPage'

class ClsLemonTreeBookingPage < ClsAbstractPage

  # constuctor
  def initialize (driver)
    super(driver)
  end

  def validateFollowingOption (optionNamesOnSelectedBookingPage)
    @@masterWebDriverHandle.manage.timeouts.implicit_wait = 15
    if optionNamesOnSelectedBookingPage.include? 'No Thanks'
      if @@masterWebDriverHandle.find_element(:css, "input[value='No Thanks']")
        puts 'No Thanks option is shown'
      else
        puts 'No Thanks option is NOT shown'
      end
    end

    if optionNamesOnSelectedBookingPage.include? 'Select Packages'
      if @@masterWebDriverHandle.find_element(:css, "input[value='Select Packages']")
        puts 'Select Packages option is shown'
      else
        puts 'Select Packages option is NOT shown'
      end
    end

  end
end