from selenium import webdriver
from selenium.webdriver.common.keys import Keys

def Cancel_Splash_Page():
    driver = webdriver
    driver.ActionChains(driver).send_keys(Keys.ESCAPE).perform()