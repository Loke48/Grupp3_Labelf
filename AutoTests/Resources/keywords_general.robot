*** Variables ***
${BROWSER}      chrome
${URL}          https://app.labelf.ai/login/

*** Keywords ***
Begin Web Test
    Open browser                     about:blank             ${BROWSER}
    Set selenium timeout             10

Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                           ${URL}

Verify Page Loaded
    ${LINK_TEXT}                    Get Title
    Should Be Equal                 ${LINK_TEXT}      Labelf
    Wait until Page Contains        Labelf

Given that user enters a valid username and password
    Input text                      xpath://*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input            samuelalundborg@gmail.com
    Input text                      xpath://*[@id="password"]               ITHS

When user presses LOGIN
    Click Button                    xpath://*[@id="app"]/div/main/div/div/div/div/div/div[2]/button

Then user should be logged in
    Wait until Page Contains        Logged in
    Go to                           https://app.labelf.ai/main/57/datasets/view
    Wait until Page Contains        Datasets
    Page Should Contain             Datasets

End Web Test
    Close Browser