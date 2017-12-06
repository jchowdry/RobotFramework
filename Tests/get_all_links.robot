*** Settings ***
Library  Selenium2Library
Library     Collections



*** Variables ***



*** Test Cases ***
Open schedule page and verify the url
    open browser  http://wnyc.demo2.wnyc.net     chrome
    Maximize Browser Window
    comment  count number of links on the page
    ${AllLinksCount}=    Get Matching Xpath Count    //a
    comment     log all link counts
    log     ${AllLinksCount}

    comment     create a list to store link texts
    @{LinkItems}    create list
    comment     loop through all link and store links value that has lenth more than 1 character
    :FOR    ${INDEX}   IN RANGE    1   ${AllLinksCount}
    \       log     ${INDEX}
    \       ${linktext}=    get text        xpath=(//a)[${INDEX}]
    \       log     ${linktext}
    \       ${LinkLength}=      get length      ${linktext}
    \       run keyword if  ${LinkLength}>1     Append To List      ${LinkItems}${Linktext}
    ${linkSize}=    get length  ${LinkItems}
    log     ${LinkSize}

    comment     Print all links
    :For    ${Element}  IN  @{LinkItems}
    \       log  ${Element}

    close browser


#    ${url} =  Execute Javascript  return window.location.href;
#    log     ${url}
