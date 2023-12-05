*** Settings ***
Library               RequestsLibrary
Resource    ../Resources/Common.robot

*** Test Cases ***

Calling custom keyword test
    # press ctrl + B to see the code of this keyword
    My custom keyword


Get A JSON Body Test on JsonPlaceHolder.com
    [tags]    sanity
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Log    ${response}
    Should Be Equal As Strings    1  ${response.json()}[id]

Get Request using Reqres.in - PASS
    [tags]    smoke
    ${response}=    GET     https://reqres.in/api/users     params=page=2  expected_status=200
    # Check the response code separately
    Should Be Equal As Strings    ${response.status_code}    200
    # Check the response body
    ${json}=    Set Variable    ${response.json()}
    Log    ${json}
    Log    ${json['data']}
    Log    ${json['data'][0]['email']}
    Should Be Equal As Strings    ${json['data'][0]['email']}    michael.lawson@reqres.in

Get Request using Reqres.in - FAIL
    [tags]    smoke
    ${response}=    GET     https://reqres.in/api/v1/users     params=page=2  expected_status=200

Post Request using Reqres.in - PASS
    [tags]    post with data
    ${body}=    Create Dictionary    email=eve.holt@reqres.in    password=cityslicka
    ${response}=    POST    https://reqres.in/api/login     json=${body}    expected_status=200
    ${json}=    Set Variable    ${response.json()}
    Log    ${json}
    Log    ${json['token']}

Post Request using Reqres.in - FAIL
    [tags]    post with data
    ${body}=    Create Dictionary    password=cityslicka
    ${response}=    POST    https://reqres.in/api/login     json=${body}    expected_status=200
    ${json}=    Set Variable    ${response.json()}
    Log    ${json}
    Log    ${json['token']}

Post Request using Reqres.in, Login Unsuccessful - PASS
    [tags]    post with data
    ${body}=    Create Dictionary    password=cityslicka
    ${response}=    POST    https://reqres.in/api/login     json=${body}    expected_status=400
    ${json}=    Set Variable    ${response.json()}
    Log    ${json}
    Log    ${json['error']}
    Should Be Equal As Strings    ${json['error']}    Missing email or username