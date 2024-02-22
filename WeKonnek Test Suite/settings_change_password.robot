*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Change Password
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Change Password We Konnek
    Input Current Password
    Input New Password
    Input Confirm Password
    Close Browser

TC_Settings_Login with SPACE
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek

TC_Settings_Change Password_SPACE
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Change Password We Konnek
    Input Current Password
    Input New Password
    Input Confirm Password
    Close Browser