*** Settings ***
Documentation


*** Test Cases ***
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
