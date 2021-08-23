*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords_general.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Test Cases ***

Test to log into app.lablef
  [Documentation]    Test to verify the login-page works
  [Tags]             JiraTag
# JiraTag = LG3-21 etc
  Go to Web Page
  Given that user enters a valid username and password
  When user presses LOGIN
  Then user should be logged in
#__________________________________________________

