require "rspec"
require "rubygems"
require "selenium-webdriver"

class ClsAbstractPage

  # constuctor
  def initialize (browser_driver)
    @@masterWebDriverHandle = browser_driver
  end

  # navigate to home page
  def navigateToHomePage (homePageUrl)
    begin
      @@masterWebDriverHandle.manage.window.maximize
      @@masterWebDriverHandle.navigate.to homePageUrl
      # waitLocal = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
      # waitLocal.until { @@masterWebDriverHandle.title.include? "Official Website of Lemon Tree Hotels, India" }
      waitLocal2= Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
      waitLocal2.until { @@masterWebDriverHandle.find_element(:class_name, "logo").displayed? }
    rescue Selenium::WebDriver::Error::TimeOutError
      puts 'Rescue handling for ', 'Selenium::WebDriver::Error::TimeOutError'
      return nil
    rescue Net::ReadTimeout
      puts 'Rescue handling for ', 'Net::ReadTimeout'
      @@masterWebDriverHandle.find_element(:class, "logo").send_keys KEYS.escape
      #@@masterWebDriverHandle.find_element(:class, "logo").send_keys(KEYS.escape)
      # @@masterWebDriverHandle.find_element(:id, "head").send_keys(KEYS.escape)
      # @@masterWebDriverHandle.find_element(:id, "head").send_keys(KEYS.escape)
      #return nil
    rescue Exception => ex
      puts "An error of type #{ex.class} happened, message is #{ex.message}"
      return nil
    end
  end

  # get title
  def getTitle
    return @@masterWebDriverHandle.title
  end

  # quit driver
  def quitDriver
    @@masterWebDriverHandle.quit
  end

end