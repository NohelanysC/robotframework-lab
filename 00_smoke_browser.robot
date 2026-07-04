*** Settings ***
Library    SeleniumLibrary
 
*** Test Cases ***
Abrir Navegador De Prueba
    Open Browser    https://www.saucedemo.com    chrome
    Title Should Be    Swag Labs
    [Teardown]    Close Browser
