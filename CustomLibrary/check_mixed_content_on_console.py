from selenium import webdriver
import os
from selenium.webdriver.common.keys import Keys
import time



def Check_Mixed_Content_On_Console():
    driver = webdriver.Chrome()
    # driver.get("http://wnyc.demo2.wnyc.net/podcasts")
    # driver.implicitly_wait(3) # time for page to load
    logs = driver.get_log('browser')
    messages = map(lambda l: l['message'], logs)
    has_console_logs = any(map(lambda m: m.find('tergs') >= 0, messages))
    if has_console_logs:
        print("Shoudn't have mixed content in console")
        raise AssertionError('Mixed Content on Page ' + str(has_console_logs))
    else:
        print('Test passed')
