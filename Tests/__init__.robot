*** Settings ***
Documentation
...    Objective of this Assignment is: Write an automated functional UI test suite to test reddit.com.
...    This File sets up the Environment Variables for the entire suite for execution
...    This file makes a call to the Python file present in ExternalKeywords Folder
Library    OperatingSystem
Library    ../ExternalKeywords/EnvironmentVar.py
Suite Setup    Set up Environment Variables
Suite Teardown    Reset Environment Variables
*** Variables ***


*** Keywords ***
Set up Environment Variables
    [Documentation]    Calling EnvironmentVar.py file from ExternalKeywords Folder
    Environment_Variable_Setup
Reset Environment Variables
    LOG    Reset Complete