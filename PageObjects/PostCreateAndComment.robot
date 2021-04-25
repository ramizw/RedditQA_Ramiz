*** Settings ***
Documentation
...    Page Object for:-
...    Creating a post with current date, time and my name
...    Also, comment on the same post with current date, time and my name
...    And Upvote, Downvote the comment
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${CREATE_POST_BTN} =    xpath=//input[@placeholder="Create Post"]
${CREATE_POST_TITLE_CLK} =    xpath=//div[@class="_2wyvfFW3oNcCs5GVkmcJ8z"]
${CREATE_POST_TITLE} =    xpath=//textarea[@placeholder="Title"]
${CREATE_POST_TXT} =    xpath=//div[@role="textbox"]
${POST_BTN} =    xpath=//button[@class="_18Bo5Wuo3tMV-RDB8-kh8Z _2iuoyPiKHN3kfOoeIQalDT _10BQ7pjWbeYP63SAPNS8Ts HNozj_dKjQZ59ZsfEegz8 "]
${COMMENT_POST_BTN} =    xpath=//button[@type="submit"]
${UPVOTE_COMMENT} =    xpath=(//i[@class="icon icon-upvote _2Jxk822qXs4DaXwsN7yyHA"])[2]
${DOWNVOTE_COMMENT} =    xpath=(//i[@class="icon icon-downvote ZyxIIl4FP5gHGrJDzNpUC"])[2]

*** Keywords ***
Create Post with Current Time and Date
    [Documentation]
    ...    Create a post. The Post should have the current date time and my name.
    ...    Eg: “25 Jan 2018 3:30 pm Ramiz Wahab”
    ${date_time} =    TimeStamp
    set selenium speed    5 seconds      #5 seconds delay between each step
    click element    ${CREATE_POST_BTN}
    click element    ${CREATE_POST_TITLE_CLK}
    input text    ${CREATE_POST_TITLE}    ${date_time}
    click element    ${CREATE_POST_TXT}
    input text    ${CREATE_POST_TXT}    This is a Test Post
    click element    ${POST_BTN}

Comment on Post with Current Time and Date
    [Documentation]
    ...    Create a comment on a post. The comment should have the current date time and my name.
    ...    Eg: “25 Jan 2018 3:30 pm Ramiz Wahab”
    ${date_time} =    TimeStamp
    set selenium speed    5 seconds
    click element    ${CREATE_POST_TXT}
    input text    ${CREATE_POST_TXT}    ${date_time}
    click element    ${COMMENT_POST_BTN}

Upvote a Comment
    [Documentation]    Upvote the comment
    click element    ${UPVOTE_COMMENT}

Downvote a Comment
    [Documentation]    Downvote the comment
    click element    ${DOWNVOTE_COMMENT}

TimeStamp
    [Documentation]    Get Current Date and Time in Desired Format
    ${current_date_time} =    get current date
    ${converted_date_time} =    convert date    ${current_date_time}    result_format=%d %b %Y %I:%M %p Ramiz Wahab
    return from keyword    ${converted_date_time}

