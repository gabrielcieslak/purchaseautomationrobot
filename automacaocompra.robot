*** Settings ***
Resource    resources.robot

Test Teardown   Confirm test

*** Test Cases ***
Access ecomerce
    Open Browser                              ${url}                    ${Browser}
Click on product
    Click Element                             xpath=//*[@id="homefeatured"]/li[2]/div/div[2]/div[2]/a[1]/span
Check success message
    Wait Until Element Is Visible             class=clearfix
    Page Should Contain                       ${message}
Proceed to checkout
    Go To                                     http://automationpractice.com/index.php?controller=order
    Page Should Contain Element               id=cart_title
Run Keyword If          page Should Contain           ${fail}               
    log to console      refreshed page here
    Reload Page
Check chart
    Element Should be Visible                 id=product_2_7_0_0
    ${price}=   Get Text                      xpath=//*[@id="total_price"]
    Log to console                            ${price}       
    Click Element                             xpath=//*[@id="center_column"]/p[2]/a[1]
Creat an account
    input text                                id=email_create           ${email}
    Page Should Not Contain                   ${emailfail}
    Page Should Not Contain                   ${emailrepeat}
Creat an account step 2
    click Element                             xpath=//*[@id="SubmitCreate"]/span
    Wait Until Element Is Visible             id=account-creation_form
    click Element                             xpath=//*[@id="id_gender1"]
    input text                                id=customer_firstname     ${name}
    input text                                id=customer_lastname      ${lastname}
    input text                                id=email                  ${email} 
    input password                            id=passwd                 ${password} 
    Select From List By Value                 id=days                   26
    Select From List By Value                 id=months                 10
    Select From List By Value                 id=years                  1993
Creat an account check adress
    ${valuename}=   Get Element Attribute           xpath=//*[@id="firstname"]       attribute=value
    Should be equal                           ${valuename}              ${name}
    ${valuelastname}=   Get Element Attribute       xpath=//*[@id="lastname"]       attribute=value
    Should be equal                           ${valuelastname}          ${lastname}
    input text                                id=address1               ${address}
    input text                                id=city                   ${city}
    Select From List By Value                 id=id_state               3
    input text                                id=postcode               ${zip}
    input text                                id=phone_mobile           ${mobile}
    input text                                id=alias                  ${address}
    
Check address
    Click Element                             xpath=//*[@id="submitAccount"]
    Page Should Contain                       ${name}
    Page Should Contain                       ${lastname}
    Page Should Contain                       ${address}
    Page Should Contain                       ${mobile}
Check Shipping
    click Element                             xpath=//*[@id="center_column"]/form/p/button
    click Element                             xpath=//*[@id="cgv"]
Check purchase
    click Element                             xpath=//*[@id="form"]/p/button
    ${finalprice}=  Get text                  xpath=//*[@id="total_price"]
    Log to console                            ${finalprice}             
Select payment by bank wire
    click Element                             xpath=//*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
    Element Should be Visible                 class=page-subheading
Confirm purchase
    click Element                             xpath=//*[@id="cart_navigation"]/button
    wait until Element is Visible             id=center_column
    page Should Contain                       ${successpurchase}

