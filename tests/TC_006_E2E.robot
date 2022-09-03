# POST data
# GET data
# UPDATE data
# DELETE data

*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URL}  https://thetestingworldapi.com

*** Test Cases ***
TC_006_E2E
    # POST Request
    create session  E2E  ${Base_URL}
    ${body}=  create dictionary  first_name=AlexTest  middle_name=Mid  last_name=LastNameTest  date_of_birth=01/01/1990
    ${header}=  create dictionary   Content-Type=application/x-www-form-urlencoded
    ${Response} =  POST On Session  E2E  /api/studentsDetails  data=${body}  headers=${header}
    log to console   ${Response.status_code}
    log to console   ${Response.content}
    log to console   ${Response.headers}

    #Get id
    ${json_response}=  to json  ${Response.content}
    @{id_list} =  get value from json  ${json_response}  id
    ${id}=  get from list  ${id_list}  0
    log to console  ${id}

    Fetch Data and Validate  ${id}

    #PUT Request
    ${body_update}=  create dictionary  id=${id}  first_name=AlexTestUpdated  middle_name=MidUpdated  last_name=LastNameTestUpdated  date_of_birth=12/12/1991
    ${Response_update_request} =  PUT On Session  E2E  /api/studentsDetails/${id}  data=${body_update}
    log to console   ${Response_update_request.status_code}

     #Validate status code
    ${status_code_string}=  convert to string  ${Response_update_request.status_code}
    log to console   ${Response_update_request.status_code}
    log to console   ${Response_update_request.content}
    should be equal  ${status_code_string}  200

   #Convert Response body to JSON format
    ${json_response_updated_data}=  to json  ${Response_update_request.content}

    #Validate updated data
    @{status_list} =  get value from json  ${json_response_updated_data}  status
    ${status}=  get from list  ${status_list}  0
    log to console  ${status}
    should be equal  ${status}  true

    #DELETE Request
    ${Response_delete_request} =  DELETE On Session  E2E  /api/studentsDetails/${id}
    log to console   ${Response_delete_request.content}


    #Convert Response body to JSON format
    ${json_response_delete}=  to json  ${Response_delete_request.content}

    #Validate deleted data
    @{status_list} =  get value from json  ${json_response_delete}  status
    ${status}=  get from list  ${status_list}  0
    should be equal  ${status}  true

*** keywords ***
Fetch Data and Validate
    [Arguments]  ${StudentID}
    #GET data
    ${Response_get_request} =  GET On Session  E2E  /api/studentsDetails/${StudentID}
    log to console   ${Response_get_request.content}

    #Validate status code
    ${status_code_string}=  convert to string  ${Response_get_request.status_code}
    log to console   ${Response_get_request.status_code}
    should be equal  ${status_code_string}  200


