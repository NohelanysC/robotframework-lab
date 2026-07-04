*** Settings ***
Documentation    Reto de cierre: calculadora básica con Robot Framework

*** Variables ***
${NUM_A}    20
${NUM_B}    4

*** Test Cases ***
Calculadora Basica
    [Documentation]    Calcula suma, resta, multiplicación y división de dos números
    ${suma}=            Evaluate    ${NUM_A} + ${NUM_B}
    ${resta}=            Evaluate    ${NUM_A} - ${NUM_B}
    ${multiplicacion}=    Evaluate    ${NUM_A} * ${NUM_B}
    ${division}=         Evaluate    ${NUM_A} / ${NUM_B}

    Log To Console    Suma: ${suma}
    Log To Console    Resta: ${resta}
    Log To Console    Multiplicación: ${multiplicacion}
    Log To Console    División: ${division}

    Should Be Equal As Numbers    ${multiplicacion}    80