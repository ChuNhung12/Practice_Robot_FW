*** Settings ***
Documentation     Keywords for user registration functionality
Library     String
Library     SeleniumLibrary
Resource    register_locators.robot
Resource    ../common/common_keywords.resource


*** Keywords ***
Go To Signup Page
    [Documentation]    Navigate to the signup page
    Click Element    ${LOGIN_LINK}

Input Signup Info
    [Documentation]    Enter signup name and email, then submit
    [Arguments]    ${name}    ${email}
    Input Text    ${SIGNUP_NAME}    ${name}
    Input Text    ${SIGNUP_EMAIL}    ${email}
    Click Button    ${SIGNUP_BUTTON}

Fill Account Information
    [Documentation]    Fill account information during registration
    [Arguments]    ${password}    ${day}    ${month}    ${year}
    Wait Until Element Is Visible    ${GENDER}    10s
    Click Element    ${GENDER}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Select From List By Value    ${DAY_LOCATOR}    ${day}
    Select From List By Value    ${MONTH_LOCATOR}    ${month}
    Select From List By Value    ${YEAR_LOCATOR}    ${year}

Confirm Newsletter Subscription
    [Documentation]    Subscribe to newsletter and special offers
    Click Element    ${NEWSLETTER}
    Click Element    ${OFFERS}

Fill Address
    [Documentation]    Fill in the address information
    [Arguments]    ${first_name}    ${last_name}    ${address}    ${country}
    ...    ${state}    ${city}    ${zipcode}    ${mobile}
    Input Text    ${FIRST_NAME_LOCATOR}    ${first_name}
    Input Text    ${LAST_NAME_LOCATOR}    ${last_name}
    Input Text    ${ADDRESS_LOCATOR}    ${address}
    Select From List By Value    ${COUNTRY_LOCATOR}    ${country}
    Input Text    ${STATE_LOCATOR}    ${state}
    Input Text    ${CITY_LOCATOR}    ${city}
    Input Text    ${ZIPCODE_LOCATOR}    ${zipcode}
    Input Text    ${MOBILE_LOCATOR}    ${mobile}

Submit Register
    [Documentation]    Submit the registration form
    Click Button    ${CREATE_ACCOUNT}

Verify Register Success
    [Documentation]    Verify that registration was successful
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    10s
    Element Text Should Be    ${SUCCESS_MESSAGE}    ACCOUNT CREATED!

Verify Error Message
    [Documentation]    Verify that an error message is displayed (supports HTML5 native browser validation and DOM messages)
    [Arguments]    ${expected_error}
    ${email_validation}=    Execute JavaScript    var email = document.querySelector('input[data-qa="signup-email"]'); return email ? email.validationMessage : '';
    Run Keyword If    $email_validation != ''    Should Contain    ${email_validation}    ${expected_error}
    ${password_validation}=    Execute JavaScript    var pwd = document.getElementById('password'); return pwd ? pwd.validationMessage : '';
    Run Keyword If    $password_validation != ''    Should Contain    ${password_validation}    ${expected_error}
    Run Keyword If    $email_validation == '' and $password_validation == ''    Wait Until Page Contains    ${expected_error}    10s
    Run Keyword If    $email_validation == '' and $password_validation == ''    Page Should Contain    ${expected_error}