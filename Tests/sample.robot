*** Settings ***
Library  Selenium2Library



*** Variables ***

${Demo}=    http://wnyc.demo2.wnyc.net


*** Test Cases ***
Open schedule page and verify the url
    open browser      ${Demo}/schedule    chrome
    ${log}=     Get Selenium
My SL Run On Failure Keyword
    Get log              all
    Maximize Browser
    Capture Page Screenshot

    ${Current_URL} =  Execute Javascript  return window.location.href;
    location should be      ${Current_URL}
    log to console          ${Current_URL}
#    ${Expected_URL}=   set variable  https://wnyc.demo2.wnyc.net
#    location should contain     ${Expected_URL}
##    close browser
