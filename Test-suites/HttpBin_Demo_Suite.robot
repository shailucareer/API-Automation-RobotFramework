
*** Settings ***
Library               RequestsLibrary
Library               CustomAuthenticator.py

*** Test Cases ***

Get With Auth on httpbin.org
    [Tags]  get     get-cert
    ${auth}=  Create List  user   passwd
    Create Session    httpbin    https://httpbin.org     auth=${auth}   verify=${CURDIR}${/}cacert.pem
    ${resp}=  GET On Session  httpbin  /basic-auth/user/passwd
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings  ${resp.json()['authenticated']}  True


Get With Custom Auth on httpbin.org
    [Tags]  get
    ${auth}=    Get Custom Auth    user   passwd
    Create Custom Session    httpbin    https://httpbin.org     auth=${auth}   verify=${CURDIR}${/}cacert.pem
    ${resp}=  GET On Session  httpbin  /basic-auth/user/passwd
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings  ${resp.json()['authenticated']}  True

Get With Digest Auth on httpbin.org
    [Tags]    get   get-cert
    ${auth}=    Create List    user    pass
    Create Digest Session    httpbin    https://httpbin.org    auth=${auth}    debug=3   verify=${CURDIR}${/}cacert.pem
    ${resp}=    GET On Session    httpbin    /digest-auth/auth/user/pass
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['authenticated']}    True

