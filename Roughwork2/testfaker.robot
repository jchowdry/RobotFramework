*** Settings ***
Documentation  This is a sample test scenarios
Library  FakerLibrary

*** Test Cases ***
Faker name
    ${FIRST_NAME}=  FakerLibrary.first_name
    ${LAST_NAME}=   FakerLibrary.Last_Name
    Log     First name: ${FIRST_NAME}
    Log     Last name: ${LAST_NAME}