from selenium import webdriver
import os
from selenium.webdriver.common.keys import Keys
import time


def Switch_Tab():
    driverlocation = "../../workspace/pledgeapptestsuite-rf/Drivers/chromedriver"
    os.environ["webdriver.chrome.driver"] = driverlocation
    driver = webdriver.Chrome(driverlocation)
    # Switch tab to the new tab, which we will assume is the next one on the right
    driver.find_element_by_tag_name('body').send_keys(Keys.CONTROL + Keys.TAB)

    # Put focus on current window which will, in fact, put focus on the current visible tab
    driver.switch_to_window(main_window)

    # do whatever you have to do on this page, we will just got to sleep for now
    time.sleep(2)

    # Close current tab
    driver.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 'w')

    # Put focus on current window which will be the window opener
    driver.switch_to_window(main_window)

def Check_Mixed_Content_On_Console():
    driver = webdriver.Chrome()
    # driver.get("http://wnyc.demo2.wnyc.net/podcasts")
    driver.implicitly_wait(3) # time for page to load
    logs = driver.get_log('browser')
    messages = map(lambda l: l['message'], logs)
    has_console_logs = any(map(lambda m: m.find('Mixed Content:') >= 0, messages))
    print("Shoudn't have mixed content in console" if has_console_logs else 'Test passed')


def Cancel_Splash_Page():
    driver = webdriver.Chrome()
    # driver.get("http://wnyc.demo2.wnyc.net")
    # driver.implicitly_wait(3)  # time for page to load
    cancel_button = driver.find_element_by_xpath("//img[@class='desktop_splash_close is-loaded']")
    if cancel_button.is_displayed():
        cancel_button.click()
    else:
        print("Splash Page didn't display")



