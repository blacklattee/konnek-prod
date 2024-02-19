*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Division_Add Tags 
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Tags We Konnek
    Klik Button Create New Tag We Konnek
    Input Tag Name We Konnek
    Klik Button Save Name Division We Konnek
    Close Browser
TC_Settings_Division_Delete Tags 
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Tags We Konnek
    Klik Button Delete Tags We Konnek
    Klik Button Cancel Delete Tags We Konnek
    Close Browser
TC_Settings_Division_Edit Tags 
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Tags We Konnek
    Klik Button Edit Tags We Konnek
    Klik Button Save Edit Tags We Konnek
    Close Browser