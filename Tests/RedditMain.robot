*** Settings ***
Documentation
...    Objective of this Assignment is: Write an automated functional UI test suite to test reddit.com.
...    I have used Chrome browser in Normal as well as Headless Mode.

Resource    ../PageObjects/CommonWeb.robot
Resource    ../PageObjects/Login.robot
Resource    ../PageObjects/SubReddit.robot
Resource    ../PageObjects/PostCreateAndComment.robot

Suite Setup    Begin Web Test
Suite Teardown    End Web Test

*** Variables ***
${BROWSER}    headlesschrome
${URL}    http://www.reddit.com

#robot -d Results Tests #Command to Run Test Suite

*** Test Cases ***
As a user, I can log in
    [Documentation]    User Should be Able to Login
    Login.Click on Login Button
    Login.Enter Username, Password and Click on Login Button

As a user, I am able to view one of my subscribed subreddits
    [Documentation]    User should land on to one of the subreddit, here its MavericksDnD and verify correct Landing
    SubReddit.Navigate to subreddit MavericksDnD

As a user, I am able to Create and Comment post
    [Documentation]
    ...    This test case is for the user to create a comment on a post. The comment should have the current date time and my name.
    ...    Eg: “25 Jan 2018 3:30 pm Ramiz Wahab”
    PostCreateAndComment.Create Post with Current Time and Date
    PostCreateAndComment.Comment on Post with Current Time and Date

As a user, I am able to upvote and downvote my comments.
    [Documentation]    Test case is for Upvoting and Downvoting a comment
    PostCreateAndComment.Upvote a Comment
    PostCreateAndComment.Downvote a Comment