*** Settings ***
Documentation  This test suite will cover monthly donate related test scenarios such as donating using differents payment Method, with gifts and sizes,different doncation amounts etc.
Resource  ../Apps/MonthlyDonation.robot
Resource  ../Resources/Common.robot


Test Setup  Begin Web Test

Test Teardown  End Web Test

*** Variables ***




*** Test Cases ***
User should be able pledge using visa Card
    [Documentation]  This test cases to ensure users ability to pledge using Visa Card.
    [Tags]  Smoke   Functional  Regression
    MonthlyDonation.User should be able to navigate to pledge app and pledge using visa card



User should be able pledge using amex Card
    [Documentation]  This test cases to ensure users ability to pledge using Amex Card.
    [Tags]  Smoke  Regression
    MonthlyDonation.User should be able to navigate to pledge app and pledge using Amex card



User should be able pledge using Master Card
    [Documentation]  This test cases to ensure users ability to pledge using Master Card.
    [Tags]  Smoke
    MonthlyDonation.User should be able to navigate to pledge app and pledge using Master card


User should be able pledge using Disover Card
    [Documentation]  This test cases to ensure users ability to pledge using discover Card.
    [Tags]  Functional
    MonthlyDonation.User should be able to navigate to pledge app and pledge using Discover card


