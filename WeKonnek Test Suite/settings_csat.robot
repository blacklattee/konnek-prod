*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_CSAT
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu CSAT We Konnek
    Klik Hover Topic CSAT We Konnek
    Klik Button Togle ON/OFF Status Topics CSAT We Konnek
    Klik Button Yes Confirmation Togle ON/OFF Status Topics CSAT We Konnek 
    Klik Button Add New Topics CSAT We Konnek
    Input Title Topics CSAT We Konnek
    Klik Button Channel Topics CSAT We Konnek 
    Klik Checkmark Channel WA Topics CSAT We Konnek
    Input Question Topics CSAT We Konnek
    Input Positive Response Question CSAT We Konnek
    Input Neutral Response Question CSAT We Konnek
    Input Negative Response Question CSAT We Konnek
    Klik Button Next Topics CSAT We Konnek
    Klik Button Save Topics CSAT We Konnek
    Klik Button Yes Confirmation Save Topics CSAT We Konnek 
    Close Browser

TC_Settings_CSAT_Button Save Sorting
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    # Refresh Page CSAT
    Klik Menu CSAT We Konnek
    Klik Hover Topic CSAT We Konnek 
    Klik Tab Inactive Topic CSAT We Konnek
    Klik Button Togle ON/OFF Status Inactive Topics CSAT We Konnek 
    Klik Button Yes Confirmation Save Topics CSAT We Konnek
    # Klik Button Move Row Down Topics We Konnek 
    # Klik Button Save Sorting Topics We Konnek 
    Close Browser
   
TC_Settings_CSAT_Button Save Sorting_Arrow Down
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    # Refresh Page CSAT
    Klik Menu CSAT We Konnek
    Klik Hover Topic CSAT We Konnek 
    # Klik Tab Inactive Topic CSAT We Konnek
    Klik Button Togle ON/OFF Status Inactive Topics CSAT We Konnek 
    Klik Button Yes Confirmation Save Topics CSAT We Konnek
    # Klik Button Move Row Down Topics We Konnek 
    # Klik Button Save Sorting Topics We Konnek 
    Close Browser



