*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Test Setup  Welcome user
Test Teardown  End Test Case
Resource  Resource.robot

*** Variables ***

${Base_URL}  http://www.thetestingworldapi.com
${Student_id}  28

*** Test Cases ***
TC_001_Get_All_Students
    [Tags]  Smoke
    create session  Get_ALl_Student_Details  ${Base_URL}
    ${response} =  GET On Session  Get_ALl_Student_Details  api/studentsDetails
    log to console   ${response.status_code}

TC_002_Get_Student_Details
    [Tags]  Sanity
    [Documentation]  Test is get and print out data about all students
    create session  Get_Student_Details  ${Base_URL}
    ${response} =  GET On Session  Get_Student_Details  api/studentsDetails/${Student_id}
    ${status_code_string}=  convert to string  ${response.status_code}
    should be equal  ${status_code_string}  200
    log to console  ${response.content}

    #Convert Response body to the JSON format
    ${json_res}=  ${response.content.json()}

    #Validate the data in json_response
    @{status_list} =   get value from json   ${json_res}  status
    ${status}=  get from list  ${status_list}  0
    log to console  ${status}
    should be equal  ${status}  false

    #Validate the data in json_response
    @{msg_list} =  get value from json  ${json_res}  msg
    ${msg}=  get from list  ${msg_list}  0
    log to console  ${msg}
    should be equal  ${msg}  No data Found

*** keywords ***
Welcome user
    [Documentation]   Executing BEFORE the Test Case
    log to console  This is the START of the TC

End Test Case
    [Documentation]   Executing AFTER the Test Case
    log to console  This is the END of the TC







