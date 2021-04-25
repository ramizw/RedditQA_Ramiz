*** Settings ***
Documentation
...    CommonWeb.robot stores Commonly used Keywords across Test Execution
Library    SeleniumLibrary
Resource    ../Tests/RedditMain.robot
Library    Dialogs
Library    Collections
*** Variables ***

*** Keywords ***
Begin Web Test
    ${value} =    get selection from user    Select Browser    Begin Web Test with Chrome Browser    Begin Web Test with headlessChrome
    Run Keyword    ${value}

Begin Web Test with Chrome Browser
    [Documentation]    Begin Test with launching Chrome Browser by disabling browser Notifications
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    go to    ${URL}
    maximize browser window
    sleep    2sec

Begin Web Test with headlessChrome
    [Documentation]    Runs Chrome in Headless mode, meaning no GUI of execution is shown
    open browser    ${URL}    ${BROWSER}
    maximize browser window
    sleep    2sec

End Web Test
    [Documentation]    Closing all instances of Browser
    close all browsers
