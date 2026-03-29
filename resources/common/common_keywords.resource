*** Settings ***
Documentation     Common keywords for ecommerce tests
Library    String
Library    SeleniumLibrary


*** Variables ***
${BROWSER}    chrome


*** Keywords ***
Open Automation Exercise
    [Documentation]    Open the Automation Exercise website and prepare for testing
    Open Browser    https://automationexercise.com/    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=a[href='/products']    20s
    Execute JavaScript
    ...    document.querySelectorAll("[id^='aswift_'], iframe, ins.adsbygoogle")
    ...    .forEach(el => el.remove())

Go To Product Page
    [Documentation]    Navigate to the product page
    Click Element    css=a[href='/products']
    Execute JavaScript
    ...    document.querySelectorAll("[id^='aswift_'], iframe, ins.adsbygoogle")
    ...    .forEach(el => el.remove())

Generate Dynamic Email
    [Documentation]    Generate a dynamic email address
    [Arguments]    ${base_name}=nhungtest    ${domain}=gmail.com
    ${random_suffix}    Generate Random String    5    [NUMBERS]
    VAR    ${dynamic_email}    ${base_name}+${random_suffix}@${domain}
    RETURN    ${dynamic_email}
