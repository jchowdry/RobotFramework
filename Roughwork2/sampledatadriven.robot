*** Settings ***
Documentation  we will cover different credit card payment options for one time donation using data driven approach
Library     Selenium2Library
Library     RequestsLibrary
Resource    ${CURDIR}/../Resources/Test_Bed_Parser.robot



*** Variables ***



*** Test Cases ***
Read The Test Credit Card Data
    Get Payment Options Data File


Read Visa Card details
    [Tags]  test

    ${visa_card_n}   ${visa_E_Date}    ${visa_E_Year}=   Get Visa Card Details
    log to console  VisaCard Number=${visa_card_n}, VisaExpiresDate=${visa_E_Date}. VisaExpiresYear=${visa_E_Year}






