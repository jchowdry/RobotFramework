# from selenium import webdriver
#
# driver = webdriver.Chrome()
# driver.get("http://wnyc.demo2.wnyc.net/podcasts")
# browser_logs = driver.get_log("browser")
# print browser_logs
#
# from selenium import webdriver
# from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
#
# capabilities = DesiredCapabilities.CHROME
# capabilities['loggingPrefs'] = { 'browser':'ALL' }
#
# driver = webdriver.Chrome(desired_capabilities=capabilities)
#
# driver.get("http://wnyc.demo2.wnyc.net/podcasts")
#
# # print console log messages
# for entry in driver.get_log('browser'):
#     print entry


from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


# d = DesiredCapabilities.FIREFOX
# d['loggingPrefs'] = { 'browser':'ALL' }
# driver = webdriver.Firefox(capabilities=d)

# chrome
driver = webdriver.Chrome()
driver.get("http://wnyc.demo2.wnyc.net/podcasts")
driver.implicitly_wait(3) # time for page to load
logs = driver.get_log('browser')
messages = map(lambda l: l['message'], logs)
has_console_logs = any(map(lambda m: m.find('Mixed Content:') >= 0, messages))
print("Shoudn't have mixed content in console" if has_console_logs else 'Test passed')


# this is a test
