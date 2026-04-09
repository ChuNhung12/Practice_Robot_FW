#🧪 Final #2: E2E Flow – Online Shopping (Level: Advanced)
*** Settings ***
Documentation     End-to-end test for ecommerce flow: login, product selection, cart, checkout, payment, and confirmation.
Resource    ../resources/login/login_keywords.robot
Resource    ../resources/product/product_keywords.robot
Resource    ../resources/cart/cart_keywords.robot
Resource    ../resources/checkout/checkout_keywords.robot
Resource   ../variables/login/login_data.robot
Resource    ../variables/product/product_data.robot
Resource    ../variables/payment_info/payment_data.robot

Test Teardown    Close Browser


*** Test Cases ***
Complete Ecommerce Flow
    [Documentation]    Full ecommerce flow: Login > Product > Cart > Checkout > Payment > Confirmation
    Open Automation Exercise
    Go To Login Page
    Fill Login Form    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Verify Login Success
    Go To Product Page
    Open Product Detail    ${PRODUCT_ID}
    Add Product To Cart
    Verify Product Added To Cart
    Go To Cart From Modal
    Verify Cart Contains Product    ${PRODUCT_ID}
    Go To Checkout Page
    Go To Payment Page
    Fill Payment Information    ${NAME}    ${CARD_NUMBER}    ${CVC}    ${EXPIRY_MONTH}    ${EXPIRY_YEAR}
    Pay And Confirm Order
    Verify Order Success