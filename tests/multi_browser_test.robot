#🧪 Final #3: Cross-Browser Testing (Level: Intermediate)
*** Settings ***
Resource   ../resources/login/login_keywords.robot
Resource   ../resources/product/product_keywords.robot
Resource   ../resources/cart/cart_keywords.robot
Resource   ../resources/checkout/checkout_keywords.robot
Resource   ../variables/login/login_data.robot

Test Teardown    Close Browser

*** Test Cases ***
Login-Logout Flow on Chrome
    [Documentation]    Login and logout flow on Chrome
    Set Test Variable    ${BROWSER}    chrome
    Run Login Test

Login-Logout Flow on Firefox
    [Documentation]    Login and logout flow on Firefox
    Set Test Variable    ${BROWSER}    firefox
    Run Login Test

*** Keywords ***
Run Login Test
    [Documentation]    Common login and logout test steps
    Open Automation Exercise
    Go To Login Page
    Fill Login Form    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Verify Login Success
    Logout From Account