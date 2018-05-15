from selenium import webdriver
import os
from selenium.webdriver.common.keys import Keys
import time



def Cancel_Splash_Page():
    driver = webdriver.Chrome()
    # driver.get("http://wnyc.demo2.wnyc.net")
    # driver.implicitly_wait(3)  # time for page to load
    cancel_button = driver.find_element_by_xpath("//a[@id='aw0']/img")
    if cancel_button.is_displayed():
        print("Splash page exists")
        cancel_button.click()
    else:

        print("Splash Page didn't display")

