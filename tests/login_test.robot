*** Settings ***
Resource            ../resources/login/login_keywords.robot
Resource            ../variables/Login/login_data.robot

Test Template       Login With Valid Data

Test Teardown    Close Browser

*** Test Cases ***
Login With Valid Data
    ${VALID_EMAIL}    ${VALID_PASSWORD}


*** Keywords ***
Login With Valid Data
    [Documentation]    Login with valid email and password
    [Arguments]    ${email}    ${password}

    Open Automation Exercise
    Go To Login Page
    Fill Login Form    ${email}    ${password}
    Verify Login Success