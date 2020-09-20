*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  BuiltIn

*** Variables ***
${Browser}              Chrome
${url}                  http://www.automationpractice.com/
${email}                emaiusss@domain.com.br
${emailfail}            Invalid email address.
${emailrepeat}          An account using this email address has already been registered. Please enter a valid password or request a new one. 
${name}                 emails
${lastname}             test
${password}             passtest
${address}              simplesadress
${city}                 Test City
${zip}                  00000
${mobile}               99999999
${message}              Product successfully added to your shopping cart
${fail}                 Your shopping cart is empty.
${successpurchase}      Your order on My Store is complete.

*** Keywords ***

Confirm test
    Capture Page Screenshot
    