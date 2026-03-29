*** Variables ***
${PROCESS_CHECKOUT_BUTTON}      css=a.check_out
${PAYMENT_BUTTON}               css=a[href="/payment"]
${NAME_ON_CARD}                 css=input[data-qa="name-on-card"]
${CARD_NUMBER_INPUT}            css=input[data-qa="card-number"]
${CVC_INPUT}                    css=input[data-qa="cvc"]
${EXPIRY_MONTH_INPUT}           css=input[data-qa="expiry-month"]
${EXPIRY_YEAR_INPUT}            css=input[data-qa="expiry-year"]
${PAY_AND_CONFIRM_BUTTON}       css=button[data-qa="pay-button"]
${SUCCESS_MESSAGE}              xpath=//p[contains(text(),'Your order has been confirmed')]
