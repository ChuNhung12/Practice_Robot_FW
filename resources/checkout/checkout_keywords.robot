*** Settings ***
Documentation     Keywords for managing the checkout and payment process of the ecommerce website.
Library     SeleniumLibrary
Resource    checkout_locators.robot


*** Keywords ***
Go To Checkout Page
    [Documentation]    Navigate to the checkout page by clicking the process checkout button.
    Wait Until Element Is Visible    ${PROCESS_CHECKOUT_BUTTON}
    Click Element    ${PROCESS_CHECKOUT_BUTTON}

    Wait Until Element Is Visible    ${PAYMENT_BUTTON}    10s

Go To Payment Page
    [Documentation]    Navigate to the payment page by clicking the payment button.
    Click Element    ${PAYMENT_BUTTON}
    Wait Until Element Is Visible    ${NAME_ON_CARD}    10s

Fill Payment Information
    [Documentation]    Fill in the payment form with the provided card details.
    [Arguments]    ${name}    ${card_number}    ${cvc}    ${expiry_month}    ${expiry_year}
    Input Text    ${NAME_ON_CARD}    ${name}
    Input Text    ${CARD_NUMBER_INPUT}    ${card_number}
    Input Text    ${CVC_INPUT}    ${cvc}
    Input Text    ${EXPIRY_MONTH_INPUT}    ${expiry_month}
    Input Text    ${EXPIRY_YEAR_INPUT}    ${expiry_year}

Pay And Confirm Order
    [Documentation]    Submit the payment by clicking the pay and confirm order button.
    Wait Until Element Is Visible    ${PAY_AND_CONFIRM_BUTTON}    10s
    Click Element    ${PAY_AND_CONFIRM_BUTTON}

Verify Order Success
    [Documentation]    Verify that the order was successfully completed by checking for the success message.
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    20s
    Element Should Be Visible    ${SUCCESS_MESSAGE}
