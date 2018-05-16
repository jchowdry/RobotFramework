*** Settings ***
Library  Selenium2Library
Library  OperatingSystem

*** Variables ***
${ExpectedCookieValue}    has_been_displayed
${ExtractedCookieValue}    ${EMPTY}

*** Test Cases ***
CookieTest
    Open Browser    http://wnyc.demo2.wnyc.net    chrome
    Maximize Browser Window
    Add Cookie    splash      has_been_displayed
    Get Cookie Value    splash
    ${ExtractedCookieValue}    Get Cookie Value    splash
    Log    "Extracted Cookie Value"
    Log    ${ExtractedCookieValue}
    Should Be Equal    ${ExtractedCookieValue}    ${ExpectedCookieValue}    'Cookie Should be Equal'
    Close Browser