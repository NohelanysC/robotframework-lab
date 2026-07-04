*** Settings ***
Documentation    Mi primer caso de prueba en Robot Framework
 
*** Test Cases ***
Saludo Inicial
    [Documentation]    Verifica que el saludo se construya correctamente
    ${nombre}=    Set Variable    Estudiante
    ${saludo}=    Catenate    Hola,   ${nombre}!
    Log To Console    ${saludo}
    Should Contain    ${saludo}   Estudiante
