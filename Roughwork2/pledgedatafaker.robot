*** Settings ***
Documentation  This is a sample test scenarios
Library  Selenium2Library
Library  FakerLibrary

Test Setup       set faker data


*** Variables ***


#${INPUT_FIRST_NAME}=    id=first-name

*** Test Cases ***
One Time Donation
    [Documentation]  user should be able to donate using credit card
    [Tags]  Smoke

    Open Browser  https://pledge-demo.wnyc.org/donate/main/onestep/  chrome
    wait until page contains  This is example header text from the message catalog located
    set selenium speed  1s
    click element               xpath=html/body/div[3]/main/div[2]/div/form/fieldset/div[2]/label[2]
    input text                  id=first-name                   ${first_name}
    input text                  id=last-name                    ${last_name}
    input text                  id=email                        ${email}
    input text                  id=street-address               ${street_address}
    input text                  id=city                         ${city}
    select from list by value   name=state  1
    input text                  id=zip-code                     ${postcode}
    input text                  id=pledge-credit-card           ${credit_card}
    select from list by value   id=pledge-expiration-month      12
    select from list by value   id=pledge-expiration-year       2020
    click element               xpath=//input[@type='submit']
    Close Browser

*** Keywords ***

set faker data
    ${first_name}=      FakerLibrary.First Name
    ${last_name}=       FakerLibrary.Last Name
    ${email}=           FakerLibrary.Email
    ${street_address}=  FakerLibrary.Street Address
    ${city}=            FakerLibrary.City
    ${postcode}=        FakerLibrary.Postcode
    ${credit_card}=     FakerLibrary.Credit Card Number
    set test variable  ${first_name}
    set test variable  ${last_name}
    set test variable  ${email}
    set test variable  ${street_address}
    set test variable  ${city}
    set test variable  ${postcode}
    set test variable  ${credit_card}
