*** Settings ***
Documentation    This robot file to go over the different for loop options that RF has to offer
Library     Selenium2Library
Library     Collections



*** Test Cases ***
# Normal for  for loop
Test regurla for loop
    [Tags]  NormalLoop
    @{SOMEIDS}=    create list  1   2
    Append To List  ${SOMEIDS}  1111    22222
    Append To List  ${SOMEIDS}  4444   33333
    :FOR    ${IDS}   IN      @{SOMEIDS}
    \       log     ${IDS}


#Nested for loop
Test nested for loop
    [Documentation]  Nested for loop use a user keyword inside a for loop and have another for loop

#for loop upper limits
Test For loop in range
    :FOR    ${INDEX}    IN RANGE       6
    \       log  ${INDEX}

    #for loop start and end
Test For loop in range
    :FOR    ${INDEX}    IN RANGE    1   6
    \       log  ${INDEX}

#for loop elemements

Testing for loop over elements
    @{ITEMS}    create list     test1   demo    prod    test2
    :FOR  ${ELEMENT}    IN    @{ITEMS}
    \   log     ${ELEMENT}
    \   ${ELEMENT}      Replace String     ${ELEMENT}  ${SPACE}
    \   log   ${ELEMENT}

# step over value 2*** Test Cases ***

Start and End Given Step
    [Tags]  Startgivenstep
    :FOR  ${ELEMENT}    IN RANGE   0    20  2
    \   log     ${ELEMENT}

Start and End Negative Step
    [Tags]  StartNegativestep
    :FOR  ${ELEMENT}    IN RANGE   20   0  -3
    \   log     ${ELEMENT}

#For loop in Arthmetics Operation
Perform arthmetic operation in for loop
    [Tags]  Arthmetic
    ${Var}=     set variable    0
    :FOR    ${INDEX}    IN RANGE    1   100
    \   ${var}=     evaluate  ${Var}+${INDEX}
    \   LOG  ${Var}
    log  "Sum is", ${Var}

#Float parameters
Perform loops over float values
    [Tags]  floating
    :FOR    ${INDEX}    IN RANGE    0     1.1     0.2
    \       log     ${INDEX}
