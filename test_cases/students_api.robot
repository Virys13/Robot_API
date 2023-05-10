*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${URL_base}=    http://thetestingworldapi.com


*** Test Cases ***
Test01_Get single_student
    Create Session    Mysession    ${URL_base}
    ${reponse}=    GET On Session    Mysession    /api/studentsDetails/7478331
    Log    ${reponse.status_code}
    Log    ${reponse.content}
    ${reponse_json}=    To Json    ${reponse.content}
    @{firs_name_list}=    Get Value From Json    ${reponse_json}    data.first_name
    ${firs_name}=    Get From List    ${firs_name_list}    0
    Log    ${firs_name}
    Should Be Equal As Strings    ${firs_name}    test
    Should Be Equal As Integers    ${reponse.status_code}    200
    


*** Keywords ***