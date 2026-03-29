*** Settings ***
Documentation     Keywords for managing the login functionality of the ecommerce website.
Library     SeleniumLibrary
Resource    login_locators.robot
Resource    ../common/common_keywords.resource


*** Keywords ***
Go To Login Page
    [Documentation]    Navigate to the login page by clicking the login link.
    Click Element    ${LOGIN_LINK}

Fill Login Form
    [Documentation]    Fill in the login form with the provided email and password, then submit.
    [Arguments]    ${email}    ${password}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${PASSWORD_INPUT}    ${password}

    Execute Javascript    document.querySelectorAll('iframe').forEach(e => e.remove())
    Scroll Element Into View    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}

Verify Login Success
    [Documentation]    Verify that the login was successful by checking for the presence of the logged-in user element.
    Element Should Be Visible    ${LOGOUT_LINK}

Logout From Account
    [Documentation]    Log out of the account by clicking the logout link.
    Click Element    ${LOGOUT_LINK}
