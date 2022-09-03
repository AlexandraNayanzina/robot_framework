*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***

${Base_URL}  https://reqres.in

*** Test Cases ***
TC_002_Get_Request_With_Parameters
    create session  Get_With_Params  ${Base_URL}
    ${parameters}=  create dictionary  page=2
    ${Response} =  GET On Session  Get_With_Params  /api/users  params=${parameters}
    log to console   ${Response.status_code}
    log to console   ${Response.content}

    #Validate status code
    ${status_code_string}=  convert to string  ${Response.status_code}
    should be equal  ${status_code_string}  200

    #Convert Response body to JSON format
    ${json_response}=  to json  ${Response.content}

    #Validate data
    @{first_name_list} =  get value from json  ${json_response}  data[1][first_name]
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}
    should be equal  ${first_name}  Lindsay

     #Validate data
    @{last_name_list} =  get value from json  ${json_response}  data[1][last_name]
    ${last_name}=  get from list  ${last_name_list}  0
    log to console  ${last_name}
    should be equal  ${last_name}  Ferguson