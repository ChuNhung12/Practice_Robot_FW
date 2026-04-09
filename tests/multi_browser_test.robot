#🧪 Final #3: Cross-Browser Testing (Level: Advanced)
*** Settings ***
Documentation    Sequential browser testing suite. Run once to execute both Chrome and Edge.
Resource   ../resources/login/login_keywords.robot
Resource   ../variables/login/login_data.robot

Test Teardown    Close Browser


*** Test Cases ***
Login-Logout Flow
    [Documentation]    Login and logout flow. Browser is controlled externally via ${BROWSER}.
    Run Login Test


*** Keywords ***
Run Login Test
    [Documentation]    Common login and logout flow
    Log    Running on browser: ${BROWSER}
    Open Automation Exercise
    Go To Login Page
    Fill Login Form    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Verify Login Success
    Logout From Account