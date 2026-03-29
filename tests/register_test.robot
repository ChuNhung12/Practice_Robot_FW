#🧪 Final #1: Form Testing & Validation (Level: Intermediate)
*** Settings ***
Documentation       Test suite for user registration functionality

Resource            ../resources/registation/register_keywords.robot
Resource            ../variables/registation/register_data.robot

Test Template       Register With Data

Test Teardown    Close Browser

*** Test Cases ***
Register With Valid Data
    ${VALID_NAME}    dynamic    ${VALID_PASSWORD}


*** Keywords ***
Register With Data
    [Documentation]    Register a new user with the provided credentials
    [Arguments]    ${name}    ${email}    ${password}

    IF    '${email}' == 'dynamic'
        ${email}    Generate Dynamic Email
    ELSE
        VAR    ${email}    ${email}
    END

    Open Automation Exercise
    Go To Signup Page
    Input Signup Info    ${name}    ${email}
    Fill Account Information    ${password}
    Fill Address
    Submit Register
    Verify Register Success