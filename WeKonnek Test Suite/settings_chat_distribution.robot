*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Chat Distribution
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Chat Distribution We Konnek
    Klik Togle ON/OFF Status Auto Assign Chat Distribution We Konnek 
    Klik Togle ON/OFF Set Chat Limit Distribution We Konnek
    Close Browser
