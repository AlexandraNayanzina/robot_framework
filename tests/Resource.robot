*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ReadJsonFile.py

*** Variables ***
${Base_url}=  https://thetestingworldapi.com

*** keywords ***
Fetch and Validate Status Code
    [Arguments]  ${StudentID}  ${ExpectedStatusCode}
    create session  SName  ${Base_url}
    ${response}=  GET On Session  SName  api/studentsDetails/${StudentID}
    ${status_code_string}=  convert to string  ${response.status_code}
    should be equal  ${status_code_string}  ${ExpectedStatusCode}


Fetch and Return Status Code
    [Documentation]  Test is get and print out data about all students
    [Arguments]  ${StudentID}
    create session  SName  ${Base_url}
    ${response}=  GET On Session  SName  api/studentsDetails/${StudentID}
    [Return]  ${response}

Fetch json From File Using Python
    ${jsonbody}=  read_request_content
    [Return]  ${jsonbody}

Welcome user
    [Documentation]   Executing BEFORE the Test Case
    log to console  This is the START of the TC

End Test Case
    [Documentation]   Executing AFTER the Test Case
    log to console  This is the END of the TC
