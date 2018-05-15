*** Settings ***
Documentation     This example demonstrates how to test headless
Library      Selenium2Library
#Library      XvfbRobot

*** Test Cases ***
Open Browser with Chrome options for configuring data source
    [Documentation]
    [Tags]
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --start-maximized
    Call Method  ${options}  add_argument  --headless
    Call Method  ${options}  add_argument  --disable-gpu
    ${preferences} =    Create Dictionary   setAcceptUntrustedCertificates=True    setAssumeUntrustedCertificateIssuer=True
    Create WebDriver  Chrome   chrome_options=${options}   desired_capabilities=${preferences}
    Go To    https://www.wnyc.org/
    ${title}=    Get Title
    Log to console    ${title}
