*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Library        String
Resource       variables/kanban-variables.robot

*** Keywords ***
Include Webdriver
    Append to environment variable    PATH    ${EXEC_DIR}/webdrivers

Wait Until Succeeds
    [Arguments]    ${keyword}    @{args}
    Wait Until Keyword Succeeds    8sec    200ms    ${keyword}    @{args}

Open Application
    Include Webdriver
    Set Selenium Speed    100ms
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window