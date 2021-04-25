*** Settings ***
Documentation    Page Object for Login Functionality with Locators and Keywords
Library    SeleniumLibrary
Library    OperatingSystem
*** Variables ***
${LOGIN_BTN} =    xpath=//a[text()="Log In"]
${USERNAME} =    name=username
${PASSWORD} =    id=loginPassword
${LOGIN_IFRAME} =    css=#SHORTCUT_FOCUSABLE_DIV > div:nth-child(6) > div._1UtFUrE2ijAe5ba5uPgcfQ > div > iframe
${LOGIN_BTN_IFRAME} =    xpath=(//button[@type="submit"])[1]

*** Keywords ***
Click on Login Button
    click element    ${LOGIN_BTN}
    sleep    5sec

Enter Username, Password and Click on Login Button

    ${json} =    get file    ./JsonFiles/TestData.json
    ${object} =    evaluate    json.loads('''${json}''')    json

    select frame    ${LOGIN_IFRAME}
    input text    ${USERNAME}    ${object["username"]}
    input text    ${PASSWORD}    ${object["password"]}
    set focus to element    ${LOGIN_BTN_IFRAME}
    click element    ${LOGIN_BTN_IFRAME}
    sleep    5sec

