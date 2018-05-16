*** Settings ***
Documentation    Suite description

Library          Selenium2Library

Suite Teardown    close browser
*** Variables ***

${WIDTH}      ${1440}
${HEIGHT}      ${900}
@{SCREEN_RES}    ${WIDTH}    ${HEIGHT}


*** Test Cases ***

Test popup close button
    open browser  http://www.wnyc.org/   chrome
    Set Window Position  ${0}  ${0}
    Set Window Size  @{SCREEN_RES}
    check for popup content
    close popup box


Test no popup
    navigate to web page
    check for popup content
    close popup box


*** Keywords ***

navigate to web page
    go to  http://www.wnyc.org/

check for popup content
    ${is_popup_displayed}=  run keyword and return status   wait until page contains element  css=div.popup_background[style*="visibility: visible"]
    set test variable  ${is_popup_displayed}

close popup box
    run keyword if  '${is_popup_displayed}' == '${TRUE}'    click close button

click close button
    click element  xpath=//img[@class="desktop_splash_close"]
    wait until page contains element  css=div.popup_background[style*="visibility: hidden"]