*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Documentation  The Suit Fetches User Data

*** Variables ***
${Base_URL}  http://www.thetestingworldapi.com

*** Test Cases ***
TC_001_Get_StudentDetails_id50
    create session  Get_ALl_Student_Details  ${Base_URL}
    ${response} =  GET On Session  Get_ALl_Student_Details  api/studentsDetails/50
    log to console   ${response.content}


TC_001_Get_StudentDetails_id28
    create session  Get_ALl_Student_Details  ${Base_URL}
    ${response} =  GET On Session  Get_ALl_Student_Details  api/studentsDetails/28
    log to console   ${response.content}