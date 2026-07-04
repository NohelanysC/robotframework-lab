*** Settings ***
Library     SeleniumLibrary
Resource    login_page.resource
Suite Setup       Open Browser    https://www.saucedemo.com    chrome
Suite Teardown    Close Browser
Test Template     Validar Intento De Login

*** Test Cases ***           USUARIO              CLAVE            RESULTADO_ESPERADO
Usuario estandar             standard_user        secret_sauce     exito
Usuario bloqueado            locked_out_user      secret_sauce     error
Clave incorrecta             standard_user        clave_invalida   error
Usuario vacio                ${EMPTY}             secret_sauce     error

Agregar Producto Al Carrito
    [Template]    NONE
    Go To    https://www.saucedemo.com
    Wait Until Element Is Visible    id:user-name    timeout=5s
    Ingresar Credenciales    standard_user    secret_sauce
    Wait Until Page Contains    Products    timeout=10s
    Agregar Mochila Al Carrito
    Verificar Contador Del Carrito    1
    Sleep    5s

*** Keywords ***
Validar Intento De Login
    [Arguments]    ${usuario}    ${clave}    ${resultado}
    Go To    https://www.saucedemo.com
    Wait Until Element Is Visible    id:user-name    timeout=5s
    Ingresar Credenciales    ${usuario}    ${clave}
    IF    '${resultado}' == 'exito'
        Wait Until Page Contains    Products    timeout=10s
    ELSE
        Wait Until Element Is Visible    css:h3[data-test='error']    timeout=10s
    END

Agregar Mochila Al Carrito
    Click Button    id:add-to-cart-sauce-labs-backpack

Verificar Contador Del Carrito
    [Arguments]    ${cantidad_esperada}
    Wait Until Element Is Visible    css:span.shopping_cart_badge    timeout=5s
    Element Text Should Be    css:span.shopping_cart_badge    ${cantidad_esperada}