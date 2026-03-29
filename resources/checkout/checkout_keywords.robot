*** Settings ***
Library     SeleniumLibrary
Resource    checkout_locators.robot


*** Keywords ***
Go To Checkout Page
    Wait Until Element Is Visible    ${PROCESS_CHECKOUT_BUTTON}
    Click Element    ${PROCESS_CHECKOUT_BUTTON}

    Wait Until Element Is Visible    ${PAYMENT_BUTTON}    10s

Go To Payment Page
    Click Element    ${PAYMENT_BUTTON}
    Wait Until Element Is Visible    ${NAME_ON_CARD}    10s

Fill Payment Information
    [Arguments]    ${name}    ${card_number}    ${cvc}    ${expiry_month}    ${expiry_year}
    Input Text    ${NAME_ON_CARD}    ${name}
    Input Text    ${CARD_NUMBER_INPUT}    ${card_number}
    Input Text    ${CVC_INPUT}    ${cvc}
    Input Text    ${EXPIRY_MONTH_INPUT}    ${expiry_month}
    Input Text    ${EXPIRY_YEAR_INPUT}    ${expiry_year}

Pay And Confirm Order
    Wait Until Element Is Visible    ${PAY_AND_CONFIRM_BUTTON}    10s
    Click Element    ${PAY_AND_CONFIRM_BUTTON}

Verify Order Success
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    20s
    Element Should Be Visible    ${SUCCESS_MESSAGE}
