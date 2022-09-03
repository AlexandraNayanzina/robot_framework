*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  Resource.robot

*** Variables ***
${Base_URL}  https://thetestingworldapi.com

*** Test Cases ***
TC_002_Post_Request
    create session  Add_Data  ${Base_URL}
    ${body}=  Fetch json From File Using Python
    ${header}=  create dictionary   Content-Type=application/x-www-form-urlencoded
    ${Response} =  POST On Session  Add_Data  /api/studentsDetails  data=${body}  headers=${header}
    log to console   ${Response.status_code}
    log to console   ${Response.content}

    #Validate status code
    ${status_code_string}=  convert to string  ${Response.status_code}
    should be equal  ${status_code_string}  201



