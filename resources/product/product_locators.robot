*** Variables ***
${PRODUCT_DETAIL_LINK}      css=a[href="/product_details/{}"]
${ADD_TO_CART_BUTTON}       css=.product-information button.cart
${PRODUCT_ADDED_MESSAGE}    xpath=//p[contains(text(), 'Your product has been added to cart')]
${MODAL_CLOSE_BUTTON}       css=button[data-dismiss="modal"]