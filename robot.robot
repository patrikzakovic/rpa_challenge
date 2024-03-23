*** Settings ***
Documentation      Robot pre vyriesenie RPA challenge na stranke rpachallenge.com,
...                ktory pozostava z viacnasobneho vyplnenia formulara s datami, ktore
...                su nacitane zo stiahnuteho MS Excel suboru.

Library            Browser    strict=${False}
Library            RPA.HTTP
Library            RPA.Excel.Files


*** Tasks ***
Solve Rpa Challenge
   Start Challenge
   Fill Forms
   Verify Result


*** Keywords ***
Start Challenge
     New Browser    browser=chromium    headless=false
     New Page    url=https://rpachallenge.com
     RPA.HTTP.Download    
     ...    url=https://rpachallenge.com/assets/downloadFiles/challenge.xlsx
     ...    overwrite=${True}
     Click    xpath=//button[text()="Start"]

Fill Forms
    ${persons}=    Get List Of Persons From Excel File
    FOR    ${person}    IN    @{persons}
        Fill And Submit Form    ${person}
    END

Fill And Submit Form
    [Arguments]    ${person}
    
    Fill Text    xpath=//input[@ng-reflect-name="labelFirstName"]    ${person}[First Name]  
    Fill Text    xpath=//input[@ng-reflect-name="labelLastName"]    ${person}[Last Name]
    Fill Text    xpath=//input[@ng-reflect-name="labelCompanyName"]    ${person}[Company Name]
    Fill Text    xpath=//input[@ng-reflect-name="labelRole"]    ${person}[Role in Company]
    Fill Text    xpath=//input[@ng-reflect-name="labelAddress"]    ${person}[Address]
    Fill Text    xpath=//input[@ng-reflect-name="labelEmail"]    ${person}[Email]
    Fill Text    xpath=//input[@ng-reflect-name="labelPhone"]    ${person}[Phone Number]
    Click        xpath=//input[@value="Submit"]

Get List Of Persons From Excel File
    RPA.Excel.Files.Open Workbook    challenge.xlsx
    ${persons}=    RPA.Excel.Files.Read Worksheet As Table  header=True
    RPA.Excel.Files.Close Workbook

    RETURN    ${persons}

Verify Result
    Wait For Elements State    
    ...    text=Your success rate is 100%
    ...    state=visible
    ...    timeout=10s
    Take Screenshot  ${OUTPUT_DIR}${/}result.png    selector=css=div.congratulations