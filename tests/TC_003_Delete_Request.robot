*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***

${Base_URL}  https://thetestingworldapi.com

*** Test Cases ***
TC_002_Get_Request_With_Parameters
    create session  Get_With_Params  ${Base_URL}
    ${Response} =  DELETE On Session  Get_With_Params  /api/studentsDetails/28
    log to console   ${Response.status_code}
    log to console   ${Response.content}

    #Validate status code
    ${status_code_string}=  convert to string  ${Response.status_code}
    should be equal  ${status_code_string}  200

    #Convert Response body to JSON format
    ${json_response}=  to json  ${Response.content}

     #Validate data
    @{status_list} =  get value from json  ${json_response}  status
    ${status}=  get from list  ${status_list}  0
    log to console  ${status}
    should be equal  ${status}  false

