*** Settings ***
Documentation  This is a sample test scenarios
Library  Selenium2Library

*** Variables ***
${BROWSER} =   chrome
${URL} =    https://pledge-demo.wnyc.org/donate/main/onestep/
${REMOTE_URL} =  http://jchowdry:45250833-e563-4360-8c72-a0d73e1385a5@ondemand.saucelabs.com:80/wd/hub
#mac+chrome ${DESIRED_CAPABILITIES} =  name:MacOS + chrome59, platform:macOS 10.12,browserName:chrome,version:59
${DESIRED_CAPABILITIES} =  name:Windows + chrome43, platform:Windows 8.1,browserName:chrome,version:43




*** Test Cases ***
One Time Donation
    [Documentation]  user should be able to donate using credit card
    [Tags]  Smoke
    #Open Browser  ${URL}  ${BROWSER}    remote_url=jchowdry:45250833-e563-4360-8c72-a0d73e1385a5@ondemand.saucelabs.com:80/wd/hub desired_capabilities=name:MacOS + chrome 59, platform:macOS 10.12,browserName:chrome,version:59
    open browser    ${URL}  ${BROWSER}  remote_url=${REMOTE_URL}   desired_capabilities=${DESIRED_CAPABILITIES}
    wait until page contains  This is example header text from the message catalog located
    #click button  xpath=html/body/div[3]/main/div[2]/div/form/fieldset/div[2]/label[2]
    click element  xpath=html/body/div[3]/main/div[2]/div/form/fieldset/div[2]/label[2]
    input text  id=first-name  Javed
    input text  id=last-name  Chowdry
    input text  id=email  test@example.com
    input text  id=street-address  160 Varick Stree
    input text  id=city  New York
    select from list by value  name=state  1
    input text  id=zip-code  10013
    input text  id=pledge-credit-card  41111111111111111
    select from list by value  id=pledge-expiration-month  12
    select from list by value  id=pledge-expiration-year  2020
    click element  xpath=//input[@type='submit']


    Close Browser



*** Keywords ***