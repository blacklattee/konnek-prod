*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Greetings
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Greetings We Konnek
    Klik Togle ON/OFF Status Keyword We Konnek
    Klik Togle ON/OFF Status Greetings We Konnek
    Klik Checkbox Add Division Greetings We Konnek 
    Klik Togle ON/OFF Status Queue Greetings We Konnek
    Klik Togle ON/OFF Status Assign Greetings We Konnek
    Klik Togle ON/OFF Status Close Greetings 
    Klik Button Save Greetings 
    Close Browser

