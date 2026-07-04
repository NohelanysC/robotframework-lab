*** Settings ***
Documentation    Suite básica con validaciones numéricas y de sistema
Library          OperatingSystem
 
*** Variables ***
${NUM_A}    10
${NUM_B}    5
 
*** Test Cases ***
Validar Suma Correcta
    [Tags]    smoke    matematica
    ${resultado}=    Evaluate    ${NUM_A} + ${NUM_B}
    Should Be Equal As Integers    ${resultado}    15
 
Validar Variable De Entorno
    ${ruta}=    Get Environment Variable    PATH
    Should Not Be Empty    ${ruta}
 
Validar Fecha Actual
    ${fecha}=    Get Time
    Log To Console    Fecha de ejecución: ${fecha}
    Should Not Be Empty    ${fecha}
