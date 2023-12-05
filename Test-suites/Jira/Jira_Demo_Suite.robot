*** Settings ***
Library    RequestsLibrary
Library    JiraAuthenticator.py
Library    OperatingSystem
Library    String


*** Variables ***
${base_url}    https://learnapi.atlassian.net
${auth_header}    ${EMPTY}

*** Test Cases ***
Get issue details from Jira
    ${auth_header}    Get Jira Auth
    ${headers}    Create Dictionary    Authorization=${auth_header}    Accept=application/json    Content-Type=application/json
    ${response}    Get    ${base_url}/rest/api/3/issue/SCRUM-2    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

Create issue(bug) in Jira
    ${auth_header}    Get Jira Auth
    #${file_data}    Get Binary File     Test-suites/Jira/CreateBug.json
    ${file_data}    Get File    Test-suites/Jira/CreateBug.json
    #Log    ${file_data}
    #${file_data}    Replace String      ${file_data}    ${\n}   ${SPACE}
    ${body}     Evaluate    json.loads('''${file_data}''')      json
    ${headers}    Create Dictionary    Authorization=${auth_header}    Accept=application/json    Content-Type=application/json
    ${response}    Post    ${base_url}/rest/api/3/issue    headers=${headers}       json=${body}
    Should Be Equal As Strings    ${response.status_code}    201
