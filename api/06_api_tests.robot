*** Settings ***
Library         RequestsLibrary
Library         Collections
Suite Setup     Preparar Headers

*** Variables ***
${BASE_URL}    https://reqres.in/api
${API_KEY}     free_user_3G3JXF9tOUNS5XQIjZNcmDS2zcz

*** Test Cases ***
Obtener Lista De Usuarios
    Create Session    reqres    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    reqres    url=/users?page=2
    Status Should Be    200    ${response}
    ${total}=    Set Variable    ${response.json()}[total]
    Should Be True    ${total} > 0

Crear Nuevo Usuario
    Create Session    reqres    ${BASE_URL}    headers=${headers}
    &{payload}=    Create Dictionary    name=Carlos    job=QA Engineer
    ${response}=    POST On Session    reqres    /users    json=${payload}
    Status Should Be    201    ${response}
    Should Be Equal    ${response.json()}[name]    Carlos

Obtener Usuario Inexistente
    Create Session    reqres    ${BASE_URL}    headers=${headers}
    ${response}=    GET On Session    reqres    /unknown/999    expected_status=404
    Status Should Be    404    ${response}

*** Keywords ***
Preparar Headers
    &{headers}=    Create Dictionary    x-api-key=${API_KEY}
    Set Suite Variable    ${headers}