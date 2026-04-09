#🧪 Final #1: Form Testing & Validation (Level: Intermediate)
*** Settings ***
Documentation       🧪 Final #1: Form Testing & Validation (Level: Intermediate)
...    Test suite for user registration functionality

Resource            ../resources/registration/register_keywords.robot
Resource            ../variables/registration/register_data.robot
Test Template       Register With Data And Expect Result

Test Teardown    Close Browser


*** Test Cases ***
Register With Valid Data
    ${VALID_NAME}    dynamic    ${VALID_PASSWORD}    ${EMPTY}

Register With Invalid Email
    ${VALID_NAME}    ${INVALID_EMAIL_INPUT}    ${VALID_PASSWORD}    ${INVALID_EMAIL_ERROR}

Register With Existing Email
    ${VALID_NAME}    ${EXISTING_EMAIL}    ${VALID_PASSWORD}    ${EXISTING_EMAIL_ERROR}


*** Keywords ***
Register With Data And Expect Result
    [Documentation]    Register a user and verify expected result (success or error message)
    [Arguments]    ${name}    ${email}    ${password}    ${expected_error}

    IF    '${email}' == 'dynamic'
        ${email}    Generate Dynamic Email
    END

    Open Automation Exercise
    Go To Signup Page
    Input Signup Info    ${name}    ${email}

    IF    $expected_error == ''
        Fill Account Information    ${password}    ${BIRTH_DAY}    ${BIRTH_MONTH}    ${BIRTH_YEAR}
        Confirm Newsletter Subscription
        Fill Address    ${FIRST_NAME_DATA}    ${LAST_NAME_DATA}    ${ADDRESS_DATA}
        ...    ${COUNTRY_DATA}    ${STATE_DATA}    ${CITY_DATA}    ${ZIPCODE_DATA}    ${MOBILE_DATA}
        Submit Register
        Verify Register Success
    ELSE
        Verify Error Message    ${expected_error}
    END
