*** Settings ***
Documentation     Keywords for managing the shopping cart functionality.
Library     SeleniumLibrary
Resource    cart_locators.robot
Resource    ../product/product_locators.robot


*** Keywords ***
Go To Cart From Modal
    [Documentation]    Navigates to the cart page by clicking the view cart button in the modal.
    Click Element    ${VIEW_CART_IN_MODAL}

Verify Cart Contains Product
    [Documentation]    Verifies the cart contains the specified product by checking for its presence in the cart page.
    [Arguments]    ${id}

    VAR    ${locator}    xpath=//a[@href='/product_details/${id}']
    Element Should Be Visible    ${locator}
