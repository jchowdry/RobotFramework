*** Settings ***
Library  Selenium2Library



*** Variables ***



*** Test Cases ***
Open schedule page and verify the url
    open browser  http://wnyc.demo2.wnyc.net/schedule/     chrome

    ${Current_URL} =  Execute Javascript  return window.location.href;
    location should be      ${Current_URL}
    log to console          ${Current_URL}
    ${Expected_URL}=   set variable  https://wnyc.demo2.wnyc.net
    location should contain     ${Expected_URL}
    close browser
