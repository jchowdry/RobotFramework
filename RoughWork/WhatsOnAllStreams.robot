*** Settings ***
Library         Selenium2Library


*** Variables ***
${station_menu} =            xpath=//div[@class="head toggle-menu"]
${LISTEN_BUTTON} =              xpath=//button[@id="popup-btn"]
${SHOW_NAME_FROM_PERSISTENT_PLAYER} =    xpath=//span[@class="nypr-player-stream-info-station-info"]/a


#&{station_dictionary}         WNYC 93.9 FM=xpath=//ul[@id="station_dropdown"]/li[@data-stream_slug="wnyc-fm939"]
#...                           WNYC AM 820=xpath=//ul[@id="station_dropdown"]/li[@data-stream_slug="wnyc-am820"]
#...                           WQXR 105.9 FM=xpath=//ul[@id="station_dropdown"]/li[@data-stream_slug="wqxr"]
#...                           Q2 Music=xpath=//ul[@id="station_dropdown"]/li[@data-stream_slug="q2"]
#...                           Operavore=xpath=//ul[@id="station_dropdown"]/li[@data-stream_slug="wqxr-special"]
#...                           NJPR=xpath=//ul[@id="station_dropdown"]/li[@data-stream_slug="njpr"]
#...                           The Jonathan Channel=xpath=//ul[@id="station_dropdown"]/li[@data-stream_slug="jonathan-channel"]

*** Test Cases ***
Navigate to wnyc
    Go To WNYC

#Select Station and Play Each Live Stream
#    @{station_names}=    set variable   ${station_dictionary.keys()}
#    [Tags]
#    :FOR    ${station}  IN   @{station_names}
##    \       debug
#    \       click on streams dropdown
#    \       select stream station  &{station_dictionary}[${station}]
#    \       click listen
#    \       verify station name   ${station}

select station dynamically
    # get webelements returns a list of all matching locators, in this example it would be all station drop down list items
    @{station_objects}    get webelements   xpath=//ul[@id="station_dropdown"]/li

    # for loop with enumerate is a way to loop over a list while mananging the index in the list
    # list example:   @{list} contains    a   b   c
    #                 @{list}[0]  would equal   "a"      a is the list item value and 0 is the index
    #                 @{list}[1]  would equal   "b"      b is the list item value and 1 is the index
    #  enumerating a list would look like this
    #  example        @{list}  contains   (0 , a), (1 , b), (index, value)
    #  The ${index} variable in our loop will be used to pair up the station objects.
    :FOR   ${index}  ${station}  IN ENUMERATE  @{station_objects}
    \
    \      click on streams dropdown   # here your just clicking the drop down menu
    \     log  ${index}
    \     #  here you are storing the text at the location for the xpath given, and the ${index + 1} is just selecting
    \     #  from the list of 7 different stations. Xpath selectors start from 1 and robot/python list start at 0
    \     #  so im just adding 1 to keep the index and matching selectors in sync
    \     ${station_name}=   get text  xpath=//li[@data-stream_slug][${index + 1}]//div[@class="inner"]
    \
    \     # here were again keeping the intended selector in sync by adding 1 to the current value of index variable
    \     # and then selecting the intended station play button
    \      select stream station  xpath=//ul[@id="station_dropdown"]/li[${index + 1}]
    \
    \      click listen
    \      verify station name  ${station_name}

*** Keywords ***
Go to WNYC
    open browser        https://www.wnyc.org        chrome

Click On Streams Dropdown
    click element   ${station_menu}
    wait until element is visible  xpath=//div[@class="head toggle-menu active"]


select stream station
    [Arguments]   ${station_locator}
    click element  ${station_locator}
    sleep  2s

click listen
    click element   ${LISTEN_BUTTON}
    sleep   5s
#    wait until page contains element    xpath=//div[@class="nypr-player-track-info"]/div[2]/div/div/button

verify station name
    [Arguments]  ${station_name}
    wait until page contains element            ${SHOW_NAME_FROM_PERSISTENT_PLAYER}
    ${current_station_name}   get text          ${SHOW_NAME_FROM_PERSISTENT_PLAYER}

    #  here we're expecting the first variable to contain whats in the second
    #  you can call python methods on robot variables which is very useful
    #  so im using the python method lower() on both variables so it can
    #  account for one variable being all caps or first letter being capitalized
    should contain    ${current_station_name.lower()}       ${station_name.lower()}