*** Settings ***
Documentation  test
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
#    \       click on streams dro
#    \       select stream station  &{station_dictionary}[${station}]
#    \       click listen
#    \       verify station name   ${station}

select station dynamically
    @{station_objects}    get webelements   xpath=//ul[@id="station_dropdown"]/li
    :FOR   ${station}  IN  @{station_objects}
    \      click on streams dropdown
    \     ${station_name}=   set variable  ${station.find_element_by_xpath("//div[@class='inner']").text}
    \      select stream station  ${station}
    \      click listen
    \      verify station name  ${station_name}

*** Keywords ***
Go to WNYC
    open browser        https://www.wnyc.org        chrome

Click on All Stream link
    click link          xpath=//a[@href="/streams"]


Play Each Live Stream From All Stream Page
    @{station_objects}    get webelements   xpath=//ul[@class="stream-list ember-view"]/li/div[3]
    :FOR   ${station}  IN  @{station_objects}
    \      select stream station    ${station}
#cd
#    \      Verify Stream Show Name From Persistent Player    ${station_objects}

select stream station
    [Arguments]   ${station_locator}
    wait until page contains element  ${station_locator}
    scroll to element  ${station_locator}
    click element  ${station_locator}

#    click element           xpath=//ul[@class="stream-list ember-view"]/li/div[3]


Scroll to element
    [Arguments]  ${element}
    ${y_pos}=  Get Vertical Position  ${element}
    ${x_pos}=  Get Horizontal Position  ${element}
    Execute JavaScript  window.scrollTo(${x_pos}, ${y_pos} - 200);

Verify Stream Show Name From Persistent Player
    [Arguments]  ${station_objects}
    wait until page contains element            ${SHOW_NAME_FROM_PERSISTENT_PLAYER}

    ${current_station_name}   get text          ${SHOW_NAME_FROM_PERSISTENT_PLAYER}
    should contain    ${current_station_name}   ${station_objects}