#*** Settings ***
#Library  Selenium2Library
#Library           Collections
#
#
#*** Variables ***
#${COUNTRY_LIST}=    xpath=//select[@id="country"]
#
#*** Keywords ***
#Find List Of Country Names
#    @{country_names}=       get list items          ${COUNTRY_LIST}
#    log to console  ${country_names}
#    :For    ${name}    IN      ${country_names}
#    \    log    ${name}
#
#Verify If List Contains The Country "Bangladesh"
#    @{country_names}=       get list items          ${COUNTRY_LIST}
#    ${Country_length}=      get length              ${country_names}
##    log to console          'list size is : '       ${Country_length}
#    List Should Contain Value         ${country_names}      Bangladesh
#
#*** Test Cases ***
#Verify Pledge Page Contents
#    [Documentation]  sample test
#    [Tags]  Smoke
#
#    open browser       https://pledge-wnyc.demo.nypr.digital/donate/main/onestep/       chrome
#
#    Find List Of Country Names
#    sleep  5s
#    Verify If List Contains The Country "Bangladesh"

*** Settings ***
Library  Selenium2Library
Library           Collections
*** Variables ***
${COUNTRY_LIST}=    xpath=//select[@id="country"]
*** Keywords ***
Find List Of Country Names
    @{country_names}=       get list items          ${COUNTRY_LIST}
#    log to console  ${country_names}
    :For    ${name}    IN      ${country_names}
    \    log    ${name}
Verify If List Contains The Country
    [Arguments]  ${country}
    @{country_names}=       get list items          ${COUNTRY_LIST}
    ${Country_length}=      get length              ${country_names}
#    log to console          'list size is : '       ${Country_length}
    should contain match  ${country_names}  ${country}   whitespace_insensitive=True

*** Test Cases ***
Verify Pledge Page Contents
    [Documentation]  sample test
    [Tags]  Smoke
    open browser       https://pledge-wnyc.demo.nypr.digital/donate/main/onestep/       chrome
    Find List Of Country Names
    sleep  5s
    Verify If List Contains The Country  Bangladesh

Verify Monthly donation and one-time donation radio button exists
    page should contain radio button            xpath=//input[@value='recurring']
    page should contain                         Monthly Donation
    page should contain radio button            xpath=//input[@value='onetime']
    page should contain                         One-time Donation

Verify Page Contains Other Amount Text Field
    Page should contain element            xpath=//input[@placeholder="Other amount"]

Verify Page Contains Thank-You Gift Text
    Page should contain                 Choose a Thank-You Gift

Verify Page Contains New Yorker Magazine Subscription
    Page should contain                 New Yorker Magazine Subscription

Verify Page should contain Add an additional name to this pledge
    page should contain                 Add an additional name to this pledge

Verify Page Should contain Checking Account (Recommended)
    page should contain             Checking Account (Recommended)

Verify Page should contain Credit card label
    page should contain             Checking Account (Recommended)

Verify Page Contains Yes! I will pledge an extra $1 / Month to The WNYC
    page should contain                 Yes! I will pledge an extra $1 / Month to The WNYC

