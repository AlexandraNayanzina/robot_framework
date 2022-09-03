*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  Resource.robot


*** Variables ***

${Base_URL}  http://www.thetestingworldapi.com

*** Test Cases ***
TC_001_Get_All_Students
    Fetch and Validate Status Code  50  200
    ${st_code}=  Fetch and Return Status Code  50
    log to console  ${st_code.status_code}

    ${json_from_file}=  Fetch json From File Using Python
    log to console  ${json_from_file}







