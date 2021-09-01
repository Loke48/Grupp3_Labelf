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
    Page Should Contain             Datasets

Given that user are on workspace with the dataset Bikes
    Page Should Contain             Bikes

When user presses 'overview'
    Click Element                    xpath://*[@id="app"]/div[6]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/a[1]/div

Then user should see overview startpage
    Wait until Page Contains        Description
    ${URL_OV}                       Get Location
    Should Be Equal                 ${URL_OV}           https://app.labelf.ai/main/57/datasets/219/dashboard/dashboard

Given that user are on overview startpage
    ${URL_OV}                       Get Location
    Should Be Equal                 ${URL_OV}           https://app.labelf.ai/main/57/datasets/219/dashboard/dashboard

When user presses 'deploy'
    Click Element                   xpath://*[@id="app"]/div[3]/div[1]/main/div/div/div[1]/div/div/div/nav/div/a[3]/div

Then the user should see a option to download dataset
    Wait until Page Contains        Accuracy
    ${URL_OV}                       Get Location
    Should Be Equal                 ${URL_OV}            https://app.labelf.ai/main/57/datasets/219/dashboard/deploy
    ${TOOL_TEXT}                    Get Text             xpath://*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div[1]/div[2]/div/nav/div/div
    Should Be Equal                 ${TOOL_TEXT}         Deploy / Download



End Web Test
    Close Browser