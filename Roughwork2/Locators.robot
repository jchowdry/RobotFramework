*** Settings ***
Library  Selenium2Library




*** Variables ***



*** Test Cases ***
Should be able to verify if the submit button updated with dontaion amount user chose
    open browser  https://pledge-demo.wnyc.org/donate/main/onestep/  firefox
    wait until page contains  This is example header text from the message catalog located
    click element  xpath=html/body/div[3]/main/div[2]/div/form/fieldset/div[2]/label[2]

    element should contain  css=#ember1275  Submit $6.25 / Month Donation  Message=The text is not correct
    #element text should be  xpath=//input[@type='submit']  Submit $6.25  Message=The text is not correct


#    ${submitdonationamount}     Get Text    xpath=//input[@type='submit']
#    Should Be Equal As Strings    ${submitdonationamount}    Submit $6.25 / Month Donation  Message=The text is not correct






*** Keywords ***


