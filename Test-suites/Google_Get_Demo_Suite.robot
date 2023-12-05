*** Settings ***
Library               RequestsLibrary

*** Test Cases ***

# My comment
Get Request Test On Google.com
    [Documentation]     We can put any kind of documentation in this section
    [tags]    sanity
    ${response}=    GET  https://www.google.com
    Log    ${response}
    Log    ${response.body}

Get Request With Parameters Test On Google.com
    [tags]    sanity
    ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200
    Log    ${response}