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
    Given that user are on workspace with the dataset Bikes
    When user presses 'overview'
    Then user should see overview startpage

Test button to deploy works
    [Documentation]     Test to go into deploy page for dataset Bikes
    [Tags]    LG3-105
    Given that user are on overview startpage
    When user presses 'deploy'
    Then the user should see a option to download dataset

Test button for option no works
    [Documentation]     Test to press 'no' when asked if wanting to download dataset Bikes
    [Tags]    LG3-115
    Given that user has pressed 'download dataset'
    When user presses 'no'
    Then user goes back to dashboard/deploy

Test button for option yes works
    [Documentation]     Test to press 'yes' when asked if wanting to download dataset Bikes
    [Tags]    LG3-116
    Given that user has pressed 'download dataset'
    When user presses 'yes'
    Then user goes back to dashboard/deploy