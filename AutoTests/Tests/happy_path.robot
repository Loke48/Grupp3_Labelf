*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords_happy_path.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Test Cases ***
Test button to overview works
    [Documentation]     Test to go into overview for dataset Bikes
    [Tags]    LG3-104
    Go to Web Page
    Given that user enters a valid username and password
    When user presses LOGIN
    Then user should be logged in
    Given that user are on workspace with the dataset Bikes
    When user presses 'overview'
    Then user should see overview startpage

Test button to deploy works
    [Documentation]     Test to go into deploy page for dataset Bikes
    [Tags]    LG3-105
    Go to Web Page
    Given that user enters a valid username and password
    When user presses LOGIN
    Then user should be logged in
    Given that user are on workspace with the dataset Bikes
    When user presses 'overview'
    Then user should see overview startpage
    Given that user are on overview startpage
    When user presses 'deploy'
    Then the user should see a option to download dataset

