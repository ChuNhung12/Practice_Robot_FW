*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    register_locators.robot
Resource    ../common/common_keywords.resource


*** Keywords ***
Go To Signup Page
    Click Element    ${LOGIN_LINK}

Input Signup Info
    [Arguments]    ${name}    ${email}
    Input Text    ${SIGNUP_NAME}    ${name}
    Input Text    ${SIGNUP_EMAIL}    ${email}
    Click Button    ${SIGNUP_BUTTON}

Fill Account Information
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${GENDER}    10s
    Click Element    ${GENDER}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Select From List By Value    ${DAY}    12
    Select From List By Value    ${MONTH}    12
    Select From List By Value    ${YEAR}    2012

Fill Address
    Input Text    ${FIRST_NAME}    Nhung
    Input Text    ${LAST_NAME}    Chu
    Input Text    ${ADDRESS}    HungYen
    Select From List By Value    ${COUNTRY}    India
    Input Text    ${STATE}    California
    Input Text    ${CITY}    A
    Input Text    ${ZIPCODE}    10000
    Input Text    ${MOBILE}    08764666556

Submit Register
    Click Button    ${CREATE_ACCOUNT}

Verify Register Success
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    10s
    Element Text Should Be    ${SUCCESS_MESSAGE}    ACCOUNT CREATED!

Close Browser Session
    Close Browser
