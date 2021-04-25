*** Settings ***
Documentation
...    Page Object for Subreddit
...    Stores keywords and locators for MAVERICKDnD subreddiit
...    Global static variables, locators are defined in 'Variables' section
Library    SeleniumLibrary

*** Variables ***
${HOME_DROPDOWN} =    xpath=//button[@class="h-jI8r2f9ozTNqu_2TBeY"]
${SUBREDDIT_MAVERICKDnD} =    xpath=//a[@aria-label="r/MavericksDnD"]
${SUBREDDIT_LABEL} =    xpath=//h1[text()='For the Mavericks Dudes and Dudettes']
${VERIFY_LABEL} =    For the Mavericks Dudes and Dudettes

*** Keywords ***
Navigate to subreddit MavericksDnD
    [Documentation]    User moves to subreddit MavericksDnD and verifies correct landing
    click element    ${HOME_DROPDOWN}
    click link    ${SUBREDDIT_MAVERICKDnD}
    sleep    3sec
    wait until page contains element    ${SUBREDDIT_LABEL}
    ${ElementText} =    get text    ${SUBREDDIT_LABEL}
    should be equal as strings    ${ElementText}    ${VERIFY_LABEL}    ignore_case=true
    sleep    3sec