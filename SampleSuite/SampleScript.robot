*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this Keywords.resource in loaded.
Library           RequestsLibrary
Resource    ../Resources/Common.robot


*** Variables ***
${GLOBAL_VAR1}    This is a global variable!
${ANOTHER_GLOBAL}=    Equal sign is optional but sometimes helpful.


*** Keywords ***
My custom keyword within this file
    Log    Hello this is my custom keyword within this file


*** Test Cases ***
Test Case With Variables
    Log     ${GLOBAL_VAR1}
    Log     String concadination Is simple with "${GLOBAL_VAR1}" and "${ANOTHER_GLOBAL}"
    Log     Escaping with backslash. Then you can use names like \${GLOBAL_VAR1}

Test Case With External Keywords
    My custom keyword
    My custom keyword within this file