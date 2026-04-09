*** Variables ***
${LOGIN_LINK}           css=a[href='/login']
${SIGNUP_NAME}          css=input[data-qa='signup-name']
${SIGNUP_EMAIL}         css=input[data-qa="signup-email"]
${SIGNUP_BUTTON}        css=button[data-qa="signup-button"]

${GENDER}               id=id_gender2
${PASSWORD_INPUT}       id=password
${DAY_LOCATOR}          id=days
${MONTH_LOCATOR}        id=months
${YEAR_LOCATOR}         id=years
${NEWSLETTER}           id=newsletter
${OFFERS}               xpath=//label[@for='newsletter']

${FIRST_NAME_LOCATOR}           id=first_name
${LAST_NAME_LOCATOR}            id=last_name
${ADDRESS_LOCATOR}              id=address1
${COUNTRY_LOCATOR}              id=country
${STATE_LOCATOR}                id=state
${CITY_LOCATOR}                 id=city
${ZIPCODE_LOCATOR}              id=zipcode
${MOBILE_LOCATOR}               id=mobile_number
${CREATE_ACCOUNT}       css=button[data-qa="create-account"]
${SUCCESS_MESSAGE}      css=h2[data-qa="account-created"]
