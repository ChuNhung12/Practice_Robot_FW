*** Settings ***
Documentation     Keywords for managing the product selection and cart functionality of the ecommerce website.
Library     String
Library     SeleniumLibrary
Resource    product_locators.robot
Resource    ../common/common_keywords.resource


*** Keywords ***
Open Product Detail
    [Documentation]    Open the product detail page for the specified product ID.
    [Arguments]    ${id}

    VAR    ${locator}    xpath=//a[@href='/product_details/${id}']

    Wait Until Element Is Visible    ${locator}    20s

    # remove all ads and overlays before interacting
    Execute JavaScript
    ...    document.querySelectorAll("[id^='aswift_'], iframe, ins.adsbygoogle").forEach(el => el.remove())
    Execute JavaScript    document.querySelectorAll("[style*='z-index: 2147483647']").forEach(el => el.remove())

    Scroll Element Into View    ${locator}
    Wait Until Element Is Enabled    ${locator}    10s
    Click Element    ${locator}

Add Product To Cart
    [Documentation]    Add the currently viewed product to the cart by clicking the add to cart button.
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    10s
    Click Button    ${ADD_TO_CART_BUTTON}
    # Wait for modal confirmation
    Wait Until Element Is Visible    css=button[data-dismiss="modal"]    10s

Verify Product Added To Cart
    [Documentation]    Verify that the product was successfully added to the cart by checking for the confirmation message and modal close button.
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Your product has been added to cart')]    10s
    Element Should Be Visible    css=button[data-dismiss="modal"]
