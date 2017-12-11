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
def check_mixed_content_on_console():
    driver = webdriver.Chrome()
    driver.get("http://wnyc.demo2.wnyc.net/podcasts")
    driver.implicitly_wait(3) # time for page to load
    logs = driver.get_log('browser')
    messages = map(lambda l: l['message'], logs)
    has_console_logs = any(map(lambda m: m.find('Mixed Content:') >= 0, messages))
    if has_console_logs:
        print("Shoudn't have mixed content in console")
        raise AssertionError('Mixed Content on Page ' + str(has_console_logs))
    else:
        print('Test passed')


check_mixed_content_on_console()


